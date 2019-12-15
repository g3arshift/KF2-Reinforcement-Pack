//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_STAR21 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Rifle_STAR21"

	BuyPrice=1500
	AmmoPricePerMag=30
	ImagePath="WEP_STAR21_TEX.UI_STAR21_TEX"

	EffectiveRange=72

	UpgradePrice[0]=1500

	UpgradeSellPrice[0]=875
}
