//=============================================================================
// KFProj_Rocket_RPG7
//=============================================================================
// High explosive rocket launcher rocket for the RPG7
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibso
//=============================================================================

class KFProj_Rocket_RLPRO extends KFProj_BallisticExplosive
	hidedropdown;

defaultproperties
{
	Physics=PHYS_Projectile
	Speed=8000
	MaxSpeed=8000
	TossZ=0
	GravityScale=1.0
    MomentumTransfer=50000.0
    ArmDistSquared=150000 // 4 meters

	bWarnAIWhenFired=true

	ProjFlightTemplate=ParticleSystem'WEP_RLPRO_EMIT.FX_RLPRO_Projectile'
	ProjFlightTemplateZedTime=ParticleSystem'WEP_RLPRO_EMIT.FX_RLPRO_Projectile_ZED_TIME'
	ProjDudTemplate=ParticleSystem'WEP_RLPRO_EMIT.FX_RLPRO_Projectile_Dud'
	GrenadeBounceEffectInfo=KFImpactEffectInfo'WEP_RPG7_ARCH.RPG7_Projectile_Impacts'
    ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'

	AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_RPG7.Play_WEP_SA_RPG7_Projectile_Loop'
  	AmbientSoundStopEvent=AkEvent'WW_WEP_SA_RPG7.Stop_WEP_SA_RPG7_Projectile_Loop'

  	AltExploEffects=KFImpactEffectInfo'WEP_RPG7_ARCH.RPG7_Explosion_Concussive_Force'

	// Grenade explosion light
	Begin Object Class=PointLightComponent Name=ExplosionPointLight
	    LightColor=(R=252,G=218,B=171,A=255)
		Brightness=4.f
		Radius=2000.f
		FalloffExponent=10.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=False
		bCastPerObjectShadows=false
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

	// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=1200
		DamageRadius=600    //1000 //250
		DamageFalloffExponent=2  //3
		DamageDelay=0.f

		// Damage Effects
		MyDamageType=class'KFDT_Explosive_RLPRO'
		KnockDownStrength=0
		FractureMeshRadius=200.0
		FracturePartVel=500.0
		ExplosionEffects=KFImpactEffectInfo'WEP_RPG7_ARCH.RPG7_Explosion'
		ExplosionSound=AkEvent'WW_WEP_SA_RPG7.Play_WEP_SA_RPG7_Explosion'

        // Dynamic Light
        ExploLight=ExplosionPointLight
        ExploLightStartFadeOutTime=0.0
        ExploLightFadeOutTime=0.2

		// Camera Shake
		CamShake=CameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
		CamShakeInnerRadius=200
		CamShakeOuterRadius=900
		CamShakeFalloff=1.5f
		bOrientCameraShakeTowardsEpicenter=true
	End Object
	ExplosionTemplate=ExploTemplate0
}
