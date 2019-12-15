//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_FabarmXLR extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Shotgun_FabarmXLR"

	BuyPrice=2700
	AmmoPricePerMag=40 //40
	ImagePath="WEP_FabarmXLR_TEX.UI_XLR5_TEX"

	EffectiveRange=35

	UpgradePrice[0]=2000

	UpgradeSellPrice[0]=1752
}
