//=============================================================================
// KFProj_Bullet_PistolGlock
//=============================================================================
// Bullet class for Glock pistols
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC, John "Ramm-Jaeger" Gibson
// Copyright (C) 2017 HickDead
//=============================================================================

class KFProj_Bullet_PistolGlock extends KFProj_Bullet
	hidedropdown;

defaultproperties
{
	MaxSpeed=15000.0
	Speed=15000.0

	DamageRadius=0

	ProjFlightTemplate=ParticleSystem'FX_Projectile_EMIT.FX_Tracer_9MM_ZEDTime'
}

