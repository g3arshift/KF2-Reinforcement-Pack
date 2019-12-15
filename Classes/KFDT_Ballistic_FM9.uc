//=============================================================================
// KFDT_Ballistic_MP7
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//  - Brooks Butler
//=============================================================================

class KFDT_Ballistic_FM9 extends KFDT_Ballistic_Submachinegun
	abstract
	hidedropdown;

defaultproperties
{
	KDamageImpulse=900
	KDeathUpKick=-300
	KDeathVel=100

	StumblePower=10
	GunHitPower=10

	WeaponDef=class'KFWeapDef_FM9'
	ModifierPerkList(0)=class'KFPerk_SWAT'
}
