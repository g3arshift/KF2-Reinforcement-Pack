//=============================================================================
// KFDT_Ballistic_Glock
//=============================================================================
// Glock damage type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC, John "Ramm-Jaeger" Gibson
// Copyright (C) 2017 HickDead
//=============================================================================

class KFDT_Ballistic_Uzi extends KFDT_Ballistic_Handgun
	abstract
	hidedropdown;

defaultproperties
{
	KDamageImpulse=1000
	KDeathUpKick=-300
	KDeathVel=130

	KnockdownPower=12
	StumblePower=10
	GunHitPower=10

	WeaponDef=class'KFWeapDef_Uzi'
	ModifierPerkList(0)=class'KFPerk_SWAT'
}
