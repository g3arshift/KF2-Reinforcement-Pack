//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_FM9 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_SMG_FM9"

	BuyPrice=1400
	AmmoPricePerMag=28 //26
	ImagePath="WEP_MAGPUL_TEX.UI_MAGPUL_TEX"

	EffectiveRange=70

	UpgradePrice[0]=1000
	UpgradePrice[1]=3500

	UpgradeSellPrice[0]=950
	UpgradeSellPrice[1]=3420
}