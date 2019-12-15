//=============================================================================
// KFDT_Fire_MolotovGrenade
//=============================================================================
// Damage type class for molotov grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFDT_Fire_XM25Grenade extends KFDT_Fire
	abstract
	hidedropdown;

defaultproperties
{
	bShouldSpawnPersistentBlood=false

	// physics impact
	RadialDamageImpulse=0
	KDeathUpKick=0
	KDeathVel=0

	KnockdownPower=0
	StumblePower=100
	BurnPower=25

	// DOT
	DoT_Duration=5.0 //5.0
	DoT_Interval=0.5
	DoT_DamageScale=0.5 //0.2
	bIgnoreSelfInflictedScale=false

	WeaponDef=class'KFWeapDef_XM25'

	ModifierPerkList(0)=class'KFPerk_Demolitionist'
	ModifierPerkList(1)=class'KFPerk_Firebug'
	ModifierPerkList(2)=class'KFPerk_FieldMedic'

}
