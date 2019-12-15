//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_XM8LMG extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_LMG_XM8"

	BuyPrice=8500 //1500
	AmmoPricePerMag=28
	ImagePath="WEP_XM8LMG_TEX.UI_XM8LMG_TEX"

	EffectiveRange=60

	UpgradePrice[0]=9500

	UpgradeSellPrice[0]=6500
}
