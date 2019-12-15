//=============================================================================
// KFDT_Piercing_KnifeStab
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_TantoStab extends KFDT_Piercing
	abstract
	hidedropdown;

defaultproperties
{
	KDamageImpulse=200
	KDeathUpKick=220

	// Hit reactions	
	StumblePower=8
	StunPower=0
	MeleeHitPower=44

	WeaponDef=class'KFWeapDef_Melee_Tanto'
	ModifierPerkList(0)=class'KFPerk_Gunslinger'
}
