//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Balrog9 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Blunt_Balrog9"
	
	BuyPrice=7000
	ImagePath="Texture2D'WEP_BALROG9_TEX.UI_BALROG9_TEX'"

	EffectiveRange=10

	UpgradePrice[0]=7000
	UpgradePrice[1]=11000

	UpgradeSellPrice[0]=6750
	UpgradeSellPrice[1]=10510

}
