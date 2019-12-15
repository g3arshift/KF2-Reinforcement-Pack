//=============================================================================
// KFDT_Piercing_KnifeStab
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_BHawkStab extends KFDT_Piercing
	abstract
	hidedropdown;

defaultproperties
{
	KDamageImpulse=310
	KDeathUpKick=270

	// Hit reactions	
	StumblePower=12
	StunPower=0
	MeleeHitPower=50

	WeaponDef=class'KFWeapDef_Melee_BHawk'
	ModifierPerkList(0)=class'KFPerk_SWAT'
}
