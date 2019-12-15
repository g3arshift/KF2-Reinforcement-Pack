//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Reaper extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Shotgun_Reaper"

	BuyPrice=9500
	AmmoPricePerMag=80 //32
	ImagePath="WEP_UI_Reaper_TEX.UI_WeaponSelect_Reaper"

	EffectiveRange=60

	UpgradePrice[0]=2900
	UpgradePrice[1]=5700

	UpgradeSellPrice[0]=2325
	UpgradeSellPrice[1]=5250
}
