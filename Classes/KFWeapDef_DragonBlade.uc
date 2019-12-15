//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_DragonBlade extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_DragonBlade"
	
	BuyPrice=3500	
	//ImagePath="DragonBlade.ui_select_dragonblade"
	ImagePath="WEP_UI_DragonBlade_TEX.ui_select_dragonblade"

	EffectiveRange=15

	UpgradePrice[0]=3700
	UpgradePrice[1]=5700

	UpgradeSellPrice[0]=3575
	UpgradeSellPrice[1]=5375

}
