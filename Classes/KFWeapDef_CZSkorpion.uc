//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_CZSkorpion extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_SMG_CZSkorpion"

	BuyPrice=1300
	AmmoPricePerMag=30 //22 //33
	ImagePath="WEP_CZSkorpion_TEX.UI_CZSkorpion_TEX"

	EffectiveRange=70

	UpgradePrice[0]=1300
	UpgradePrice[1]=3000

	UpgradeSellPrice[0]=957
	UpgradeSellPrice[1]=2150
}