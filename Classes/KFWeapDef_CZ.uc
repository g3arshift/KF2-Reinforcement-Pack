//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_CZ extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WarfaceArsenal.KFWeap_Pistol_CZ"

	BuyPrice=850
	AmmoPricePerMag=30
	ImagePath="WEP_CZ_TEX.UI_CZ75_TEX"

	EffectiveRange=50

	UpgradePrice[0]=650
	UpgradePrice[1]=750
	UpgradePrice[2]=1500

	UpgradeSellPrice[0]=445
	UpgradeSellPrice[1]=600
	UpgradeSellPrice[2]=1256
}
