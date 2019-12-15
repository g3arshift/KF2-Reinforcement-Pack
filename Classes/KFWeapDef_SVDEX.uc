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
class KFWeapDef_SVDEX extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_SVDEX"
	
	BuyPrice=120000
	AmmoPricePerMag=60 //30
	ImagePath="WEP_SVDEX_TEX.UI_SVDEX_TEX"

	EffectiveRange=80

	SecondaryAmmoMagSize=1
	SecondaryAmmoMagPrice=30 //13

	UpgradePrice[0]=8000

	UpgradeSellPrice[0]=7190
}
