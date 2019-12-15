//=============================================================================
// KFDT_Ballistic_SCAR
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 10/30/2013
//=============================================================================

class KFDT_Ballistic_H134 extends KFDT_Ballistic_AssaultRifle
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
	GibImpulseScale=0.85
	KDeathUpKick=-600
	KDeathVel=450
	
	BloodSpread=0.4
	BloodScale=0.6

	KDamageImpulse=900
	
	StumblePower=16
	GunHitPower=0

	WeaponDef=class'KFWeapDef_H134'
	
	//Perk
	ModifierPerkList(0)=class'KFPerk_FieldMedic'
	ModifierPerkList(1)=class'KFGame.KFPerk_Support'
}
