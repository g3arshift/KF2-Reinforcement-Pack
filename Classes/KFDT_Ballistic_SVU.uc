//=============================================================================
// KFDT_Ballistic_Bullpup
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 10/30/2013
//=============================================================================

class KFDT_Ballistic_SVU extends KFDT_Ballistic_AssaultRifle
	abstract
	hidedropdown;

defaultproperties
{
    KDamageImpulse=900
	KDeathUpKick=-300
	KDeathVel=100
	
	StumblePower=15
	GunHitPower=0

	WeaponDef=class'KFWeapDef_SVU'

	//Perk
	ModifierPerkList(0)=class'KFPerk_Sharpshooter'
}
