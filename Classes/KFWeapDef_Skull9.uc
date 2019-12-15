//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Skull9 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Skull9"
	
	BuyPrice=40000
	ImagePath="Texture2D'WEP_UI_SKULL9_TEX.ui_skull9_select'"

	EffectiveRange=120

	UpgradePrice[0]=5000
	UpgradePrice[1]=10000

	UpgradeSellPrice[0]=5000
	UpgradeSellPrice[1]=10000

}
