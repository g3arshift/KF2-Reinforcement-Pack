//=============================================================================
// KFProj_MedicGrenade_Mini
//=============================================================================
// Alt-ammo class for KFWeap_AssaultRifle_MedicGrenadeLauncher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFProj_XM25Healing_Nade extends KFProj_MedicGrenade;

simulated event HitWall(vector HitNormal, actor Wall, PrimitiveComponent WallComp)
{
	local TraceHitInfo HitInfo;

	super.HitWall(HitNormal, Wall, WallComp);

	// Damage some destructibles...
	if (Pawn(Wall) == none && !Wall.bStatic && Wall.bCanBeDamaged)
	{
		HitInfo.HitComponent = WallComp;
		HitInfo.Item = INDEX_None;
		Wall.TakeDamage(Damage, InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType, HitInfo, self);
	}
}

/** Adjusts movement/physics of projectile.
  * Returns true if projectile actually bounced / was allowed to bounce */
simulated function bool Bounce( vector HitNormal, Actor BouncedOff )
{
	super.Bounce(HitNormal, BouncedOff);

	// stop and drop
	Disable( 'Touch' );
	Velocity = vect(0,0,0);
	return true;
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	// ... Damage other destructibles?
    if (Other != Instigator && !Other.bStatic)
    {
		if (!CheckRepeatingTouch(Other) && Other.GetTeamNum() != GetTeamNum())
		{
			ProcessBulletTouch(Other, HitLocation, HitNormal);
		}
    }

	Disable( 'Touch' );
	Velocity = Vect(0,0,0);
}

defaultproperties
{
    Speed=4000
    MaxSpeed=4000
    TerminalVelocity=4000
    GravityScale=0.5
    TossZ=200

	FuseTime=0.01
	PostExplosionLifetime=25

	bWarnAIWhenFired=true

	bDamageDestructiblesOnTouch=true
	Damage=50
	MyDamageType=class'KFDT_Ballistic_XM25HealingNadeImpact'
	
    ProjFlightTemplate=ParticleSystem'WEP_3P_M79_EMIT.FX_M79_40mm_Projectile'
    ProjFlightTemplateZedTime=ParticleSystem'WEP_3P_M79_EMIT.FX_M79_40mm_Projectile_ZEDTIME'
	ExplosionActorClass=class'KFExplosion_MedicGrenadeMini'
	
	// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=60  //50  //150
		DamageRadius=653 //350
		DamageFalloffExponent=0.f
		DamageDelay=0.f
		MyDamageType=class'KFDT_Toxic_MedicGrenadeLauncher'

		// Damage Effects
		KnockDownStrength=0
		KnockDownRadius=0
		FractureMeshRadius=0
		FracturePartVel=0
		ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.MedicGrenade_Explosion'
		ExplosionSound=AkEvent'WW_WEP_Medic_GrenadeLauncher.Play_WEP_Medic_GrenadeLauncher_Grenade_Explosion'
		MomentumTransferScale=0

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

	AssociatedPerkClass=class'KFPerk_FieldMedic'
}