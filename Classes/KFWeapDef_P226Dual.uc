//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_P226Dual extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Pistol_DualP226"

	BuyPrice=1000
	AmmoPricePerMag=40
	ImagePath="WEP_P226_TEX.UI_DUAL_P226_TEX"

	EffectiveRange=50

	UpgradePrice[0]=1000
	UpgradePrice[1]=5000

	UpgradeSellPrice[0]=900
	UpgradeSellPrice[1]=4210
}
