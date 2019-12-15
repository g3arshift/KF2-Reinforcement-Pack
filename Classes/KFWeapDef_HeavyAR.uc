//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_HeavyAR extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="WeaponPack.KFWeap_HeavyAR"
   ImagePath="Texture2D'WEP_UI_HAR_TEX.UI_HAR_TEX'"
   
   BuyPrice=14000
   AmmoPricePerMag=150
   EffectiveRange=500

   	UpgradePrice[0]=4500
	UpgradePrice[1]=7500

    UpgradeSellPrice[0]=4250
	UpgradeSellPrice[1]=7250

}
