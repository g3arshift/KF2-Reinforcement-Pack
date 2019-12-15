//=============================================================================
// KFProj_NanoGasGrenade
//=============================================================================
// Nano gas player healing/zed hurting projectile class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibso
//=============================================================================

class KFProj_Nade_Medic40mm extends KFProj_BallisticExplosive
	hidedropdown;

DefaultProperties
{
	Physics=PHYS_Falling
    Speed=8000
    MaxSpeed=8000
    TerminalVelocity=5000
    TossZ=150
    GravityScale=0.25
    MomentumTransfer=50000.0
    ArmDistSquared=150000 // 4.0 meters
    LifeSpan=+25.f

    bWarnAIWhenFired=true

    ProjFlightTemplate=ParticleSystem'Wep_M16_M203_EMIT.FX_M16_M203_40mm_Projectile'
    ProjFlightTemplateZedTime=ParticleSystem'Wep_M16_M203_EMIT.FX_M16_M203_40mm_Projectile_ZEDTIME'
    ProjDudTemplate=ParticleSystem'Wep_M16_M203_EMIT.FX_M16_M203_40mm_Projectile_Dud'
    GrenadeBounceEffectInfo=KFImpactEffectInfo'FX_Impacts_ARCH.DefaultGrenadeImpacts'
    ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
    AltExploEffects=KFImpactEffectInfo'WEP_M79_ARCH.M79Grenade_Explosion_Concussive_Force'

    ExplosionActorClass=class'KFExplosion_MedicGrenade'

    // Grenade explosion light
	Begin Object Class=PointLightComponent Name=ExplosionPointLight
	    LightColor=(R=0,G=128,B=255,A=255)
		Brightness=4.f
		Radius=500.f
		FalloffExponent=10.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=True
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

	// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=5  //50
		DamageRadius=600
		DamageFalloffExponent=0.f
		DamageDelay=0.f
		MyDamageType=class'KFDT_Toxic_MedicGrenade'

		// Damage Effects
		KnockDownStrength=0
		KnockDownRadius=0
		FractureMeshRadius=0
		FracturePartVel=0
		ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.MedicGrenade_Explosion'
		ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_Medic.Play_WEP_EXP_Grenade_Medic_Explosion'
		MomentumTransferScale=0

        // Dynamic Light
        ExploLight=ExplosionPointLight
        ExploLightStartFadeOutTime=7.0
        ExploLightFadeOutTime=1.0
        ExploLightFlickerIntensity=5.f
        ExploLightFlickerInterpSpeed=15.f

		// Camera Shake
		CamShake=none
		CamShakeInnerRadius=0
		CamShakeOuterRadius=0
		CamShakeFalloff=1.5f
		bOrientCameraShakeTowardsEpicenter=true
	End Object
	ExplosionTemplate=ExploTemplate0

	AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Projectile_Loop'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_M79.Stop_WEP_SA_M79_Projectile_Loop'
}