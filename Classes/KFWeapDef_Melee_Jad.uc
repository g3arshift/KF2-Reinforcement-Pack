//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Melee_Jad extends KFweapDef_Knife_Base
	abstract
	hidedropdown;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Edged_Jad"

	BuyPrice=600 //200
	ImagePath="WEP_Jagdkommando_TEX.UI_Jagdkommando_TEX"
	EffectiveRange=2

	UpgradePrice[0]=900

	UpgradeSellPrice[0]=750
}
