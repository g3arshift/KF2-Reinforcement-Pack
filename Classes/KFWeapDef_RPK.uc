//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_RPK extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_LMG_RPK"

	BuyPrice=9500
	AmmoPricePerMag=40
	ImagePath="WEP_RPK_TEX.UI_RPK_TEX"

	EffectiveRange=67

	UpgradePrice[0]=7500

	UpgradeSellPrice[1]=7120
}
