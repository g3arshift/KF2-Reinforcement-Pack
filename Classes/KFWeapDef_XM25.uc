//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_XM25 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_GrenadeLauncher_XM25"

	BuyPrice=6500
	AmmoPricePerMag=100
	ImagePath="WEP_XM25_TEX.UI_XM25_TEX"

	EffectiveRange=68

	UpgradePrice[0]=7500
	UpgradePrice[1]=8900

	UpgradeSellPrice[0]=6542
	UpgradeSellPrice[1]=7120
}
