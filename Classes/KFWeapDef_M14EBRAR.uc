//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_M14EBRAR extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_AssaultRifle_M14EBR"

	BuyPrice=1700
	AmmoPricePerMag=70 //40
	ImagePath="WEP_UI_M14EBRAR_TEX.UI_WeaponSelect_M14EBRAR"

	EffectiveRange=90

	UpgradePrice[0]=1500
	UpgradePrice[1]=2500
	UpgradePrice[2]=3700

	UpgradeSellPrice[0]=1325
	UpgradeSellPrice[1]=2125
	UpgradeSellPrice[2]=3250
}
