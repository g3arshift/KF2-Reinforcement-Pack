//=============================================================================
// KFDT_Slashing_KnifeHeavy_SWAT
//=============================================================================
// Heavy slashing damagetype for SWAT knife
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFDT_Slashing_BHawk extends KFDT_Slashing_Knife
	abstract
	hidedropdown;

defaultproperties
{
	KnockdownPower=0
	StunPower=0
 	StumblePower=40
	MeleeHitPower=50	
	
	KDamageImpulse=200
	KDeathUpKick=300
	WeaponDef=class'KFWeapDef_Melee_BHawk'

	ModifierPerkList(0)=class'KFPerk_SWAT'
}