//=============================================================================
// KFDT_Slashing_ZweihanderHeavy
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_BladeBreaker_Heavy extends KFDT_Slashing_Katana
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
	KDamageImpulse=3500
	KDeathUpKick=542
	KDeathVel=500

	KnockdownPower=0
	StunPower=0
	StumblePower=900
	MeleeHitPower=4200
	MicrowavePower=100
	SnarePower=50
	BleedPower=10
	BurnPower=2

	WeaponDef=class'KFWeapDef_BladeBreaker'
	ModifierPerkList(0)=class'KFPerk_Berserker'
}
