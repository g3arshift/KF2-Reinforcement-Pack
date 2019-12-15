//=============================================================================
// KFDT_Slashing_ZweihanderHeavy
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_DragonBladeHeavy extends KFDT_Slashing_Katana
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
	KDamageImpulse=1600
	KDeathUpKick=200
	KDeathVel=500

	KnockdownPower=0
	StunPower=0
	StumblePower=100
	MeleeHitPower=100

	WeaponDef=class'WeaponPack.KFWeapDef_DragonBlade'
	ModifierPerkList(0)=class'KFPerk_Berserker'
}
