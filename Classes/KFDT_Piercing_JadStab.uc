//=============================================================================
// KFDT_Piercing_KnifeStab
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_JadStab extends KFDT_Piercing
	abstract
	hidedropdown;

defaultproperties
{
	KDamageImpulse=250
	KDeathUpKick=270

	// Hit reactions	
	StumblePower=9
	StunPower=0
	MeleeHitPower=40

	WeaponDef=class'KFWeapDef_Melee_Jad'
	ModifierPerkList(0)=class'KFPerk_Commando'
}
