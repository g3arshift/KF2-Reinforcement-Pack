//=============================================================================
// KFDT_Explosive_HX25
//=============================================================================
// Explosive damage type for the HX25 Grenade launcher grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Explosive_Patriot extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
	bShouldSpawnPersistentBlood=true

	// physics impact
	RadialDamageImpulse=700//1500
	GibImpulseScale=0.77
	KDeathUpKick=250//500
	KDeathVel=250

	KnockdownPower=30
	StumblePower=40
    MeleeHitPower=100

	//Perk
	ModifierPerkList(0)=class'KFPerk_Demolitionist'
	
	WeaponDef=class'KFWeapDef_Patriot'
}
 