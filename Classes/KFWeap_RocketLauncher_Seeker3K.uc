//=============================================================================
// KFWeap_Shotgun_Medic
//=============================================================================
// A Medic Shotgun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================
class KFWeap_RocketLauncher_Seeker3K extends KFWeap_GrenadeLauncher_Base;

var(Weapon) array<byte>	NumPellets;

/*********************************************************************************************
 Firing / Projectile - Below projectile spawning code copied from KFWeap_ShotgunBase
********************************************************************************************* */

/** Spawn projectile is called once for each shot pellet fired */
simulated function KFProjectile SpawnProjectile( class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir )
{
	local int i;
	local rotator AimRot;
	local KFPerk InstigatorPerk;

    if( CurrentFireMode == GRENADE_FIREMODE )
    {
        return Super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
    }

    InstigatorPerk = GetPerk();
    if( InstigatorPerk != none )
    {
    	Spread[CurrentFireMode] = default.Spread[CurrentFireMode] * InstigatorPerk.GetTightChokeModifier();
    }

	AimRot = rotator(AimDir);

	for (i = 0; i < NumPellets[CurrentFireMode]; i++)
	{
		Super.SpawnProjectile(KFProjClass, RealStartLoc, vector(class'KFWeap_ShotgunBase'.static.AddMultiShotSpread(AimRot, Spread[CurrentFireMode])));
	}

	return None;
}

/** Disable normal bullet spread */
simulated function rotator AddSpread(rotator BaseAim)
{
	return BaseAim; // do nothing
}

/** Notification that a weapon attack has has happened */
function HandleWeaponShotTaken( byte FireMode )
{
    if( KFPlayer != None )
	{
        KFPlayer.AddShotsFired(NumPellets[FireMode]);
	}
}

///////////////////////////////////////////////////////////////////////////////////////////
//
// Trader
//
///////////////////////////////////////////////////////////////////////////////////////////

/** Allows weapon to calculate its own damage for display in trader.
  * Overridden to multiply damage by number of pellets.
  * Exact copy of KFWeap_ShotgunBase.CalculateTraderWeaponStatDamage
  */
static simulated function float CalculateTraderWeaponStatDamage()
{
	local float BaseDamage, DoTDamage;
	local class<KFDamageType> DamageType;

	BaseDamage = default.InstantHitDamage[DEFAULT_FIREMODE];

	DamageType = class<KFDamageType>(default.InstantHitDamageTypes[DEFAULT_FIREMODE]);
	if( DamageType != none && DamageType.default.DoT_Type != DOT_None )
	{
		DoTDamage = (DamageType.default.DoT_Duration / DamageType.default.DoT_Interval) * (BaseDamage * DamageType.default.DoT_DamageScale);
	}

	return BaseDamage * default.NumPellets[DEFAULT_FIREMODE] + DoTDamage;
}

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Explosive;
}

defaultproperties
{
	ForceReloadTime=0.4f

	// Inventory
	InventoryGroup=IG_Primary
	GroupPriority=120
	InventorySize=9 //10
	WeaponSelectTexture=Texture2D'WEP_UI_SEEKER3K_TEX.UI_WeaponSelect_Seeker3K'

    // FOV
	MeshFOV=86
	MeshIronSightFOV=65
	PlayerIronSightFOV=70
	PlayerSprintFOV=95

	// Depth of field
	DOF_FG_FocalRadius=50
	DOF_FG_MaxNearBlurSize=2.5

	// Zooming/Position
	PlayerViewOffset=(X=20.0,Y=5,Z=-5)
	FastZoomOutTime=0.2

	PackageKey="Seeker3K"
	FirstPersonMeshName="'WEP_1P_SEEKER3K_MESH.Wep_1stP_Seeker3K_Rig'"
	FirstPersonAnimSetNames(0)="'WEP_1P_SeekerSix_ANIM.Wep_1stP_SeekerSix_Anim'"
	PickupMeshName="'WEP_3P_SEEKER3K_MESH.Wep_3rdP_Seeker3K_Pickup'"
	AttachmentArchetypeName="'WEP_SEEKER3K_ARCH.Wep_Seeker3K_3P'"
	MuzzleFlashTemplateName="'WEP_SeekerSix_ARCH.Wep_SeekerSix_MuzzleFlash'"

   	// Zooming/Position
	IronSightPosition=(X=0,Y=0,Z=0)

	// Ammo
	MagazineCapacity[0]=18
	SpareAmmoCapacity[0]=144
	InitialSpareMags[0]=3
	AmmoPickupScale[0]=2.0
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=100
	minRecoilPitch=100
	maxRecoilYaw=200
	minRecoilYaw=-200
	RecoilRate=0.065
	RecoilBlendOutRatio=0.35
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=1500
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65485
	RecoilViewRotationScale=0.8
	FallingRecoilModifier=1.5
	HippedRecoilModifier=1.25

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'UI_FireModes_TEX.UI_FireModeSelect_Rocket'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Rocket_Seeker3K'
	FireInterval(DEFAULT_FIREMODE)=+0.3
	InstantHitDamage(DEFAULT_FIREMODE)=140.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_Seeker6Impact'
	Spread(DEFAULT_FIREMODE)=0.07
	FireOffset=(X=20,Y=4.0,Z=-3)
	NumPellets(DEFAULT_FIREMODE)=1
	AmmoCost(DEFAULT_FIREMODE)=1

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'WEP_UI_SEEKER3K_TEX.UI_FireModeSelect_MultiRocket'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Rocket_Seeker6'
	FireInterval(ALTFIRE_FIREMODE)=+0.7 //0.1
	InstantHitDamage(ALTFIRE_FIREMODE)=140.0
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_Seeker6Impact'
	Spread(ALTFIRE_FIREMODE)=0.05
	NumPellets(ALTFIRE_FIREMODE)=3
	AmmoCost(ALTFIRE_FIREMODE)=3

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Seeker6'
	InstantHitDamage(BASH_FIREMODE)=35

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Seeker_6.Play_WEP_Seeker_6_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_Seeker_6.Play_WEP_Seeker_6_Fire_1P')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Seeker_6.Play_WEP_Seeker_6_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_Seeker_6.Play_WEP_Seeker_6_Fire_1P')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_RPG7.Play_WEP_SA_RPG7_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_RPG7.Play_WEP_SA_RPG7_DryFire'

	// Animation
	bHasFireLastAnims=true
	IdleFidgetAnims=(Guncheck_v1, Guncheck_v2)

	//BonesToLockOnEmpty=(RW_Grenade1)

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	AssociatedPerkClasses(0)=class'KFPerk_Demolitionist'

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))

}