//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Fabarm extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Shotgun_FabarmSTF12"

	BuyPrice=1200
	AmmoPricePerMag=30 //32
	ImagePath="WEP_Fabarm_TEX.UI_FABARM_TEX"

	EffectiveRange=30

	UpgradePrice[0]=1200
	UpgradePrice[1]=2500

	UpgradeSellPrice[0]=875
	UpgradeSellPrice[1]=1870

}
