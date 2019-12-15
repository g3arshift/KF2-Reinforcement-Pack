//=============================================================================
// KFDT_Ballistic_HX25SubmunitionImpact
//=============================================================================
// Submunition impact damage type for the HX25 Grenade pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibso
//=============================================================================

class KFDT_Ballistic_ReaperExpSubmunitionImpact extends KFDT_Ballistic_RPG7Impact
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
	BloodSpread=0.4
	BloodScale=0.6
	EffectGroup=FXG_UnexplodedGrenade

	KDamageImpulse=350
	KDeathUpKick=120
	KDeathVel=10

    KnockdownPower=0
	StumblePower=75
	GunHitPower=0

	WeaponDef=class'KFWeapDef_Reaper'

	//Perk
	ModifierPerkList(0)=class'KFPerk_Support'
}
