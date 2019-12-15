//=============================================================================
// KFDT_Slashing_KnifeHeavy_SWAT
//=============================================================================
// Heavy slashing damagetype for SWAT knife
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFDT_Slashing_M84Heavy extends KFDT_Slashing_KnifeHeavy
	abstract
	hidedropdown;

defaultproperties
{
	KnockdownPower=0
	StunPower=0
 	StumblePower=60
	MeleeHitPower=80	
	
	KDamageImpulse=300
	KDeathUpKick=350
	WeaponDef=class'KFWeapDef_Melee_M84'
	
	ModifierPerkList(0)=class'KFPerk_Support'
}