//=============================================================================
// KFDT_Ballistic_Colt1911
//=============================================================================
// Colt 1911 pistol damage type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFDT_Ballistic_P226 extends KFDT_Ballistic_Handgun
	abstract
	hidedropdown;

defaultproperties
{
	KDamageImpulse=1500
	KDeathUpKick=-450
	KDeathVel=200

	KnockdownPower=15
	StumblePower=20
	GunHitPower=110

	WeaponDef=class'KFWeapDef_P226'

	ModifierPerkList(0)=class'KFPerk_Gunslinger'
}
