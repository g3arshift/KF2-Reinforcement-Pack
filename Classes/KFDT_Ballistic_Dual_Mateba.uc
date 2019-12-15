//=============================================================================
// KFDT_Ballistic_SW500_Dual
//=============================================================================
// SW500 dual revolver damage type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFDT_Ballistic_Dual_Mateba extends KFDT_Ballistic_SW500
	abstract
	hidedropdown;

defaultproperties
{
	ModifierPerkList.Empty
	ModifierPerkList(0)=class'KFPerk_Gunslinger'
}