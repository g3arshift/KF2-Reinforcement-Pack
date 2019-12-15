//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_FO12 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Shotgun_FO12"

	BuyPrice=4000
	AmmoPricePerMag=90 //110 //82
	ImagePath="Wep_FO12_TEX.UI_FO12_TEX"

	EffectiveRange=30

	UpgradePrice[0]=3500

	UpgradeSellPrice[0]=2850
}
