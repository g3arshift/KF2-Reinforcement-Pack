//=============================================================================
// KFWeaponDefintion
//=============================================================================
// WeaponDefinition for a set of Glock pistols
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Copyright (C) 2017 HickDead
//=============================================================================
class KFWeapDef_DualUzi extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_SMG_DualUzi"

	BuyPrice=1700
	AmmoPricePerMag=25
	ImagePath="Texture2D'WEP_UZIPRO_TEX.UI_DUAL_UZI_PRO'"

	EffectiveRange=50

	UpgradePrice[0]=700
	UpgradePrice[1]=950
	UpgradePrice[2]=2500

	UpgradeSellPrice[0]=650
	UpgradeSellPrice[1]=750
	UpgradeSellPrice[2]=1500
}
