// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Edged_Scythe extends KFWeap_MeleeBase;

defaultproperties
{

	PackageKey="Scythe"
	FirstPersonMeshName="'WEP_1P_Scythe_MESH.Wep_1stP_Scythe_Rig'"
	FirstPersonAnimSetNames(0)="'WEP_1P_Crovel_ANIM.WEP_1P_Crovel_ANIM'"
	PickupMeshName="'WEP_3P_Scythe_MESH.Wep_3P_Scythe_Pickup'"
	AttachmentArchetypeName="'WEP_Scythe_ARCH.Wep_Scythe_3P'"

	Begin Object Name=MeleeHelper_0
		MaxHitRange=270
		// Override automatic hitbox creation (advanced)
		HitboxChain.Add((BoneOffset=(Y=+8,Z=220)))
		HitboxChain.Add((BoneOffset=(Y=-8,Z=215)))
		HitboxChain.Add((BoneOffset=(Y=+8,Z=210)))
		HitboxChain.Add((BoneOffset=(Y=-8,Z=195)))
		HitboxChain.Add((BoneOffset=(Y=+8,Z=190)))
		HitboxChain.Add((BoneOffset=(Y=-8,Z=185)))
		HitboxChain.Add((BoneOffset=(Y=+8,Z=180)))
		HitboxChain.Add((BoneOffset=(Y=+8,Z=175)))
		HitboxChain.Add((BoneOffset=(Y=-8,Z=-10)))
		HitboxChain.Add((BoneOffset=(Y=+8,Z=170)))
		HitboxChain.Add((BoneOffset=(Y=-8,Z=165)))
		HitboxChain.Add((BoneOffset=(Y=+8,Z=160)))
		HitboxChain.Add((BoneOffset=(Y=-8,Z=155)))
		HitboxChain.Add((BoneOffset=(Y=+8,Z=150)))
		HitboxChain.Add((BoneOffset=(Y=-8,Z=145)))
		HitboxChain.Add((BoneOffset=(Y=+8,Z=140)))
		HitboxChain.Add((BoneOffset=(Y=+8,Z=135)))
		HitboxChain.Add((BoneOffset=(Y=-8,Z=130)))
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
		HitboxChain.Add((BoneOffset=(Y=+3,Z=150)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=130)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=110)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=105)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=100)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=95)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=90)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=85)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=80)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=75)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=70)))
		HitboxChain.Add((BoneOffset=(Z=5)))
		HitboxChain.Add((BoneOffset=(Z=-5)))
		HitboxChain.Add((BoneOffset=(Z=10)))
		HitboxChain.Add((BoneOffset=(Z=-10)))
		WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
		// modified combo sequences
		MeleeImpactCamShakeScale=0.055f //0.4
		ChainSequence_F=(DIR_Left, DIR_ForwardRight, DIR_ForwardLeft, DIR_ForwardRight, DIR_ForwardLeft)
		ChainSequence_B=(DIR_BackwardLeft, DIR_Left, DIR_Right, DIR_ForwardRight, DIR_Left, DIR_Right, DIR_Left)
		ChainSequence_L=(DIR_Right, DIR_BackwardRight, DIR_ForwardRight, DIR_ForwardLeft, DIR_Right, DIR_Left)
		ChainSequence_R=(DIR_Left, DIR_BackwardLeft, DIR_ForwardLeft, DIR_ForwardRight, DIR_Left, DIR_Right)
	End Object

    // Inventory
	GroupPriority=100
	InventorySize=8
	WeaponSelectTexture=Texture2D'WEP_UI_Scythe_TEX.UI_Scythe_TEX'

	InstantHitDamage(DEFAULT_FIREMODE)=450
	InstantHitMomentum(DEFAULT_FIREMODE)=30000.f
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Slashing_Scythe_Light'

	InstantHitDamage(HEAVY_ATK_FIREMODE)=750
	InstantHitMomentum(HEAVY_ATK_FIREMODE)=30000.f
	InstantHitDamageTypes(HEAVY_ATK_FIREMODE)=class'KFDT_Slashing_Scythe_Heavy'

	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_CrovelBash'
	InstantHitDamage(BASH_FIREMODE)=50

	AssociatedPerkClasses(0)=class'KFPerk_Berserker'

	// Block Sounds
	BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Crovel'
	ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
	
	ParryStrength=4
	ParryDamageMitigationPercent=0.70
	BlockDamageMitigation=0.6
  
    WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Damage2, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
    WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Damage2, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))
}


