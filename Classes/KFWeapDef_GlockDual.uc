//=============================================================================
// KFWeaponDefintion
//=============================================================================
// WeaponDefinition for a set of Glock pistols
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Copyright (C) 2017 HickDead
//=============================================================================
class KFWeapDef_GlockDual extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Pistol_DualGlock"

	BuyPrice=2200
	AmmoPricePerMag=100
	ImagePath="Texture2D'WEP_UI_Dual_Glock_TEX.UI_WeaponSelect_DualGlock'"

	EffectiveRange=50

	UpgradePrice[0]=1800
	UpgradePrice[1]=2700
	UpgradePrice[2]=4500

	UpgradeSellPrice[0]=1652
	UpgradeSellPrice[1]=2152
	UpgradeSellPrice[2]=4150
}
