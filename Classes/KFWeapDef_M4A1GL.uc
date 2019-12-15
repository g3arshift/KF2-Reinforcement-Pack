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
class KFWeapDef_M4A1GL extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_AssaultRifle_M4A1GL"
	
	BuyPrice=2800
	AmmoPricePerMag=30 //30
	ImagePath="WEP_M4A1GL_TEX.UI_M4A1GL_TEX"

	EffectiveRange=75

	SecondaryAmmoMagSize=1
	SecondaryAmmoMagPrice=20 //13

	UpgradePrice[0]=2900
	UpgradePrice[1]=5800

	UpgradeSellPrice[0]=2150
	UpgradeSellPrice[1]=4510
}
