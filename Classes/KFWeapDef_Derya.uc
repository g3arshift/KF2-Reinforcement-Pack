//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Derya extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Shotgun_Derya"

	BuyPrice=1800
	AmmoPricePerMag=40 //40
	ImagePath="WEP_DERYA_TEX.UI_DERYA_TEX"

	EffectiveRange=40

	UpgradePrice[0]=1800
	UpgradePrice[1]=3400

	UpgradeSellPrice[0]=725
	UpgradeSellPrice[1]=2750
}
