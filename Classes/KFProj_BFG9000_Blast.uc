//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFProj_BFG9000_Blast extends KFProj_BallisticExplosive
    implements(KFInterface_DamageCauser);

var float DamageScale;
var float AOEScale;
var float IncapScale;
var repnotify int ChargeLevel;

var const ParticleSystem ExplosionEffectL1;
var const ParticleSystem ExplosionEffectL2;
var const ParticleSystem ExplosionEffectL3;

var const ParticleSystem ProjFlightTemplateL1;
var const ParticleSystem ProjFlightTemplateL2;
var const ParticleSystem ProjFlightTemplateL3;

var const AkBaseSoundObject ExplosionSoundL1;
var const AkBaseSoundObject ExplosionSoundL2;
var const AkBaseSoundObject ExplosionSoundL3;

var const ParticleSystem ConcussiveForceEffectL1;
var const ParticleSystem ConcussiveForceEffectL2;
var const ParticleSystem ConcussiveForceEffectL3;

/** Explosion actor class to use for ground fire */
var const protected class<KFExplosionActorLingering> GroundFireExplosionActorClass;
/** Explosion template to use for ground fire */
var KFGameExplosion GroundFireExplosionTemplate;

/** How long the ground fire should stick around */
var const protected float BurnDuration;

/** How often, in seconds, we should apply burn */
var const protected float BurnDamageInterval;

var bool bSpawnGroundFire;

var bool bAltGroundFire;
var KFImpactEffectInfo AltGroundFire;

replication
{
	if (bNetInitial)
		bSpawnGroundFire, ChargeLevel;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(ChargeLevel))
	{
		bSpawnGroundFire = ChargeLevel == 3;
		SpawnFlightEffects();
	}

	Super.ReplicatedEvent(VarName);
}

simulated function PostBeginPlay()
{
	local KFWeap_BFG9000 HuskCannon;
	local KFPlayerReplicationInfo InstigatorPRI;

	if(Role == ROLE_Authority)
	{
		HuskCannon = KFWeap_BFG9000(Owner);
		if (HuskCannon != none)
		{
			ChargeLevel = HuskCannon.GetChargeFXLevel();
			bSpawnGroundFire = ChargeLevel == 3;
		}
	}

	if(Instigator != none)
	{
		if (AltGroundFire != none)
		{
			InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
			if (InstigatorPRI != none)
			{
				bAltGroundFire = InstigatorPRI.bSplashActive;
			}
		}
		else
		{
			bAltGroundFire = false;
		}
	}

	Super.PostBeginPlay();
}

simulated protected function PrepareExplosionActor(GameExplosionActor GEA)
{
    local KFExplosionActor_HuskCannon HuskExplode;

    HuskExplode = KFExplosionActor_HuskCannon(GEA);
    if (HuskExplode != None)
    {
        HuskExplode.DamageScale = DamageScale;
    }
}

simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	local KFExplosionActorLingering GFExplosionActor;
	local vector GroundExplosionHitNormal;

	if (bHasDisintegrated)
	{
		return;
	}

	if (!bHasExploded && bSpawnGroundFire)
	{
		if (bAltGroundFire && AltGroundFire != none)
		{
			GroundFireExplosionTemplate.ExplosionEffects = AltGroundFire;
		}

		GroundExplosionHitNormal = HitNormal;

		// Spawn our explosion and set up its parameters
		GFExplosionActor = Spawn(GroundFireExplosionActorClass, self, , HitLocation + (HitNormal * 32.f), rotator(HitNormal));
		if (GFExplosionActor != None)
		{
			GFExplosionActor.Instigator = Instigator;
			GFExplosionActor.InstigatorController = InstigatorController;

			// These are needed for the decal tracing later in GameExplosionActor.Explode()
			GroundFireExplosionTemplate.HitLocation = HitLocation;
			GroundFireExplosionTemplate.HitNormal = GroundExplosionHitNormal;

			// Apply explosion direction
			if (GroundFireExplosionTemplate.bDirectionalExplosion)
			{
				GroundExplosionHitNormal = GetExplosionDirection(GroundExplosionHitNormal);
			}

			// Set our duration
			GFExplosionActor.MaxTime = BurnDuration;

			// Set our burn interval
			GFExplosionActor.Interval = BurnDamageInterval;

			// Boom
			GFExplosionActor.Explode(GroundFireExplosionTemplate, GroundExplosionHitNormal);
		}
	}

	super.TriggerExplosion(HitLocation, HitNormal, HitActor);
}

//==============
// Touching
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if (ClassIsChildOf(Other.class, class'KFPawn'))
	{
		bSpawnGroundFire = false;
	}

	super.ProcessTouch(Other, HitLocation, HitNormal);
}

simulated protected function PrepareExplosionTemplate()
{
	local bool bUseConcussiveForce;
	local Weapon OwnerWeapon;
	local Pawn OwnerPawn;
	local KFPlayerReplicationInfo PRI;

	super(KFProjectile).PrepareExplosionTemplate();

	bUseConcussiveForce = false;
	OwnerWeapon = Weapon(Owner);
	if (OwnerWeapon != none)
	{
		OwnerPawn = Pawn(OwnerWeapon.Owner);
		if (OwnerPawn != none)
		{
			PRI = KFPlayerReplicationInfo(OwnerPawn.PlayerReplicationInfo);
			if (PRI != none)
			{
				bUseConcussiveForce = PRI.bConcussiveActive;
			}
		}
	}

	switch (ChargeLevel)
	{
	case 1:
		if (bUseConcussiveForce)
		{
			ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ConcussiveForceEffectL1;
			ExplosionTemplate.ExplosionSound = class'KFPerk_Demolitionist'.static.GetConcussiveExplosionSound();
		}
		else
		{
			ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ExplosionEffectL1;
			ExplosionTemplate.ExplosionSound = ExplosionSoundL1;
		}
		break;
	case 2:
		if (bUseConcussiveForce)
		{
			ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ConcussiveForceEffectL2;
			ExplosionTemplate.ExplosionSound = class'KFPerk_Demolitionist'.static.GetConcussiveExplosionSound();
		}
		else
		{
			ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ExplosionEffectL2;
			ExplosionTemplate.ExplosionSound = ExplosionSoundL2;
		}
		break;
	case 3:
		if (bUseConcussiveForce)
		{
			ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ConcussiveForceEffectL3;
			ExplosionTemplate.ExplosionSound = class'KFPerk_Demolitionist'.static.GetConcussiveExplosionSound();
		}
		else
		{
			ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ExplosionEffectL3;
			ExplosionTemplate.ExplosionSound = ExplosionSoundL3;
		}
		break;
	}

	class'KFPerk_Demolitionist'.static.PrepareExplosive(Instigator, self, AOEScale, DamageScale);
}

simulated protected function SetExplosionActorClass()
{
	local KFPlayerReplicationInfo InstigatorPRI;

	if (bWasTimeDilated && Instigator != none)
	{
		InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
		if (InstigatorPRI != none && InstigatorPRI.CurrentPerkClass == class'KFPerk_Demolitionist')
		{
			if (InstigatorPRI.bNukeActive && class'KFPerk_Demolitionist'.static.ProjectileShouldNuke(self))
			{
				ExplosionActorClass = class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass();
			}
		}
	}

	super.SetExplosionActorClass();
}

// KFInterface_DamageCauser
function float GetIncapMod()
{
    return IncapScale;
}

// Override ProjFlightTemplate to correct emitter.
simulated function SpawnFlightEffects()
{
	if (ChargeLevel == 0)
	{
		return; // Charge level will be set using replication.
	}

	switch (ChargeLevel)
	{
		case 1:
			ProjFlightTemplate = ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_Projectile_L1';
			break;
		case 2:
			ProjFlightTemplate = ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_Projectile_L2';
			break;
		case 3:
			ProjFlightTemplate = ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_Projectile_L3';
			break;
	}

	Super.SpawnFlightEffects();
}

defaultproperties
{
    ExplosionActorClass=class'KFExplosionActor_HuskCannon'
	// Ground fire
	GroundFireExplosionActorClass=class'KFExplosion_HuskCannonFireballGroundFire'
	ProjFlightTemplate=ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_Projectile_L3'

	// Fire light
	Begin Object Class=PointLightComponent Name=FlamePointLight
		LightColor = (R = 100,G = 245,B = 100,A = 255)
		Brightness = 4.f
		Radius = 500.f
		FalloffExponent = 10.f
		CastShadows = False
		CastStaticShadows = FALSE
		CastDynamicShadows = TRUE
		bCastPerObjectShadows = false
		bEnabled = FALSE
		LightingChannels = (Indoor = TRUE,Outdoor = TRUE,bInitialized = TRUE)
	End Object

	// Grenade explosion light
	Begin Object Class=PointLightComponent Name=ExplosionPointLight
		LightColor = (R = 100,G = 245,B = 100,A = 255)
		Brightness = 4.f
		Radius = 2000.f
		FalloffExponent = 10.f
		CastShadows = False
		CastStaticShadows = FALSE
		CastDynamicShadows = False
		bCastPerObjectShadows = false
		bEnabled = FALSE
		LightingChannels = (Indoor = TRUE,Outdoor = TRUE,bInitialized = TRUE)
	End Object

	Begin Object Class=KFGameExplosion Name=ExploTemplate1
		Damage=3
		DamageRadius=150
		DamageFalloffExponent=1.f
		DamageDelay=0.f
		// Don't burn the guy that tossed it, it's just too much damage with multiple fires, its almost guaranteed to kill the guy that tossed it
        bIgnoreInstigator=true

		MomentumTransferScale=0

		// Damage Effects
		MyDamageType=class'KFDT_Fire_Ground'
		KnockDownStrength=0
		FractureMeshRadius=0
		ExplosionEffects=KFImpactEffectInfo'wep_molotov_arch.Molotov_GroundFire'

		bDirectionalExplosion=true

		// Camera Shake
		CamShake=none

		// Dynamic Light
        ExploLight=FlamePointLight
        ExploLightStartFadeOutTime=1.5f
        ExploLightFadeOutTime=0.3
	End Object
	GroundFireExplosionTemplate=ExploTemplate1

	Begin Object Class=KFGameExplosion Name=ExploTemplate2
		Damage=100
		DamageRadius=100 //450 //550
		DamageFalloffExponent=1.f //1.0
		DamageDelay=0.f

		// Damage Effects
		MyDamageType=class'KFDT_Explosive_BFG9000'
		bCausesFracture=true
		MomentumTransferScale=6000.f
		KnockDownStrength=100
		FractureMeshRadius=200.0
		FracturePartVel=100.0
		ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.HuskProjectile_Explosion'
		ExplosionSound=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_Impact'
		ExplosionEmitterScale=2.f

		// Dynamic Light
		ExploLight=ExplosionPointLight
		ExploLightStartFadeOutTime = 0.0
		ExploLightFadeOutTime = 0.5

		// Camera Shake
		// Camera Shake
		CamShake = none
		bOrientCameraShakeTowardsEpicenter=true

		bIgnoreInstigator=false
    End Object
	ExplosionTemplate=ExploTemplate2

	//AltExploEffects=KFImpactEffectInfo'WEP_Flamethrower_ARCH.GroundFire_Splash_Impacts'
	AltGroundFire=KFImpactEffectInfo'WEP_Flamethrower_ARCH.GroundFire_Splash_Impacts'

	Begin Object Name=CollisionCylinder
		CollisionRadius=4 //6
		CollisionHeight=4  //2
	End Object

	ExtraLineCollisionOffsets.Add((Y = -8))
	ExtraLineCollisionOffsets.Add((Y = 8))
	// Since we're still using an extent cylinder, we need a line at 0
	ExtraLineCollisionOffsets.Add(())

    MomentumTransfer=0

	ConcussiveForceEffectL1=ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_Impact_L1_CF'
	ConcussiveForceEffectL2=ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_Impact_L2_CF'
	ConcussiveForceEffectL3=ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_Impact_L3_CF'

	ExplosionEffectL1=ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_Impact_L1'
	ExplosionEffectL2=ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_Impact_L2'
	ExplosionEffectL3=ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_Impact_L3'

	ProjFlightTemplateL1=ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_Projectile_L1'
	ProjFlightTemplateL2=ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_Projectile_L2'
	ProjFlightTemplateL3=ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_Projectile_L3'

	ExplosionSoundL1=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_Impact';
	ExplosionSoundL2=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_Impact';
	ExplosionSoundL3=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_Impact';

	AmbientSoundPlayEvent=none
    AmbientSoundStopEvent=none

    MaxSpeed=4000.0
	Speed=4000.0

	bNetTemporary = False
	bBlockedByInstigator=false
	bAlwaysReplicateExplosion = true
	bUseClientSideHitDetection = true
	bNoReplicationToInstigator = false
	bReplicateLocationOnExplosion = true
	bValidateExplosionNormalOnClient = true
	TouchTimeThreshhold = 0.15
}
