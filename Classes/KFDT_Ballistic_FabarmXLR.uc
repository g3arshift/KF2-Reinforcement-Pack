//=============================================================================
// KFDT_Ballistic_M4Shotgun
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 4/9/2014
//=============================================================================

class KFDT_Ballistic_FabarmXLR extends KFDT_Ballistic_Shotgun
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
		case 'chest':
		case 'heart':
	 		return true;
	}

	return false;
}

defaultproperties
{
	BloodSpread=0.5
	BloodScale=0.7

	KDamageImpulse=900
	KDeathUpKick=-500
	KDeathVel=350
	//KDamageImpulse=350
	//KDeathUpKick=120
	//KDeathVel=10

    KnockdownPower=0
	StumblePower=12
	GunHitPower=0

	WeaponDef=class'KFWeapDef_FabarmXLR'
}
