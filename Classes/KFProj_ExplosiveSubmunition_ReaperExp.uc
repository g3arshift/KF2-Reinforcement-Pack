//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibso
//=============================================================================

class KFProj_ExplosiveSubmunition_ReaperExp extends KFProj_BallisticExplosive
	hidedropdown;

/** Cached reference to owner weapon */
var protected KFWeapon OwnerWeapon;

/** Initialize the projectile */
function Init( vector Direction )
{
	super.Init( Direction );

	OwnerWeapon = KFWeapon( Owner );
	if( OwnerWeapon != none )
	{
		OwnerWeapon.LastPelletFireTime = WorldInfo.TimeSeconds;
	}
}

/** Don't allow more than one pellet projectile to perform this check in a single frame */
function bool ShouldWarnAIWhenFired()
{
	return super.ShouldWarnAIWhenFired() && OwnerWeapon != none && OwnerWeapon.LastPelletFireTime < WorldInfo.TimeSeconds;
}

/**
 * Force the fire not to burn the instigator, since setting it in the default props is not working for some reason - Ramm
 */
simulated protected function PrepareExplosionTemplate()
{
	local KFPawn KFP;
	local KFPerk CurrentPerk;
	
	ExplosionTemplate.bIgnoreInstigator = true;

    super.PrepareExplosionTemplate();

    if( ExplosionActorClass == class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass() )
    {
		KFP = KFPawn( Instigator );
		if( KFP != none )
		{
			CurrentPerk = KFP.GetPerk();
			if( CurrentPerk != none )
			{
				CurrentPerk.SetLastHX25NukeTime( WorldInfo.TimeSeconds );
			}
		}
	}
}

simulated event HitWall(vector HitNormal, actor Wall, PrimitiveComponent WallComp)
{
    // For some reason on clients up close shots with this projectile
    // get HitWall calls instead of Touch calls. This little hack fixes
    // the problem. TODO: Investigate why this happens - Ramm
    // If we hit a pawn with a HitWall call on a client, do touch instead
    if( WorldInfo.NetMode == NM_Client && Pawn(Wall) != none )
    {
        Touch( Wall, WallComp, Location, HitNormal );
        return;
    }

    Super.HitWall(HitNormal, Wall, WallComp);
}

/** Only allow this projectile to cause a nuke if there hasn't been another nuke very recently */
simulated function bool AllowNuke()
{
	local KFPawn KFP;
	local KFPerk CurrentPerk;

	KFP = KFPawn( Instigator );
	if( KFP != none )
	{
		CurrentPerk = KFP.GetPerk();
		if( CurrentPerk != none && `TimeSince(CurrentPerk.GetLastHX25NukeTime()) < 1.00f )
		{
			return false;
		}
	}

	return super.AllowNuke();
}

defaultproperties
{
	Physics=PHYS_Projectile
	Speed=10000
	MaxSpeed=10000
	TerminalVelocity=20000
	GravityScale=0.001
    MomentumTransfer=50000.0
    ArmDistSquared=0 // Arm instantly

	bWarnAIWhenFired=true

	ProjFlightTemplate=ParticleSystem'WEP_HX25_Pistol_EMIT.FX_HX25_Pistol_Projectile_small'
	ProjFlightTemplateZedTime=ParticleSystem'WEP_HX25_Pistol_EMIT.FX_HX25_Pistol_Projectile_small_ZEDTIME'
	AltExploEffects=KFImpactEffectInfo'WEP_HX25_Pistol_ARCH.HX25_Pistol_Submunition_Explosion_Concussive_Force'
	ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'

	// Grenade explosion light
	Begin Object Class=PointLightComponent Name=ExplosionPointLight
	    LightColor=(R=252,G=218,B=171,A=255)
		Brightness=4.f
		Radius=250.f
		FalloffExponent=10.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=False
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

	// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=50
		DamageRadius=150
		DamageFalloffExponent=1.0f
		DamageDelay=0.f

		MomentumTransferScale=1.f

		// Damage Effects
		MyDamageType=class'KFDT_ExplosiveSubmunition_HX25'
		KnockDownStrength=10
		FractureMeshRadius=200.0
		FracturePartVel=500.0
		ExplosionEffects=KFImpactEffectInfo'WEP_HX25_Pistol_ARCH.HX25_Pistol_Submunition_Explosion'
		ExplosionSound=AkEvent'WW_WEP_SA_HX25.Play_WEP_SA_HX25_Mini_Explosion'
		bIgnoreInstigator=true
		ActorClassToIgnoreForDamage=class'KFProj_ExplosiveSubmunition_HX25'

        // Dynamic Light
        ExploLight=ExplosionPointLight
        ExploLightStartFadeOutTime=0.0
        ExploLightFadeOutTime=0.3

		// Camera Shake
		CamShake=KFCameraShake'FX_CameraShake_Arch.Guns.HX25_Submunition_CameraShake'
		CamShakeInnerRadius=150
		CamShakeOuterRadius=300
		CamShakeFalloff=1.f
		bOrientCameraShakeTowardsEpicenter=true
	End Object
	ExplosionTemplate=ExploTemplate0

    //AmbientSoundPlayEvent=AkEvent'WW_WEP_Bullet_FlyBys.Play_WEP_Bullet_Flyby_Small'
    //AmbientSoundStopEvent=AkEvent'WW_WEP_Bullet_FlyBys.Stop_WEP_Bullet_Flyby_Small'

    AlwaysRelevantDistanceSquared=2250000 // 15m
}

