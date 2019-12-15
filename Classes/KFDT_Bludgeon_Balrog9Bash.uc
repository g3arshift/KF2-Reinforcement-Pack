//=============================================================================
// KFDT_Bludgeon_PowerGlovesBash
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_Balrog9Bash extends KFDT_Bludgeon_Balrog9
	abstract
	hidedropdown;

defaultproperties
{
	
	KDamageImpulse=3500 //1500
	KDeathUpKick=800
	KDeathVel=575 //400

	KnockdownPower=0
	StunPower=0
    StumblePower=100
    MeleeHitPower=100

    WeaponDef=class'KFWeapDef_Balrog9'
}
