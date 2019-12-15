//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Mateba extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Revolver_Mateba"

	BuyPrice=2000
	AmmoPricePerMag=25
	ImagePath="WEP_MATEBA_TEX.UI_MATEBA_TEX"

	EffectiveRange=50

	UpgradePrice[0]=3000

	UpgradeSellPrice[0]=2150
}
