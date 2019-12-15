//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_SAIGRY extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_AssaultRifle_SAIGRY"

	BuyPrice=900
	AmmoPricePerMag=30
	ImagePath="WEP_SAI_GRY_TEX.UI_SAIGRY_TEX"

	EffectiveRange=60

	UpgradePrice[0]=1000
	UpgradePrice[1]=3000

	UpgradeSellPrice[0]=853
	UpgradeSellPrice[1]=2570

}
