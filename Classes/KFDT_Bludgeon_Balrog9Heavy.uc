//=============================================================================
// KFDT_Bludgeon_PowerGlovesHeavy
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_Balrog9Heavy extends KFDT_Bludgeon_Balrog9
	abstract
	hidedropdown;

defaultproperties
{
	KDamageImpulse=3500 //1500
	KDeathUpKick=1000
	KDeathVel=575 //400

	KnockdownPower=90//150
	StunPower=0
	StumblePower=150
	MeleeHitPower=100

	WeaponDef=class'KFWeapDef_Balrog9'
	
	ModifierPerkList(0)=class'KFPerk_Berserker'

}
