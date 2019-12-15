//=============================================================================
// KFWeap_AssaultRifle_M16M203
//=============================================================================
// An M16 M203 Assault Rifle
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//	-Brooks Butler
//=============================================================================
class KFWeap_AssaultRifle_M4A1GL extends KFWeap_RifleBase;

var(Positioning) vector SecondaryFireOffset;

const SecondaryFireAnim = 'Shoot_Secondary';
const SecondaryFireIronAnim = 'Shoot_Secondary_Iron';

const SecondaryReloadAnim = 'Reload_Secondary';
const SecondaryReloadAnim_Elite = 'Reload_Secondary_Elite';

// Used on the server to keep track of grenades
var int ServerTotalAltAmmo;

static simulated event EFilterTypeUI GetAltTraderFilter()
{
	return FT_Explosive;
}

/** Instead of switch fire mode use as immediate alt fire */
simulated function AltFireMode()
{
	if ( !Instigator.IsLocallyControlled() )
	{
		return;
	}

	// StartFire - StopFire called from KFPlayerInput
	StartFire(ALTFIRE_FIREMODE);
}

/**
 * Initializes ammo counts, when weapon is spawned.
 */
function InitializeAmmo()
{
	Super.InitializeAmmo();

	// Add Secondary ammo to our secondary spare ammo count both of these are important, in order to allow dropping the weapon to function properly.
	SpareAmmoCount[1]	= Min(SpareAmmoCount[1] + InitialSpareMags[1] * default.MagazineCapacity[1], GetMaxAmmoAmount(1) - AmmoCount[1]);
	ServerTotalAltAmmo += SpareAmmoCount[1];

	// Make sure the server doesn't get extra shots on listen servers.
	if(Role == ROLE_Authority && !Instigator.IsLocallyControlled())
	{
		ServerTotalAltAmmo += AmmoCount[1];
	}
}

/**
 * @see Weapon::ConsumeAmmo
 */
simulated function ConsumeAmmo( byte FireModeNum )
{
	local byte AmmoType;
	local bool bNoInfiniteAmmo;
	local int OldAmmoCount;

	if(UsesSecondaryAmmo() && FireModeNum == ALTFIRE_FIREMODE && Role == ROLE_Authority && !Instigator.IsLocallyControlled())
	{
		AmmoType = GetAmmoType(FireModeNum);

		OldAmmoCount = AmmoCount[AmmoType];
		Super.ConsumeAmmo(FireModeNum);

		bNoInfiniteAmmo = (OldAmmoCount - AmmoCount[AmmoType]) > 0 || AmmoCount[AmmoType] == 0;
		if ( bNoInfiniteAmmo )
		{
			ServerTotalAltAmmo--;
		}
	}
	else
	{
		Super.ConsumeAmmo(FireModeNum);
	}
}

/** Make sure user can't fire infinitely if they cheat to get infinite ammo locally. */
simulated event bool HasAmmo( byte FireModeNum, optional int Amount=1 )
{
	local byte AmmoType;

	AmmoType = GetAmmoType(FireModeNum);

	if(AmmoType == 1 && Role == ROLE_Authority && UsesSecondaryAmmo() && !Instigator.IsLocallyControlled())
	{
		if(ServerTotalAltAmmo <= 0)
		{
			return false;
		}
	}

	return Super.HasAmmo(FireModeNum, Amount );
}

/**
 *	Overridden so any grenades added will go to the spare ammo and no the clip.
 */
function int AddSecondaryAmmo(int Amount)
{
	local int OldAmmo;

	// If we can't accept spare ammo, then abort
	if( !CanRefillSecondaryAmmo() )
	{
		return 0;
	}

	if(Role == ROLE_Authority && !Instigator.IsLocallyControlled())
	{
		OldAmmo = ServerTotalAltAmmo;

		ServerTotalAltAmmo = Min(ServerTotalAltAmmo + Amount, GetMaxAmmoAmount(1));
		ClientGiveSecondaryAmmo(Amount);
		return ServerTotalAltAmmo - OldAmmo;
	}
	else
	{
		OldAmmo = SpareAmmoCount[1];
		ClientGiveSecondaryAmmo(Amount);
		return SpareAmmoCount[1] - OldAmmo;
	}
}

/** Give client specified amount of ammo (used player picks up ammo on the server) */
reliable client function ClientGiveSecondaryAmmo(byte Amount)
{
	SpareAmmoCount[1]	= Min(SpareAmmoCount[1] + Amount, GetMaxAmmoAmount(1) - AmmoCount[1]);
	TryToAltReload();
}

function SetOriginalValuesFromPickup( KFWeapon PickedUpWeapon )
{
	local KFWeap_AssaultRifle_M4A1GL Weap;

	Super.SetOriginalValuesFromPickup(PickedUpWeapon);

	if(Role == ROLE_Authority && !Instigator.IsLocallyControlled())
	{
		Weap = KFWeap_AssaultRifle_M4A1GL(PickedUpWeapon);
		ServerTotalAltAmmo = Weap.ServerTotalAltAmmo;
		SpareAmmoCount[1] = ServerTotalAltAmmo - AmmoCount[1];
	}
	else
	{
		// If we're locally controlled, don't bother using ServerTotalAltAmmo.
		SpareAmmoCount[1] = PickedUpWeapon.SpareAmmoCount[1];
	}
}

/*********************************************************************************************
 * State GrenadeFiring
 * Handles firing grenade launcher.
 *********************************************************************************************/

simulated state FiringSecondaryState extends WeaponSingleFiring
{
	// Overriden to not call FireAmmunition right at the start of the state
	simulated event BeginState( Name PreviousStateName )
	{
		Super.BeginState(PreviousStateName);
		NotifyBeginState();
	}

	simulated function EndState(Name NextStateName)
	{
		Super.EndState(NextStateName);
		NotifyEndState();
	}

    /**
     * This function returns the world location for spawning the visual effects
     * Overridden to use a special offset for throwing grenades
     */
	simulated event vector GetMuzzleLoc()
	{
		local vector MuzzleLocation;

		// swap fireoffset temporarily
		FireOffset = SecondaryFireOffset;
		MuzzleLocation = Global.GetMuzzleLoc();
		FireOffset = default.FireOffset;

		return MuzzleLocation;
	}

	/** Get whether we should play the reload anim as well or not */
	simulated function name GetWeaponFireAnim(byte FireModeNum)
	{
		return bUsingSights ? SecondaryFireIronAnim : SecondaryFireAnim;
	}
}

/**
 * Don't allow secondary fire to make a primary fire shell particle come out of the gun.
 */
simulated function CauseMuzzleFlash(byte FireModeNum)
{
	local bool AutoShellEject;

	if(FireModeNum == ALTFIRE_FIREMODE)
	{
		if (MuzzleFlash == None)
		{
			AttachMuzzleFlash();
		}

		AutoShellEject = MuzzleFlash.bAutoActivateShellEject;

		MuzzleFlash.bAutoActivateShellEject = false;

		Super.CauseMuzzleFlash(FireModeNum);

		MuzzleFlash.bAutoActivateShellEject = AutoShellEject;
	}
	else
	{
		Super.CauseMuzzleFlash(FireModeNum);
	}
}

/*********************************************************************************************
 * State Reloading
 * This is the default Reloading State.  It's performed on both the client and the server.
 *********************************************************************************************/

/** Do not allow alternate fire to tell the weapon to reload. Alt reload occurs in a separate codepath */
simulated function bool ShouldAutoReload(byte FireModeNum)
{
	if(FireModeNum == ALTFIRE_FIREMODE)
	{
		return false;
	}

	return Super.ShouldAutoReload(FireModeNum);
}

/** Called on local player when reload starts and replicated to server */
simulated function SendToAltReload()
{
	ReloadAmountLeft	= MagazineCapacity[1];
	GotoState('AltReloading');
	if ( Role < ROLE_Authority )
	{
		ServerSendToAltReload();
	}
}

/** Called from client when reload starts */
reliable server function ServerSendToAltReload()
{
	ReloadAmountLeft	= MagazineCapacity[1];
	GotoState('AltReloading');
}

/**
 * State Reloading
 * State the weapon is in when it is being reloaded (current magazine replaced with a new one, related animations and effects played).
 */
simulated state AltReloading extends Reloading
{
	ignores ForceReload, ShouldAutoReload, AllowSprinting;

	simulated function byte GetWeaponStateId()
	{
		local KFPerk Perk;
		local bool bTacticalReload;

		Perk = GetPerk();
		bTacticalReload = (Perk != None && Perk.GetUsingTactialReload(self));

		return (bTacticalReload ? WEP_ReloadSecondary_Elite : WEP_ReloadSecondary);
	}

	// Overridding super so we don't call functions we don't want to call.
	simulated function EndState(Name NextStateName)
	{
		ClearZedTimeResist();
		ClearTimer(nameof(ReloadStatusTimer));
		ClearTimer(nameof(ReloadAmmoTimer));

		CheckBoltLockPostReload();
		NotifyEndState();

		`DialogManager.PlayAmmoDialog( KFPawn(Instigator), float(SpareAmmoCount[1]) / float(GetMaxAmmoAmount(1)) );
	}

	// Overridding super so when this reload is called directly after normal reload state there 
	// are not complications resulting from back to back reloads.
	simulated event ReplicatedEvent(name VarName)
	{
		Global.ReplicatedEvent(Varname);
	}

	/** Make sure we can inturrupt secondary reload with anything. */
	simulated function bool CanOverrideMagReload(byte FireModeNum)
	{
		return true;
	}

	/** Returns animation to play based on reload type and status */
	simulated function name GetReloadAnimName( bool bTacticalReload )
	{
		// magazine relaod
		if ( AmmoCount[1] > 0 )
		{
			return (bTacticalReload) ? SecondaryReloadAnim_Elite : SecondaryReloadAnim;
		}
		else
		{
			return (bTacticalReload) ? SecondaryReloadAnim_Elite : SecondaryReloadAnim;
		}
	}

	simulated function PerformReload(optional byte FireModeNum)
	{
		Global.PerformReload(ALTFIRE_FIREMODE);

		if(Instigator.IsLocallyControlled() && Role < ROLE_Authority)
		{
			ServerSetAltAmmoCount(AmmoCount[1]);
		}
	}

	simulated function EReloadStatus GetNextReloadStatus(optional byte FireModeNum)
	{
		return Global.GetNextReloadStatus(ALTFIRE_FIREMODE);
	}
}

reliable server function ServerSetAltAmmoCount(byte Amount)
{
	AmmoCount[1] = min(Amount, MagazineCapacity[1]);
}

/** Allow reloads for primary weapon to be interupted by firing secondary weapon. */
simulated function bool CanOverrideMagReload(byte FireModeNum)
{
	if(FireModeNum == ALTFIRE_FIREMODE)
	{
		return true;
	}

	return Super.CanOverrideMagReload(FireModeNum);
}


/*********************************************************************************************
 * State Active
 * Try to get weapon to automatically reload secondary fire types when it can.
 *********************************************************************************************/

simulated state Active
{
	/** Initialize the weapon as being active and ready to go. */
	simulated event BeginState(Name PreviousStateName)
	{
		// do this last so the above code happens before any state changes
		Super.BeginState(PreviousStateName);

		// If nothing happened, try to reload
		TryToAltReload();
	}
}

/** Network: Local Player */
simulated function bool CanAltAutoReload()
{
	if ( !Instigator.IsLocallyControlled() )
	{
		return false;
	}

	if(!UsesSecondaryAmmo())
	{
		return false;
	}

	// If the weapon wants to fire its primary weapon, and it can fire, do not allow weapon to automatically alt reload
	if(PendingFire(DEFAULT_FIREMODE) && HasAmmo(DEFAULT_FIREMODE))
	{
		return false;
	}

	if(!CanReload(ALTFIRE_FIREMODE))
	{
		return false;
	}

	return true;
}

simulated function TryToAltReload()
{
	if ( IsInState('Active') && CanAltAutoReload())
	{
		SendToAltReload();
	}
}

defaultproperties
{
	bCanRefillSecondaryAmmo = true;

	// Shooting Animations
	FireSightedAnims[0]=Shoot_Iron
	FireSightedAnims[1]=Shoot_Iron2
	FireSightedAnims[2]=Shoot_Iron3

    // FOV
    MeshFov=65
	MeshIronSightFOV=45
    PlayerIronSightFOV=70
 
	// Depth of field
	DOF_FG_FocalRadius=75
	DOF_FG_MaxNearBlurSize=3.5

	// Content
	PackageKey="M4A1GL"
	FirstPersonMeshName="WEP_M4A1GL_MESH.Wep_1stP_M4A1GL_Rig"
	FirstPersonAnimSetNames(0)="wep_1p_m16_m203_anim.Wep_1stP_M16_M203_Anim"
	PickupMeshName="WEP_M4A1GL_MESH.Wep_M4_M203_Pickup"
	AttachmentArchetypeName="Wep_M4A1GL_ARCH.Wep_M4A1GL_3P"
	MuzzleFlashTemplateName="wep_m16_m203_arch.Wep_M16_M203_MuzzleFlash"

   	// Zooming/Position
	PlayerViewOffset=(X=22.0,Y=9.f,Z=-2.f)
	
	IronSightPosition=(X=0,Y=-0.15,Z=-1.833)

	// Pickup
    AmmoPickupScale[1]=2.0

	// Ammo
	InitialSpareMags[0]	= 5 //2
	MagazineCapacity[0]	= 35
	SpareAmmoCapacity[0]= 350
    //grenades
	InitialSpareMags[1]	= 4
	MagazineCapacity[1]	= 1
	SpareAmmoCapacity[1]= 18 //11

	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=100
	minRecoilPitch=60
	maxRecoilYaw=130
	minRecoilYaw=-130
	RecoilRate=0.08
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	RecoilViewRotationScale=0.25
	IronSightMeshFOVCompensationScale=1.7
    HippedRecoilModifier=1.5

    SecondaryAmmoTexture=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Grenade'

    // Inventory / Grouping
	InventorySize=6
	GroupPriority=80
	WeaponSelectTexture=Texture2D'WEP_M4A1GL_TEX.UI_M4A1GL_TEX'
   	AssociatedPerkClasses(0)=class'KFPerk_Demolitionist'
   	AssociatedPerkClasses(1)=class'KFPerk_Commando'

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_M4A1GL'
	FireInterval(DEFAULT_FIREMODE)=+0.0751 // 0.086 700 RPM
	Spread(DEFAULT_FIREMODE)=0.0065
	InstantHitDamage(DEFAULT_FIREMODE)=38.0 //24 //30
	FireOffset=(X=30,Y=4.5,Z=-5)
	SecondaryFireOffset=(X=20.f,Y=4.5,Z=-7.f)

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=FiringSecondaryState
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_HighExplosive_M4A1GL'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_M203Impact'
	FireInterval(ALTFIRE_FIREMODE)=+0.15f
	InstantHitDamage(ALTFIRE_FIREMODE)=220.0 //150 //225
	Spread(ALTFIRE_FIREMODE)=0.0065

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_M4A1GL'
	InstantHitDamage(BASH_FIREMODE)=30

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Fire_Loop_M', FirstPersonCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Fire_Loop_S')
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Fire_Loop_End_M', FirstPersonCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Fire_Loop_End_S')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Fire_M', FirstPersonCue=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Fire_S')

	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Handling_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireSnd(2)=(DefaultCue=AkEvent'WW_WEP_M16M203.Play_M16_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_M16M203.Play_M16_Fire_1P_Single')
	SingleFireSoundIndex=2

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.3f), (Stat=EWUS_Damage1, Scale=1.3f), (Stat=EWUS_Weight, Add=0)))
    WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.6f), (Stat=EWUS_Damage1, Scale=1.6f), (Stat=EWUS_Weight, Add=0)))
}
