//=============================================================================
// KFDT_Ballistic_M14EBR
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_AS50 extends KFDT_Ballistic_Rifle
	abstract
	hidedropdown;

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
	KDamageImpulse=2250
	KDeathUpKick=-400
	KDeathVel=250

    KnockdownPower=20
	StunPower=10 //40 //8
	StumblePower=0
	GunHitPower=90 //50
	MeleeHitPower=0

	WeaponDef=class'KFWeapDef_AS50'
	ModifierPerkList(0)=class'KFPerk_Sharpshooter'
}
