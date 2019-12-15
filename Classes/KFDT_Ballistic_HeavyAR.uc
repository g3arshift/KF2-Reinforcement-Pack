//=============================================================================
// KFDT_Ballistic_Stoner63A
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDT_Ballistic_HeavyAR extends KFDT_Ballistic_AssaultRifle
	abstract
	hidedropdown;

defaultproperties
{
    KDamageImpulse=1000
	KDeathUpKick=-350
	KDeathVel=100
	
	StumblePower=25
	GunHitPower=0

	WeaponDef=class'KFWeapDef_HeavyAR'

	//Perk
	ModifierPerkList(0)=class'KFPerk_Commando'
}