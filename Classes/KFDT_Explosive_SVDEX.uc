//=============================================================================
// KFDT_Explosive_M16M203
//=============================================================================
// Explosive damage type for the M16M203 Grenade launcher grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// -Brooks Butler
//=============================================================================

class KFDT_Explosive_SVDEX extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
	bShouldSpawnPersistentBlood=true

	// physics impact
	RadialDamageImpulse=2500//3000
	GibImpulseScale=0.3
	KDeathUpKick=1000
	KDeathVel=300

	KnockdownPower=180
	StumblePower=600


	//Perk
	ModifierPerkList(0)=class'KFPerk_Survivalist'
	
	WeaponDef=class'KFWeapDef_SVDEX'
}
