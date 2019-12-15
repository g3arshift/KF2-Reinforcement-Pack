//=============================================================================
// KFDT_Explosive_Seeker6
//=============================================================================
// Explosive damage type for the Seeker6 rocket launcher rocket
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDT_Explosive_HAR extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
	bShouldSpawnPersistentBlood=true

	// physics impact
	RadialDamageImpulse=600
	KDeathUpKick=300
	KDeathVel=550

	KnockdownPower=70 //225
	StumblePower=30 //400


	//Perk
	ModifierPerkList(0)=class'KFPerk_Demolitionist'

	ObliterationHealthThreshold=-500
	ObliterationDamageThreshold=500
	WeaponDef=class'KFWeapDef_HeavyAR'
}
