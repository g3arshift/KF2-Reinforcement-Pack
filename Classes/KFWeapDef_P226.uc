//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_P226 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Pistol_P226"

	BuyPrice=500
	AmmoPricePerMag=20
	ImagePath="WEP_P226_TEX.UI_P226_TEX"

	EffectiveRange=50

	UpgradePrice[0]=650
	UpgradePrice[1]=3500

	UpgradeSellPrice[0]=510
	UpgradeSellPrice[1]=2580
}
