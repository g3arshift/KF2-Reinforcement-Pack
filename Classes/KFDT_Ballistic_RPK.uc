//=============================================================================
// KFDT_Ballistic_AK12
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 10/30/2013
//=============================================================================

class KFDT_Ballistic_RPK extends KFDT_Ballistic_AssaultRifle
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
	KDamageImpulse=1300
	KDeathUpKick=-210
	KDeathVel=135
	
	StumblePower=15
	GunHitPower=0

	WeaponDef=class'KFWeapDef_RPK'

	//Perk
	ModifierPerkList(0)=class'KFPerk_Commando'
}
