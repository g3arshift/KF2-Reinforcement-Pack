//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_DualPatriot extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Revolver_DualPatriot"

	BuyPrice=1500
	AmmoPricePerMag=80
	ImagePath="Texture2D'WEP_UI_PATRIOT_TEX.UI_DualPatriot_Select'"

	EffectiveRange=130

	UpgradePrice[0]=1800
	UpgradePrice[1]=2800
	UpgradePrice[2]=4800

	UpgradeSellPrice[0]=1625
	UpgradeSellPrice[1]=2650
	UpgradeSellPrice[2]=4530

}
