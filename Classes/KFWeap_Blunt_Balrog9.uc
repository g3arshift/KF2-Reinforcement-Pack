//=============================================================================
// KFWeap_Blunt_BALROG9
//=============================================================================

class KFWeap_Blunt_Balrog9 extends KFWeap_MeleeBase;

const ShootAnim_L = 'Atk_H_B';
const ShootAnim_R = 'Atk_H_R';
const ShootAnim_F = 'Atk_H_F';
const ShootAnim_B = 'Atk_H_B';

var bool bWasTimeDilated;

/** Explosion actor class to spawn */
var class<KFExplosionActor> ExplosionActorClass;
var() KFGameExplosion ExplosionTemplate;
/** If true, use an alternate set of explosion effects */
var bool    bAltExploEffects;
var KFImpactEffectInfo AltExploEffects;

var transient Actor BlastAttachee;

/** Spawn location offset to improve cone hit detection */
var transient float BlastSpawnOffset;

/** If set, heavy attack button has been released during the attack */
var transient bool bPulverizerFireReleased;

var bool bFriendlyFireEnabled;

var class<KFExplosionActor> NukeExplosionActorClass;

replication
{
	if (bNetInitial)
		bFriendlyFireEnabled;
}

simulated event PreBeginPlay()
{
	Super.PreBeginPlay();

	/** Initially check whether friendly fire is on or not. */
	if(Role == ROLE_Authority && KFGameInfo(WorldInfo.Game).FriendlyFireScale != 0.f)
	{
		bFriendlyFireEnabled = true;
	}
}

/** Explosion Actor version */
simulated function CustomFire()
{
	local KFExplosionActor ExploActor;
	local vector SpawnLoc;
	local rotator SpawnRot;

	if ( Instigator.Role < ROLE_Authority )
	{
		return;
	}

	// On local player or server, we cache off our time dilation setting here
	if (WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_DedicatedServer || Instigator.Controller != None)
	{
		bWasTimeDilated = WorldInfo.TimeDilation < 1.f;
	}

	PrepareExplosionTemplate();
	SetExplosionActorClass();

	SpawnLoc = Instigator.GetWeaponStartTraceLocation();
	SpawnRot = GetPulverizerAim(SpawnLoc);

	// nudge backwards to give a wider code near the player
	SpawnLoc += vector(SpawnRot) * BlastSpawnOffset;

	// explode using the given template
	ExploActor = Spawn(ExplosionActorClass, self,, SpawnLoc, SpawnRot,, true);
	if (ExploActor != None)
	{
		ExploActor.InstigatorController = Instigator.Controller;
		ExploActor.Instigator = Instigator;

		// Force the actor we collided with to get hit again (when DirectionalExplosionAngleDeg is small)
		// This is only necessary on server since GetEffectCheckRadius() will be zero on client
		ExploActor.Attachee = BlastAttachee;
		ExplosionTemplate.bFullDamageToAttachee = true;

		// enable muzzle location sync
		ExploActor.bReplicateInstigator = true;
		ExploActor.SetSyncToMuzzleLocation(true);

		ExploActor.Explode(ExplosionTemplate, vector(SpawnRot));
	}

	// tell remote clients that we fired, to trigger effects in third person
	IncrementFlashCount();

	if ( bDebug )
	{
		DrawDebugCone(SpawnLoc, vector(SpawnRot), ExplosionTemplate.DamageRadius, ExplosionTemplate.DirectionalExplosionAngleDeg * DegToRad,
			ExplosionTemplate.DirectionalExplosionAngleDeg * DegToRad, 16, MakeColor(64,64,255,0), TRUE);
	}
}

// for nukes && concussive force
simulated protected function PrepareExplosionTemplate()
{
	local KFPlayerReplicationInfo InstigatorPRI;
	local KFPlayerController KFPC;
	local KFPerk InstigatorPerk;

	if (bWasTimeDilated)
	{
		InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
		if (InstigatorPRI != none)
		{
			if (InstigatorPRI.bNukeActive)
			{
				ExplosionTemplate = class'KFPerk_Demolitionist'.static.GetNukeExplosionTemplate();
				ExplosionTemplate.Damage = ExplosionTemplate.Damage * class'KFPerk_Demolitionist'.static.GetNukeDamageModifier();
				ExplosionTemplate.DamageRadius = ExplosionTemplate.DamageRadius * class'KFPerk_Demolitionist'.static.GetNukeRadiusModifier();
				ExplosionTemplate.DamageFalloffExponent = ExplosionTemplate.DamageFalloffExponent;
			}
			else if (InstigatorPRI.bConcussiveActive && AltExploEffects != none)
			{
				ExplosionTemplate.ExplosionEffects = AltExploEffects;
				ExplosionTemplate.ExplosionSound = class'KFPerk_Demolitionist'.static.GetConcussiveExplosionSound();
			}
		}
	}
	else
	{
		ExplosionTemplate = default.ExplosionTemplate;
		ExplosionTemplate.ExplosionEffects = default.ExplosionTemplate.ExplosionEffects;
		ExplosionTemplate.ExplosionSound = default.ExplosionTemplate.ExplosionSound;
		ExplosionTemplate.Damage = ExplosionTemplate.default.Damage;
		ExplosionTemplate.DamageRadius = ExplosionTemplate.default.DamageRadius;
		ExplosionTemplate.DamageFalloffExponent = ExplosionTemplate.default.DamageFalloffExponent;
	}

	// Change the radius and damage based on the perk
	if (Owner.Role == ROLE_Authority)
	{
		KFPC = KFPlayerController(Instigator.Controller);
		if (KFPC != none)
		{
			InstigatorPerk = KFPC.GetPerk();
			ExplosionTemplate.DamageRadius *= InstigatorPerk.GetAoERadiusModifier();
		}
	}
}

simulated protected function SetExplosionActorClass()
{
	local KFPlayerReplicationInfo InstigatorPRI;

	if (bWasTimeDilated && Instigator != none)
	{
		InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
		if (InstigatorPRI != none)
		{
			if (InstigatorPRI.bNukeActive)
			{
				ExplosionActorClass = NukeExplosionActorClass;
				return;
			}
		}
	}
	ExplosionActorClass = default.ExplosionActorClass;
}

/** Called by CustomFire when shotgun blast is fired */
simulated function Rotator GetPulverizerAim( vector StartFireLoc )
{
	local Rotator R;

	R = GetAdjustedAim(StartFireLoc);

	// Adjust cone fire angle based on swing direction
	switch (MeleeAttackHelper.CurrentAttackDir)
	{
		case DIR_Left:
			R.Yaw += 5461;
			break;
		case DIR_Right:
			R.Yaw -= 5461;
		break;
		case DIR_Forward:
			R.Pitch -= 2048;
		break;
		case DIR_Backward:
			R.Pitch += 2048;
		break;
	}

	return R;
}

/** Don't play a shoot anim when FireAmmunition is called */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	// Adjust cone fire angle based on swing direction
	switch (MeleeAttackHelper.CurrentAttackDir)
	{
		case DIR_Forward:
		case DIR_ForwardLeft:
		case DIR_ForwardRight:
			return ShootAnim_F;
		case DIR_Backward:
		case DIR_BackwardLeft:
		case DIR_BackwardRight:
			return ShootAnim_B;
		case DIR_Left:
			return ShootAnim_L;
		case DIR_Right:
			return ShootAnim_R;
	}
	return '';
}

/** Called on the server alongside PulverizerFired */
reliable server private function ServerBeginPulverizerFire(Actor HitActor, optional vector HitLocation)
{
	// Ignore if too far away (something went wrong!)
	if ( VSizeSq2D(HitLocation - Instigator.Location) > Square(500) )
	{
		`log("ServerBeginPulverizerFire outside of range!");
		return;
	}

	BlastAttachee = HitActor;
	SendToFiringState(CUSTOM_FIREMODE);
}

/** Called when altfire melee attack hits a target and there is ammo left */
simulated function BeginPulverizerFire()
{
	SendToFiringState(CUSTOM_FIREMODE);
}

/** Skip calling StillFiring/PendingFire to fix log warning */
simulated function bool ShouldRefire()
{
	if ( CurrentFireMode == CUSTOM_FIREMODE )
		return false;

	return Super.ShouldRefire();
}

/** Debugging */
`if(`notdefined(ShippingPC))
exec function ToggleWeaponDebug()
{
	bDebug = !bDebug;
}
`endif

/*********************************************************************************************
 * State MeleeHeavyAttacking
 * This is the alt-fire Melee State.
 *********************************************************************************************/

simulated state MeleeHeavyAttacking
{
	/** Reset bPulverizerFireReleased */
	simulated event BeginState(Name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);
		bPulverizerFireReleased = false;
	}

	/** Set bPulverizerFireReleased to ignore NotifyMeleeCollision */
	simulated function StopFire(byte FireModeNum)
	{
		Super.StopFire(FireModeNum);
		bPulverizerFireReleased = true;
	}

	/** Network: Local Player */
	simulated function NotifyMeleeCollision(Actor HitActor, optional vector HitLocation)
	{
		local KFPawn Victim;

		// If fire button is being held down, try firing pulverizer
		if ( Instigator != None && Instigator.IsLocallyControlled() /*&& !bPulverizerFireReleased*/ )
		{
			// only detonate when the pulverizer hits a pawn so that level geometry doesn't get in the way
			if ( HitActor.bWorldGeometry )
			{
				return;
			}

			Victim = KFPawn(HitActor);
			if ( Victim == None ||
				(!bFriendlyFireEnabled && Victim.GetTeamNum() == Instigator.GetTeamNum()) ||
				(Victim.bPlayedDeath && `TimeSince(Victim.TimeOfDeath) > 0.f) )
			{
				return;
			}

			if ( !IsTimerActive(nameof(BeginPulverizerFire)) )
			{
				BlastAttachee = HitActor;

				// need to delay one frame, since this is called from AnimNotify
				SetTimer(0.001f, false, nameof(BeginPulverizerFire));

				if ( Role < ROLE_Authority )
				{
					if( HitActor.bTearOff && Victim != none )
					{
						Victim.TakeRadiusDamage(Instigator.Controller, ExplosionTemplate.Damage, ExplosionTemplate.DamageRadius, ExplosionTemplate.MyDamageType,
							ExplosionTemplate.MomentumTransferScale, Location, true, (Owner != None) ? Owner : self);
					}
					else
					{
						ServerBeginPulverizerFire(HitActor, HitLocation);
					}
				}
			}
		}
	}
}

defaultproperties
{

	AssociatedPerkClasses(0)=class'KFPerk_Berserker'

	// Content
	PackageKey="BALROG9"
	FirstPersonMeshName="WEP_BALROG9_MESH.Wep_1stP_BR9_Rig"
	FirstPersonAnimSetNames(0)="wep_1p_static_strikers_anim.wep_1p_static_strikers_anim"
	PickupMeshName="WEP_BALROG9_MESH.Wep_3rdP_BR9_Pickup"
	AttachmentArchetypeName="WEP_BALROG9_ARCH.Wep_Balrog9_3P"
	MuzzleFlashTemplateName="WEP_BALROG9_ARCH.Wep_BALROG9_MuzzleFlash"  

	Begin Object Name=MeleeHelper_0
		MaxHitRange=100 //150 //190
		// Override automatic hitbox creation (advanced)
		HitboxChain.Add((BoneOffset=(Y=+5,Z=250)))
		HitboxChain.Add((BoneOffset=(Y=+5,Z=170)))
		HitboxChain.Add((BoneOffset=(Y=+5,Z=150)))
		HitboxChain.Add((BoneOffset=(Y=-5,Z=130)))
		HitboxChain.Add((BoneOffset=(Y=+5,Z=110)))
		HitboxChain.Add((BoneOffset=(Y=-5,Z=90)))
		HitboxChain.Add((BoneOffset=(Y=+5,Z=70)))
		HitboxChain.Add((BoneOffset=(Y=-5,Z=50)))
		HitboxChain.Add((BoneOffset=(Y=+5,Z=30)))
		HitboxChain.Add((BoneOffset=(Y=-4,Z=250)))
		HitboxChain.Add((BoneOffset=(Y=-4,Z=170)))
		HitboxChain.Add((BoneOffset=(Y=+4,Z=150)))
		HitboxChain.Add((BoneOffset=(Y=-4,Z=130)))
		HitboxChain.Add((BoneOffset=(Y=+4,Z=110)))
		HitboxChain.Add((BoneOffset=(Y=-4,Z=90)))
		HitboxChain.Add((BoneOffset=(Y=+4,Z=70)))
		HitboxChain.Add((BoneOffset=(Y=-4,Z=50)))
		HitboxChain.Add((BoneOffset=(Y=+4,Z=30)))
		HitboxChain.Add((BoneOffset=(Y=-4,Z=10)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=250)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=170)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=150)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=130)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=110)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=90)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=70)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=50)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=30)))
		HitboxChain.Add((BoneOffset=(Z=10)))
		HitboxChain.Add((BoneOffset=(Z=-10)))
		WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Blunted_melee_impact'

		// modified combo sequences
		MeleeImpactCamShakeScale=0.035f //0.4
		ChainSequence_F=(DIR_Left, DIR_ForwardRight, DIR_ForwardLeft, DIR_ForwardRight, DIR_ForwardLeft)
		ChainSequence_B=(DIR_BackwardLeft, DIR_Left, DIR_Right, DIR_ForwardRight, DIR_Left, DIR_Right, DIR_Left)
		ChainSequence_L=(DIR_Right, DIR_BackwardRight, DIR_ForwardRight, DIR_ForwardLeft, DIR_Right, DIR_Left)
		ChainSequence_R=(DIR_Left, DIR_BackwardLeft, DIR_ForwardLeft, DIR_ForwardRight, DIR_Left, DIR_Right)
	End Object

	// Zooming/Position
	PlayerViewOffset=(X=20,Y=0,Z=0)

    // Inventory
	GroupPriority=150
	InventorySize=8
	WeaponSelectTexture=Texture2D'WEP_BALROG9_TEX.UI_BALROG9_TEX'

	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
	InstantHitDamage(DEFAULT_FIREMODE)=190
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Bludgeon_Balrog9'

	// Trigger explosion as Heavy Attack 
	FireModeIconPaths(HEAVY_ATK_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
	InstantHitDamage(HEAVY_ATK_FIREMODE)=350
	InstantHitDamageTypes(HEAVY_ATK_FIREMODE)=class'KFDT_Bludgeon_Balrog9Heavy'

	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Balrog9Bash'
	InstantHitDamage(BASH_FIREMODE)=140

	// Trigger explosion
	FireModeIconPaths(CUSTOM_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
	FiringStatesArray(CUSTOM_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(CUSTOM_FIREMODE)=EWFT_Custom
	FireInterval(CUSTOM_FIREMODE)=0.7

	BlastSpawnOffset=-10.f

	// Explosion settings.  Using archetype so that clients can serialize the content
	// without loading the 1st person weapon content (avoid 'Begin Object')!
	ExplosionActorClass=class'KFExplosionActorReplicated'
	ExplosionTemplate=KFGameExplosion'WEP_BALROG9_ARCH.Wep_BALROG9_Explosion'
	AltExploEffects = KFImpactEffectInfo'WEP_RPG7_ARCH.RPG7_Explosion_Concussive_Force' //Leave this alone until we want it

	NukeExplosionActorClass=class'KFExplosion_ReplicatedNuke'

	// Fire Effects
	WeaponFireSnd(CUSTOM_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_MEL_Pulverizer.Play_WEP_MEL_Pulverizer_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_MEL_Pulverizer.Play_WEP_MEL_Pulverizer_Fire_1P')

	// Block Effects
	BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Hammer'
	ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Wood'

	// Trader
	ParryStrength=7
	ParryDamageMitigationPercent=0.50
	BlockDamageMitigation=0.50

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))
}