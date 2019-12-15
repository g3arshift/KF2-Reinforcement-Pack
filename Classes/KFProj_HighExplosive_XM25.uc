//=============================================================================
// KFProj_HighExplosive_M79
//=============================================================================
// High explosive grenade launcher grenade for the M79
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibso
//=============================================================================

class KFProj_HighExplosive_XM25 extends KFProj_BallisticExplosive
	hidedropdown;

var class<KFProjectile> ResidualFlameProjClass;

/** Number of lingering fires/fireballs to spawn */
var() int NumResidualFlames;

simulated function SpawnFlightEffects()
{
	super.SpawnFlightEffects();
}

/** Blow up on impact */
simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
	if( StaticMeshComponent(WallComp) != none && StaticMeshComponent(WallComp).CanBecomeDynamic() )
	{
		// pass through meshes that can move (like those little coffee tables in biotics)
		return;
	}

	Explode( Location, HitNormal );
}

/** Blow up on impact */
simulated function ProcessTouch( Actor Other, Vector HitLocation, Vector HitNormal )
{
	if( Other.bBlockActors )
	{
		// don't explode on players
		if ( Pawn(Other) != None && Pawn(Other).GetTeamNum() == GetTeamNum() )
		{
           return;
		}

		// don't explode on client-side-only destructibles
		if( KFDestructibleActor(Other) != none && KFDestructibleActor(Other).ReplicationMode == RT_ClientSide )
		{
			return;
		}

		Explode( Location, HitNormal );
	}
}

/** Overridden to spawn residual flames */
simulated function Explode(vector HitLocation, vector HitNormal)
{
	local vector HitVelocity;
	local KFPerk InstigatorPerk;

	local rotator FlareRot;
	
	// velocity is set to 0 in Explode, so cache it here
	HitVelocity = Velocity;

    super.Explode( HitLocation, HitNormal );

    if( Role < Role_Authority )
    {
    	return;
    }

    SpawnResidualFlames( HitLocation, HitNormal, HitVelocity );

    // spawn flare for flarotov
    if( Instigator != none && Instigator.Controller != none )
    {
    	InstigatorPerk = KFPlayerController(Instigator.Controller).GetPerk();
    	if( InstigatorPerk.IsFlarotovActive() )
    	{
    		FlareRot = rotator( HitVelocity );
    		FlareRot.Pitch = 0;
    		Spawn( class'KFProj_MolotovFlare', self,, HitLocation + HitNormal * 20, FlareRot );
    	}
    }
}

/** Spawn several projectiles that explode and linger on impact */
function SpawnResidualFlames( vector HitLocation, vector HitNormal, vector HitVelocity )
{
	local int i;
	local vector HitVelDir;
	local float HitVelMag;
	local vector SpawnLoc, SpawnVel;

	HitVelMag = VSize( HitVelocity );
	HitVelDir = Normal( HitVelocity );

	SpawnLoc = HitLocation + (HitNormal * 10.f);

	// spawn random lingering fires (rather, projectiles that cause little fires)
	for( i = 0; i < NumResidualFlames; ++i )
	{
		SpawnVel = CalculateResidualFlameVelocity( HitNormal, HitVelDir, HitVelMag );
		SpawnResidualFlame( ResidualFlameProjClass, SpawnLoc, SpawnVel );
	}

	// spawn one where we hit to a flame
	// (we don't give this class a lingering flame because it can hit zeds, and if they die the lingering flame could be left floating)
	SpawnResidualFlame( ResidualFlameProjClass, HitLocation, HitVelocity/3.f );
}

defaultproperties
{
	Physics=PHYS_Projectile
	Speed=6000
	MaxSpeed=6000
	TerminalVelocity=4000
	TossZ=150
	GravityScale=.5
    MomentumTransfer=50000.0
    ArmDistSquared=150000 // 4.0 meters
    LifeSpan=+1000.0f

	bWarnAIWhenFired=true

	ProjFlightTemplate=ParticleSystem'WEP_3P_M79_EMIT.FX_M79_40mm_Projectile'
	ProjFlightTemplateZedTime=ParticleSystem'WEP_3P_M79_EMIT.FX_M79_40mm_Projectile_ZEDTIME'
	ProjDudTemplate=ParticleSystem'WEP_3P_M79_EMIT.FX_M79_40mm_Projectile_Dud'
	GrenadeBounceEffectInfo=KFImpactEffectInfo'FX_Impacts_ARCH.DefaultGrenadeImpacts'
    ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
	AltExploEffects=KFImpactEffectInfo'WEP_M79_ARCH.M79Grenade_Explosion_Concussive_Force'

	ResidualFlameProjClass=class'KFProj_MolotovSplash'
	NumResidualFlames=8

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
	
	Begin Object Class=PointLightComponent Name=FlamePointLight
	    LightColor=(R=245,G=190,B=140,A=255)
		Brightness=3.f
		Radius=700.f
		FalloffExponent=10.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=FALSE
		bCastPerObjectShadows=false
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

	// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=350
		DamageRadius=650          //800
		DamageFalloffExponent=2    //2
		DamageDelay=0.f

		// Damage Effects
		MyDamageType=class'KFDT_Fire_XM25Grenade'
		KnockDownStrength=0
		FractureMeshRadius=200.0
		FracturePartVel=500.0
		ExplosionEffects=KFImpactEffectInfo'WEP_M79_ARCH.M79Grenade_Explosion'
		ExplosionSound=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Explosion'

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

	AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Projectile_Loop'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_M79.Stop_WEP_SA_M79_Projectile_Loop'
}

