//=============================================================================
// KFDT_Bludgeon_PowerGloves
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_Balrog9 extends KFDT_Bludgeon
	abstract
	hidedropdown;

defaultproperties
{
	KDamageImpulse=2700 //1250
	KDeathUpKick=500
	KDeathVel=600 //250

	MeleeHitPower=250 //100
	StunPower=0
	StumblePower=150

	WeaponDef=class'KFWeapDef_Balrog9'
	ModifierPerkList(0)=class'KFPerk_Berserker'
}
