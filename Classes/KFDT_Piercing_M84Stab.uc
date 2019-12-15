//=============================================================================
// KFDT_Piercing_KnifeStab
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_M84Stab extends KFDT_Piercing
	abstract
	hidedropdown;

defaultproperties
{
	KDamageImpulse=200
	KDeathUpKick=220

	// Hit reactions	
	StumblePower=9
	StunPower=0
	MeleeHitPower=48

	WeaponDef=class'KFWeapDef_Melee_M84'
	ModifierPerkList(0)=class'KFPerk_Support'
}
