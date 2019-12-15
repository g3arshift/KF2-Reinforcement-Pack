//=============================================================================
// KFWeap_CommandoKnife
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 4/14/2014
//=============================================================================

class KFWeap_Edged_Tanto extends KFWeap_MeleeBase;

defaultproperties
{
		// Zooming/Position
	PlayerViewOffset=(X=10,Y=10,Z=0)

	// Content
	PackageKey="TantoBlade"
	FirstPersonMeshName="WEP_TantoBlade_MESH.Wep_1stP_TantoBlade_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_CommandoKnife_ANIM.Wep_1stP_CommKnife_Anim"
	PickupMeshName="WEP_TantoBlade_MESH.Wep_TantoBlade_Pickup"
	AttachmentArchetypeName="WEP_TantoBlade_ARCH.Wep_TantoBlade_3P"

	Begin Object Name=FirstPersonMesh
		AnimSets(0)=AnimSet'WEP_1P_CommandoKnife_ANIM.Wep_1stP_CommKnife_Anim'
	End Object

	// Inventory
	AssociatedPerkClasses(0)=class'KFPerk_Gunslinger'
	WeaponSelectTexture=Texture2D'WEP_TantoBlade_TEX.UI_TantoBlade_TEX'

	// Inventory
	InventorySize=1
	bCanThrow=true
	bDropOnDeath=true
	bIsBackupWeapon=false
	GroupPriority=10
	
	// Content

	Begin Object Name=MeleeHelper_0
		MaxHitRange=190
		WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
		// Override automatic hitbox creation (advanced)
		HitboxChain.Add((BoneOffset=(Y=+4,Z=190)))
		HitboxChain.Add((BoneOffset=(Y=+4,Z=170)))
		HitboxChain.Add((BoneOffset=(Y=+4,Z=150)))
		HitboxChain.Add((BoneOffset=(Y=+4,Z=125)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=190)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=170)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=150)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=125)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=100)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=95)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=90)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=85)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=80)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=75)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=65)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=60)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=55)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=50)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=25)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=0)))
		HitboxChain.Add((BoneOffset=(Z=-25)))
		MeleeImpactCamShakeScale=0.03f //0.2
		// modified combo sequences
		ChainSequence_F=(DIR_ForwardRight, DIR_ForwardLeft, DIR_ForwardRight, DIR_ForwardLeft)
		ChainSequence_B=(DIR_BackwardLeft, DIR_BackwardRight, DIR_BackwardLeft, DIR_ForwardRight)
		ChainSequence_L=(DIR_Right, DIR_ForwardLeft, DIR_ForwardRight, DIR_Left, DIR_Right)
		ChainSequence_R=(DIR_Left, DIR_ForwardRight, DIR_ForwardLeft, DIR_Right, DIR_Left)
	End Object

	InstantHitDamage(DEFAULT_FIREMODE)=50 // 77% of 19
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Slashing_M84'

	InstantHitDamage(HEAVY_ATK_FIREMODE)=87
	InstantHitDamageTypes(HEAVY_ATK_FIREMODE)=class'KFDT_Slashing_M84Heavy'

	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Piercing_M84Stab'
	InstantHitDamage(BASH_FIREMODE)=40
	InstantHitMomentum(BASH_FIREMODE)=1000.f   //30000.f

	MaxChainAtkCount=6
	ParryDamageMitigationPercent=0.7
	BlockDamageMitigation=0.7

	// Block Sounds
	BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
	ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'

	ParryStrength=3

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.45f), (Stat=EWUS_Damage1, Scale=1.45f), (Stat=EWUS_Damage2, Scale=1.45f), (Stat=EWUS_Weight, Add=0)))
}
