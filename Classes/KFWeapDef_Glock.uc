//=============================================================================
// KFWeapDef_Glock
//=============================================================================
// WeaponDefinition for the Glock
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Copyright (C) 2017 HickDead
//=============================================================================
class KFWeapDef_Glock extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Pistol_Glock"

	BuyPrice=1100
	AmmoPricePerMag=100
	ImagePath="Texture2D'WEP_UI_Glock_TEX.UI_WeaponSelect_Glock'"

	EffectiveRange=50

	UpgradePrice[0]=1800
	UpgradePrice[1]=2700
	UpgradePrice[2]=4500

	UpgradeSellPrice[0]=1652
	UpgradeSellPrice[1]=2152
	UpgradeSellPrice[2]=4150
}
