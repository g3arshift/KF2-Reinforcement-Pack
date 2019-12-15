//=============================================================================
// KFDT_Explosive_RPG7
//=============================================================================
// Explosive damage type for the RPG rocket launcher rocket
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Explosive_RLPRO extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
	bShouldSpawnPersistentBlood=true

	// physics impact
	RadialDamageImpulse=4500//10000
	GibImpulseScale=0.19
	KDeathUpKick=1500//2000
	KDeathVel=500

	KnockdownPower=425
	StumblePower=600

	//Perk
	ModifierPerkList(0)=class'KFPerk_Demolitionist'

	ObliterationHealthThreshold=-500
	ObliterationDamageThreshold=500
	WeaponDef=class'KFWeapDef_RLPRO'
}
