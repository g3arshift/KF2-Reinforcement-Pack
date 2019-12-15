//=============================================================================
// KFProj_NanoGasGrenade
//=============================================================================
// Nano gas player healing/zed hurting projectile class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibso
//=============================================================================

class KFProj_HealthPack extends KFProj_MedicGrenade;

//var array<KFPawn> HealedPawns; 

simulated function PostBeginPlay()
{
	super(KFProjectile).PostBeginPlay();
	RandSpin(100);
}

simulated event GrenadeIsAtRest()
{
	super.GrenadeIsAtRest();

	if (Role == ROLE_Authority)
	{
		ProjEffectsFadeOutDuration=PostExplosionLifetime;
		SetTimer(FuseTime, false, 'ExplodeTimer');
	}
}

simulated function Destroyed()
{
	HealedPawns.Remove( 0, HealedPawns.Length );

	super.Destroyed();
}


simulated protected function StopFlightEffects();

defaultproperties
{
	FuseTime=0.5  //1
	PostExplosionLifetime=25

    LandedTranslationOffset=(X=2)
	bStopAmbientSoundOnExplode=false

	ExplosionActorClass=class'KFExplosion_MedicGrenade'
	WeaponSelectTexture=Texture2D'WEP_UI_CAREPACK_TEX.UI_HP'

	// Grenade explosion light
	Begin Object Name=ExplosionPointLight
	    LightColor=(R=255,G=0,B=0,A=255)
		Brightness=5.f
		Radius=1500.f
		FalloffExponent=10.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=True
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

	// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=50  //50
		DamageRadius=550
		DamageFalloffExponent=0.f
		DamageDelay=0.f
		MyDamageType=class'KFDT_Toxic_MedicGrenade'

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

	// Temporary effect (5.14.14)
	ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
	bAllowTossDuringZedGrabRotation=true

	AssociatedPerkClass=class'KFPerk_FieldMedic'
}


