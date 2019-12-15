//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Scythe extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Edged_Scythe"
	
	BuyPrice=20500
	ImagePath="Texture2D'WEP_UI_Scythe_TEX.UI_Scythe_TEX'"

	EffectiveRange=120

	UpgradePrice[0]=3100
	UpgradePrice[1]=6000

	UpgradeSellPrice[0]=2750
	UpgradeSellPrice[1]=5350

}
