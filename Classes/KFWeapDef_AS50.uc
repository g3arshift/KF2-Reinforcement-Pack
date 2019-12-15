//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_AS50 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Rifle_AS50"

	BuyPrice=10000
	AmmoPricePerMag=100 //60
	ImagePath="WEP_AS50_TEX.UI_AS50_TEX"

	EffectiveRange=90

	UpgradePrice[0]=15000

	UpgradeSellPrice[0]=8000
}
