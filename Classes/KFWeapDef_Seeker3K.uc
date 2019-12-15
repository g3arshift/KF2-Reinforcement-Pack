//=============================================================================
// KFWeapDef_Seeker6
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Seeker3K extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_RocketLauncher_Seeker3K"

	BuyPrice=6500
	AmmoPricePerMag=100
	ImagePath="Texture2D'WEP_UI_SEEKER3K_TEX.UI_WeaponSelect_Seeker3K'"

	EffectiveRange=100

	UpgradePrice[0]=2500
	UpgradePrice[1]=5000

	UpgradeSellPrice[0]=2375
	UpgradeSellPrice[1]=4625
}