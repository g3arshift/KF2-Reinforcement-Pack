//=============================================================================
// KFDT_Ballistic_M203Impact
//=============================================================================
// Shell impact damage type for the M79 Grenade launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Chris "schneidzekk" Schneider
//=============================================================================

class KFDT_Ballistic_M4GLImpact extends KFDT_Ballistic_Shell
	abstract
	hidedropdown;

defaultproperties
{
	KDamageImpulse=2000
	KDeathUpKick=750
	KDeathVel=350

	KnockdownPower=145
	StumblePower=360
	GunHitPower=285

	WeaponDef=class'KFWeapDef_M4A1GL'

	ModifierPerkList(0)=class'KFPerk_Demolitionist'
}
