//=============================================================================
// KFDT_Piercing_ZweihanderStab
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_BladeBreaker_Stab extends KFDT_Piercing
	abstract
	hidedropdown;

defaultproperties
{
	KDamageImpulse=2500
	KDeathUpKick=350

	KnockdownPower=0
	StunPower=0
	StumblePower=500
	MeleeHitPower=2100

	WeaponDef=class'KFWeapDef_BladeBreaker'
	ModifierPerkList(0)=class'KFPerk_Berserker'
}
