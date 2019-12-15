//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_RLPRO extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_RocketLauncher_RLPRO"

	BuyPrice=3500
	AmmoPricePerMag=80
	ImagePath="Texture2D'WEP_UI_RLPRO_TEX.UI_RLPRO_TEX'"

	EffectiveRange=100

	UpgradePrice[0]=3250
	UpgradePrice[1]=5720

	UpgradeSellPrice[0]=5100
	UpgradeSellPrice[1]=6520
}
