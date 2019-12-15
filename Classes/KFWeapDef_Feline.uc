//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Feline extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_AssaultRifle_Feline"

	BuyPrice=4300
	AmmoPricePerMag=100
	ImagePath="Texture2D'WEP_FELINE_TEX.UI_FELINE_TEX'"

	EffectiveRange=70

	UpgradePrice[0]=2100
	UpgradePrice[1]=5000

	UpgradeSellPrice[0]=1954
	UpgradeSellPrice[1]=3512
}
