//=============================================================================
// KFWeapDef_M16M203
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//	-Brooks Butler
//=============================================================================
class KFWeapDef_M16Medic extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_AssaultRifle_M16Medic"
	
	BuyPrice=2000
	AmmoPricePerMag=30
	ImagePath="WEP_UI_M16_REDDOT_TEX.UI_WeaponSelect_M16M203"

	EffectiveRange=70

	SecondaryAmmoMagSize=1
	SecondaryAmmoMagPrice=50

	UpgradePrice[0]=1900
	UpgradePrice[1]=2900
	UpgradePrice[2]=4900

	UpgradeSellPrice[0]=1756
	UpgradeSellPrice[1]=2725
	UpgradeSellPrice[2]=3525
}
