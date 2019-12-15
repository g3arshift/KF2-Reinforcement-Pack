//=============================================================================
// KFDT_Ballistic_SCAR
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 10/30/2013
//=============================================================================

class KFDT_Ballistic_CZ805 extends KFDT_Ballistic_AssaultRifle
	abstract
	hidedropdown;

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
	if( super.CanDismemberHitZone( InHitZoneName ) )
	{
		return true;
	}

	switch ( InHitZoneName )
	{
		case 'lupperarm':
		case 'rupperarm':
	 		return true;
	}

	return false;
}

defaultproperties
{
	KDamageImpulse=650//1100
	GibImpulseScale=0.95
	KDeathUpKick=-200
	KDeathVel=200
	
	StumblePower=25
	GunHitPower=0

	WeaponDef=class'KFWeapDef_CZ805'
	
	//Perk
	ModifierPerkList(0)=class'KFPerk_Commando'
}
