//=============================================================================
// KFDT_Explosive_Seeker6
//=============================================================================
// Explosive damage type for the Seeker6 rocket launcher rocket
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDT_Explosive_Seeker3K extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
	bShouldSpawnPersistentBlood=true

	// physics impact
	RadialDamageImpulse=12000
	KDeathUpKick=2000
	KDeathVel=550

	KnockdownPower=70 //225
	StumblePower=76 //400


	//Perk
	ModifierPerkList(0)=class'KFPerk_Demolitionist'

	ObliterationHealthThreshold=-500
	ObliterationDamageThreshold=500
	WeaponDef=class'KFWeapDef_Seeker3K'
}
