//=============================================================================
// KFProj_Bullet_PistolColt1911
//=============================================================================
// Bullet class for Colt 1911 pistols
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFProj_Bullet_PistolP226 extends KFProj_Bullet
	hidedropdown;

defaultproperties
{
	MaxSpeed=15000.0
	Speed=15000.0

	DamageRadius=0

	ProjFlightTemplate=ParticleSystem'FX_Projectile_EMIT.FX_Tracer_9MM_ZEDTime'
}

