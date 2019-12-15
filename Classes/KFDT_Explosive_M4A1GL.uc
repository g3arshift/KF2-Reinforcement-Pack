//=============================================================================
// KFDT_Explosive_M16M203
//=============================================================================
// Explosive damage type for the M16M203 Grenade launcher grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// -Brooks Butler
//=============================================================================

class KFDT_Explosive_M4A1GL extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
	bShouldSpawnPersistentBlood=true

	// physics impact
	RadialDamageImpulse=2200//3000
	GibImpulseScale=0.2
	KDeathUpKick=12100
	KDeathVel=310

	KnockdownPower=170
	StumblePower=500


	//Perk
	ModifierPerkList(0)=class'KFPerk_Demolitionist'
	
	WeaponDef=class'KFWeapDef_M4A1GL'
}
