//=============================================================================
// KFDT_Ballistic_MP5RAS
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//  - Brooks Butler
//=============================================================================

class KFDT_Ballistic_CZSkorpion extends KFDT_Ballistic_Submachinegun
	abstract
	hidedropdown;

defaultproperties
{
	KDamageImpulse=950
	KDeathUpKick=-300
	KDeathVel=100

	StumblePower=15
	GunHitPower=15

	WeaponDef=class'KFWeapDef_CZSkorpion'
	ModifierPerkList(0)=class'KFPerk_SWAT'
}
