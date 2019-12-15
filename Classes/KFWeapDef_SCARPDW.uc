//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_SCARPDW extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_SMG_SCARPDW"

	BuyPrice=2800
	AmmoPricePerMag=45 //35
	ImagePath="WEP_SCAR_PDW_TEX.UI_PDW_TEX"

	EffectiveRange=70

    UpgradePrice[0]=2800

	UpgradeSellPrice[0]=2520
}