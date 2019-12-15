//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_BladeBreaker extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="WeaponPack.KFWeap_Edged_BladeBreaker"
	
	BuyPrice=90000	
	ImagePath="WEP_BladeBreaker_TEX.UI_BladeBreaker_TEX"

	EffectiveRange=30

	UpgradePrice[0]=40000

	UpgradeSellPrice[0]=24000
}
