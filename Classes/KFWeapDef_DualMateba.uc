//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_DualMateba extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Revolver_DualMateba"

	BuyPrice=4000
	AmmoPricePerMag=50
	ImagePath="WEP_MATEBA_TEX.UI_DUAL_MATEBA_TEX"

	EffectiveRange=50

	UpgradePrice[0]=6000

	UpgradeSellPrice[0]=5250
}
