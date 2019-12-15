//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_AKA extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_AssaultRifle_AKA"

	BuyPrice=1600
	AmmoPricePerMag=40
	ImagePath="WEP_AKALPHA_TEX.UI_AKA_TEX"

	EffectiveRange=67

	UpgradePrice[0]=1800

	UpgradeSellPrice[0]=1510
}
