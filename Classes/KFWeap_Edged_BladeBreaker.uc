//=============================================================================
// KFWeap_Blunt_ChainBat
//=============================================================================
// 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Zane Gholson
//=============================================================================

class KFWeap_Edged_BladeBreaker extends KFWeap_MeleeBase;

defaultproperties
{
	// Zooming/Position
	PlayerViewOffset=(X=2,Y=0,Z=0)

	// Content
	PackageKey="BladeBreaker"
	FirstPersonMeshName="WEP_BladeBreaker_MESH.Wep_1stP_BladeBreaker_Rig"
	FirstPersonAnimSetNames(0)="Wep_1P_ChainBat_ANIM.Wep_1stP_ChainBat_Anim"
	PickupMeshName="WEP_BladeBreaker_MESH.Wep_BladeBreaker_Pickup"
	AttachmentArchetypeName="WEP_BladeBreaker_ARCH.Wep_BladeBreaker_3P"

	Begin Object Name=MeleeHelper_0
		MaxHitRange=380
		// Override automatic hitbox creation (advanced)
		HitboxChain.Add((BoneOffset=(X=+11,Z=450)))
		HitboxChain.Add((BoneOffset=(X=-11,Z=430)))
		HitboxChain.Add((BoneOffset=(X=+11,Z=410)))
		HitboxChain.Add((BoneOffset=(X=-11,Z=390)))
		HitboxChain.Add((BoneOffset=(X=+11,Z=370)))
		HitboxChain.Add((BoneOffset=(X=-11,Z=350)))
		HitboxChain.Add((BoneOffset=(X=+11,Z=330)))
		HitboxChain.Add((BoneOffset=(X=-11,Z=310)))
		HitboxChain.Add((BoneOffset=(X=+11,Z=370)))
		HitboxChain.Add((BoneOffset=(X=-11,Z=350)))
		HitboxChain.Add((BoneOffset=(X=+11,Z=330)))
		HitboxChain.Add((BoneOffset=(X=-11,Z=310)))
		HitboxChain.Add((BoneOffset=(X=+11,Z=290)))
		HitboxChain.Add((BoneOffset=(X=-11,Z=270)))
		HitboxChain.Add((BoneOffset=(X=+11,Z=250)))
		HitboxChain.Add((BoneOffset=(X=-11,Z=230)))
		HitboxChain.Add((BoneOffset=(X=+11,Z=210)))
		HitboxChain.Add((BoneOffset=(X=+11,Z=190)))
		HitboxChain.Add((BoneOffset=(X=-11,Z=170)))
		HitboxChain.Add((BoneOffset=(X=+11,Z=150)))
		HitboxChain.Add((BoneOffset=(X=-11,Z=130)))
		HitboxChain.Add((BoneOffset=(X=+11,Z=110)))
		HitboxChain.Add((BoneOffset=(X=-11,Z=90)))
		HitboxChain.Add((BoneOffset=(X=+11,Z=70)))
		HitboxChain.Add((BoneOffset=(X=-11,Z=50)))
		HitboxChain.Add((BoneOffset=(X=+11,Z=30)))
		HitboxChain.Add((BoneOffset=(X=+9,Z=450)))
		HitboxChain.Add((BoneOffset=(X=-9,Z=430)))
		HitboxChain.Add((BoneOffset=(X=+9,Z=410)))
		HitboxChain.Add((BoneOffset=(X=-9,Z=390)))
		HitboxChain.Add((BoneOffset=(X=+9,Z=370)))
		HitboxChain.Add((BoneOffset=(X=-9,Z=350)))
		HitboxChain.Add((BoneOffset=(X=+9,Z=330)))
		HitboxChain.Add((BoneOffset=(X=-9,Z=310)))
		HitboxChain.Add((BoneOffset=(X=+9,Z=370)))
		HitboxChain.Add((BoneOffset=(X=-9,Z=350)))
		HitboxChain.Add((BoneOffset=(X=+9,Z=330)))
		HitboxChain.Add((BoneOffset=(X=-9,Z=310)))
		HitboxChain.Add((BoneOffset=(X=+9,Z=290)))
		HitboxChain.Add((BoneOffset=(X=-9,Z=270)))
		HitboxChain.Add((BoneOffset=(X=+9,Z=250)))
		HitboxChain.Add((BoneOffset=(X=-9,Z=230)))
		HitboxChain.Add((BoneOffset=(X=+9,Z=210)))
		HitboxChain.Add((BoneOffset=(X=+9,Z=190)))
		HitboxChain.Add((BoneOffset=(X=-9,Z=170)))
		HitboxChain.Add((BoneOffset=(X=+9,Z=150)))
		HitboxChain.Add((BoneOffset=(X=-9,Z=130)))
		HitboxChain.Add((BoneOffset=(X=+9,Z=110)))
		HitboxChain.Add((BoneOffset=(X=-9,Z=90)))
		HitboxChain.Add((BoneOffset=(X=+9,Z=70)))
		HitboxChain.Add((BoneOffset=(X=-9,Z=50)))
		HitboxChain.Add((BoneOffset=(X=+9,Z=30)))
		HitboxChain.Add((BoneOffset=(X=+7,Z=450)))
		HitboxChain.Add((BoneOffset=(X=-7,Z=430)))
		HitboxChain.Add((BoneOffset=(X=+7,Z=410)))
		HitboxChain.Add((BoneOffset=(X=-7,Z=390)))
		HitboxChain.Add((BoneOffset=(X=+7,Z=370)))
		HitboxChain.Add((BoneOffset=(X=-7,Z=350)))
		HitboxChain.Add((BoneOffset=(X=+7,Z=330)))
		HitboxChain.Add((BoneOffset=(X=-7,Z=310)))
		HitboxChain.Add((BoneOffset=(X=+7,Z=370)))
		HitboxChain.Add((BoneOffset=(X=-7,Z=350)))
		HitboxChain.Add((BoneOffset=(X=+7,Z=330)))
		HitboxChain.Add((BoneOffset=(X=-7,Z=310)))
		HitboxChain.Add((BoneOffset=(X=+7,Z=290)))
		HitboxChain.Add((BoneOffset=(X=-7,Z=270)))
		HitboxChain.Add((BoneOffset=(X=+7,Z=250)))
		HitboxChain.Add((BoneOffset=(X=-7,Z=230)))
		HitboxChain.Add((BoneOffset=(X=+7,Z=210)))
		HitboxChain.Add((BoneOffset=(X=+7,Z=190)))
		HitboxChain.Add((BoneOffset=(X=-7,Z=170)))
		HitboxChain.Add((BoneOffset=(X=+7,Z=150)))
		HitboxChain.Add((BoneOffset=(X=-7,Z=130)))
		HitboxChain.Add((BoneOffset=(X=+7,Z=110)))
		HitboxChain.Add((BoneOffset=(X=-7,Z=90)))
		HitboxChain.Add((BoneOffset=(X=+7,Z=70)))
		HitboxChain.Add((BoneOffset=(X=-7,Z=50)))
		HitboxChain.Add((BoneOffset=(X=+7,Z=30)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=430)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=410)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=390)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=370)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=350)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=330)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=310)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=370)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=350)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=330)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=310)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=290)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=270)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=250)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=230)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=210)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=190)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=170)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=150)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=130)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=110)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=90)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=70)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=50)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=30)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=450)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=430)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=410)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=390)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=370)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=350)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=330)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=310)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=370)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=350)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=330)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=310)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=290)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=270)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=250)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=230)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=210)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=190)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=170)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=150)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=130)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=110)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=90)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=70)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=50)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=30)))
		HitboxChain.Add((BoneOffset=(Z=10)))
		WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
		MeleeImpactCamShakeScale=0.03f //0.3
		// modified combo sequences
		ChainSequence_F=(DIR_Left, DIR_ForwardRight, DIR_ForwardLeft, DIR_ForwardRight, DIR_ForwardLeft)
		ChainSequence_B=(DIR_BackwardRight, DIR_ForwardLeft, DIR_BackwardLeft, DIR_ForwardRight, DIR_Left, DIR_Right, DIR_Left)
		ChainSequence_L=(DIR_Right, DIR_Left, DIR_ForwardRight, DIR_ForwardLeft, DIR_Right, DIR_Left)
		ChainSequence_R=(DIR_Left, DIR_Right, DIR_ForwardLeft, DIR_ForwardRight, DIR_Left, DIR_Right)
	End Object
	
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Slashing_BladeBreaker'
	InstantHitDamage(DEFAULT_FIREMODE)=700// 34
	
	InstantHitDamageTypes(HEAVY_ATK_FIREMODE)=class'KFDT_Slashing_BladeBreaker_Heavy'
	InstantHitDamage(HEAVY_ATK_FIREMODE)=1100 //68

	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Piercing_BladeBreaker_Stab'
	InstantHitDamage(BASH_FIREMODE)=700

	// Inventory
	GroupPriority=200
	InventorySize=12
	WeaponSelectTexture=Texture2D'WEP_BladeBreaker_TEX.UI_BladeBreaker_TEX'
	AssociatedPerkClasses(0)=class'KFPerk_Berserker'
	
	// Block Sounds
	BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
	ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
	
	ParryDamageMitigationPercent=0.9
	BlockDamageMitigation=0.9
	ParryStrength=10

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Damage2, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
}


