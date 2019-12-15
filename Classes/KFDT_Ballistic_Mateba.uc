//=============================================================================
// KFDT_Ballistic_SW500
//=============================================================================
// SW500 revolver damage type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFDT_Ballistic_Mateba extends KFDT_Ballistic_Handgun
	abstract
	hidedropdown;

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
    switch ( InHitZoneName )
	{
		case 'lupperarm':
		case 'rupperarm':
		case 'chest':
		case 'heart':
		case 'lcalf':
		case 'rcalf':
		case 'lthigh':
		case 'rthigh':
	 		return true;
	}

	return false;
}

defaultproperties
{
	GoreDamageGroup=DGT_Shotgun

	KDamageImpulse=4500
	KDeathUpKick=-700
	KDeathVel=350

   	KnockdownPower=35
	StumblePower=60
	GunHitPower=250

	WeaponDef=class'KFWeapDef_Mateba'
	ModifierPerkList(0)=class'KFPerk_Gunslinger'
	ModifierPerkList(1)=class'KFPerk_Sharpshooter'
}
