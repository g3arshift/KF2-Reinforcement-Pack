// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_Scythe_Heavy extends KFDT_Slashing_Katana
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
		case 'chest':
		case 'heart':
	 	case 'lhand':
		case 'rhand':
		case 'lfoot':
		case 'rfoot':
		case 'lforearm':
		case 'rforearm':
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
	KDamageImpulse=1000
	KDeathUpKick=600

	StumblePower=60
	MeleeHitPower=120

	WeaponDef=class'WeaponPack.KFWeapDef_Scythe'

	ModifierPerkList(0)=class'KFPerk_Berserker'
}