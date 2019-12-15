//=============================================================================
// KFDT_Ballistic_Bullpup
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 10/30/2013
//=============================================================================

class KFDT_Ballistic_STAR21 extends KFDT_Ballistic_AssaultRifle
	abstract
	hidedropdown;

defaultproperties
{
    KDamageImpulse=900
	KDeathUpKick=-300
	KDeathVel=100
	
	StumblePower=10
	GunHitPower=0

	WeaponDef=class'KFWeapDef_STAR21'

	//Perk
	ModifierPerkList(0)=class'KFPerk_Sharpshooter'
}
