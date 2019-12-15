//=============================================================================
// KFDT_Slashing_KnifeHeavy_SWAT
//=============================================================================
// Heavy slashing damagetype for SWAT knife
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFDT_Slashing_TantoHeavy extends KFDT_Slashing_KnifeHeavy
	abstract
	hidedropdown;

defaultproperties
{
	KnockdownPower=0
	StunPower=0
 	StumblePower=40
	MeleeHitPower=70	
	
	KDamageImpulse=300
	KDeathUpKick=320
	WeaponDef=class'KFWeapDef_Melee_Tanto'
	
	ModifierPerkList(0)=class'KFPerk_Gunslinger'
}