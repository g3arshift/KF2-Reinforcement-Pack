//=============================================================================
// KFProj_HighExplosive_M16M203
//=============================================================================
// High explosive grenade launcher grenade for the M16 M203
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Brooks Butler
//=============================================================================

class KFProj_HighExplosive_SVDEX extends KFProj_BallisticExplosive
    hidedropdown;

defaultproperties
{
    Physics=PHYS_Falling
    Speed=4000
    MaxSpeed=4000
    TerminalVelocity=4000
    TossZ=150
    GravityScale=0.5
    MomentumTransfer=50000.0
    ArmDistSquared=150000 // 4.0 meters
    LifeSpan=+1000.0f

    bWarnAIWhenFired=true

    ProjFlightTemplate=ParticleSystem'Wep_M16_M203_EMIT.FX_M16_M203_40mm_Projectile'
    ProjFlightTemplateZedTime=ParticleSystem'Wep_M16_M203_EMIT.FX_M16_M203_40mm_Projectile_ZEDTIME'
    ProjDudTemplate=ParticleSystem'Wep_M16_M203_EMIT.FX_M16_M203_40mm_Projectile_Dud'
    GrenadeBounceEffectInfo=KFImpactEffectInfo'FX_Impacts_ARCH.DefaultGrenadeImpacts'
    ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
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
        Damage=1200 //225
        DamageRadius=800           //800
        DamageFalloffExponent=4    //2
        DamageDelay=0.f

        // Damage Effects
        MyDamageType=class'KFDT_Explosive_SVDEX'
        KnockDownStrength=0
        FractureMeshRadius=200.0
        FracturePartVel=500.0
        ExplosionEffects=KFImpactEffectInfo'Wep_SVDEX_ARCH.SVDEX_M203_Grenade_Explosion'
        ExplosionSound=AkEvent'WW_WEP_SA_RPG7.Play_WEP_SA_RPG7_Explosion'

        // Dynamic Light
        ExploLight=ExplosionPointLight
        ExploLightStartFadeOutTime=0.0
        ExploLightFadeOutTime=0.2

        // Camera Shake
        CamShake=CameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
        CamShakeInnerRadius=0
        CamShakeOuterRadius=0
        CamShakeFalloff=1.f
        bOrientCameraShakeTowardsEpicenter=true
    End Object
    ExplosionTemplate=ExploTemplate0

    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Projectile_Loop'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_M79.Stop_WEP_SA_M79_Projectile_Loop'
}

