//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_HellFireS extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="WeaponPack.KFWeap_Shotgun_DualHellFire"
   ImagePath="Texture2D'WEP_UI_Dual_HellFireS_TEX.UI_WeaponSelect_DuaHellFireS'"
   //ImagePath="Texture2D'WEP_HeavyAR.UI_HAR_TEX'"
   BuyPrice=15000
   AmmoPricePerMag=100
   EffectiveRange=50

   UpgradePrice[0]=3000
	UpgradePrice[1]=6000

	UpgradeSellPrice[0]=2250
	UpgradeSellPrice[1]=5270

}
