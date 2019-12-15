//=============================================================================
// KFWeap_Blunt_Pulverizer
//=============================================================================
// A sledgehammer combined with a makeshift shotgun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Skull9 extends KFWeap_MeleeBase;

defaultproperties
{

	PackageKey="Skull9"
	FirstPersonMeshName="'WEP_1P_SKULL9_MESH.Wep_1stP_Skull9_Rig'"
	FirstPersonAnimSetNames(0)="'WEP_1P_Pulverizer_ANIM.Wep_1stP_Pulverizer_Anim'"
	PickupMeshName="'WEP_3P_SKULL9_MESH.Wep_Skull9_Pickup'"
	AttachmentArchetypeName="'WEP_SKULL9_ARCH.Wep_Skull9_3P'"
	
	AssociatedPerkClasses(0)=class'KFPerk_Berserker'
	
	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_SKULL9_MESH.Wep_Skull9_Pickup'
		Scale=2.0f
		bCastDynamicShadow=FALSE
		CollideActors=FALSE
	End Object

	Begin Object Name=MeleeHelper_0
		MaxHitRange=130
		WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Blunted_melee_impact'
		// Override automatic hitbox creation (advanced)
		HitboxChain.Add((BoneOffset=(Y=+8,Z=250)))
		HitboxChain.Add((BoneOffset=(Y=-8,Z=230)))
		HitboxChain.Add((BoneOffset=(Y=+8,Z=210)))
		HitboxChain.Add((BoneOffset=(Y=-8,Z=190)))
		HitboxChain.Add((BoneOffset=(Y=+8,Z=170)))
		HitboxChain.Add((BoneOffset=(Y=-8,Z=150)))
		HitboxChain.Add((BoneOffset=(Y=+8,Z=130)))
		HitboxChain.Add((BoneOffset=(Y=+8,Z=110)))
		HitboxChain.Add((BoneOffset=(Y=-8,Z=-10)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=330)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=310)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=290)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=270)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=250)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=230)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=210)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=190)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=170)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=190)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=170)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=150)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=130)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=110)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=90)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=70)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=50)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=30)))
		// modified combo sequences
		MeleeImpactCamShakeScale=0.9f //0.5
		ChainSequence_F=(DIR_ForwardRight, DIR_ForwardLeft, DIR_ForwardRight, DIR_ForwardLeft)
		ChainSequence_B=(DIR_BackwardRight, DIR_ForwardLeft, DIR_BackwardLeft, DIR_ForwardRight)
		ChainSequence_L=(DIR_Right, DIR_ForwardLeft, DIR_ForwardRight, DIR_Left, DIR_Right)
		ChainSequence_R=(DIR_Left, DIR_ForwardRight, DIR_ForwardLeft, DIR_Right, DIR_Left)
	End Object

	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
	InstantHitDamage(DEFAULT_FIREMODE)=450
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Slashing_Skull9Light'

	FireModeIconPaths(HEAVY_ATK_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
	InstantHitDamage(HEAVY_ATK_FIREMODE)=700
	InstantHitDamageTypes(HEAVY_ATK_FIREMODE)=class'KFDT_Bludgeon_Skull9Heavy'

	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_PulverizerBash'
	InstantHitDamage(BASH_FIREMODE)=250

	bCanBeReloaded=false
	bReloadFromMagazine=false

	// Inventory
	GroupPriority=130
	InventorySize=10
	WeaponSelectTexture=Texture2D'WEP_UI_SKULL9_TEX.ui_skull9_select'
t
	// Block Effects
	BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Hammer'
	ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Wood'

	// Trader
	ParryDamageMitigationPercent=0.4
	BlockDamageMitigation=0.4

	ParryStrength=8
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
}


