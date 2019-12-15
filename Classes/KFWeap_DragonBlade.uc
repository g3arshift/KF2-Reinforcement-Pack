class KFWeap_DragonBlade extends KFWeap_MeleeBase;

//var MaterialInstanceConstant NewSkin1;

//reliable client function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
//{
//	Super.ClientWeaponSet(bOptionalSet, bDoNotActivate);
//
//	if ( Instigator != None && InvManager != None
//		&& WorldInfo.NetMode != NM_DedicatedServer )
//	{		
//		Mesh.SetMaterial(0, NewSkin1);
//		Mesh.SetMaterial(1, NewSkin1);
//	}
//}

//simulated function AttachWeaponTo( SkeletalMeshComponent MeshCpnt, optional Name SocketName )
//{
//	local KFPawn KFP;

//	super.AttachWeaponTo(MeshCpnt, SocketName);
	
//	KFP = KFPawn(Instigator);
	
//	if(KFP!=None && KFP.WeaponAttachment!=None && KFP.WeaponAttachment.WeapMesh!=None)
//	{		
//		KFP.WeaponAttachment.WeapMesh.SetMaterial(0, NewSkin1);
//		KFP.WeaponAttachment.WeapMesh.SetMaterial(1, NewSkin1);
//	}
//}

defaultproperties
{

	//NewSkin1=MaterialInstanceConstant'DragonBlade.Wep_DragonBladeNew_MIC'
	
	// Zooming/Position
	PlayerViewOffset=(X=2,Y=0,Z=0)

	PackageKey="DragonBlade"
	FirstPersonMeshName="'WEP_1P_DragonBlade_MESH.Wep_1stP_DragonBlade_Rig'"
	FirstPersonAnimSetNames(0)="'WEP_1P_DragonBlade_Anim.Wep_1stP_DragonBlade_Anim'"
	PickupMeshName="'WEP_3P_DragonBlade_MESH.Wep_Pickup_DragonBlade'"
	AttachmentArchetypeName="'WEP_DragonBlade_ARCH.Wep_DragonBlade_3P'"

	Begin Object Name=MeleeHelper_0
		MaxHitRange=440    //330 //400
		// Override automatic hitbox creation (advanced)
		HitboxChain.Add((BoneOffset=(X=+5,Z=250)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=230)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=210)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=190)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=170)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=150)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=130)))
		HitboxChain.Add((BoneOffset=(X=-5,Z=110)))
		HitboxChain.Add((BoneOffset=(X=+5,Z=90)))
		HitboxChain.Add((BoneOffset=(Y=+5,Z=280)))
		HitboxChain.Add((BoneOffset=(Y=-5,Z=260)))
		HitboxChain.Add((BoneOffset=(Y=+5,Z=240)))
		HitboxChain.Add((BoneOffset=(Y=-5,Z=220)))
		HitboxChain.Add((BoneOffset=(Y=+5,Z=200)))
		HitboxChain.Add((BoneOffset=(Y=-5,Z=180)))
		HitboxChain.Add((BoneOffset=(Y=+5,Z=160)))
		HitboxChain.Add((BoneOffset=(Y=-5,Z=140)))
		HitboxChain.Add((BoneOffset=(Y=+5,Z=120)))
		HitboxChain.Add((BoneOffset=(Z=20)))
		WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
		MeleeImpactCamShakeScale=0.04f //0.5
		// modified combo sequences
		ChainSequence_F=(DIR_ForwardRight, DIR_ForwardLeft, DIR_ForwardRight, DIR_ForwardLeft)
		ChainSequence_B=(DIR_BackwardLeft, DIR_BackwardRight, DIR_BackwardLeft, DIR_ForwardRight, DIR_Left, DIR_Right, DIR_Left)
		ChainSequence_L=(DIR_Right, DIR_Left, DIR_ForwardRight, DIR_ForwardLeft, DIR_Right, DIR_Left)
		ChainSequence_R=(DIR_Left, DIR_Right, DIR_ForwardLeft, DIR_ForwardRight, DIR_Left, DIR_Right)
	End Object

	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Slashing_DragonBladeHeavy'
	InstantHitMomentum(DEFAULT_FIREMODE)=30000.f
	InstantHitDamage(DEFAULT_FIREMODE)=350  //70

	InstantHitDamageTypes(HEAVY_ATK_FIREMODE)=class'KFDT_Slashing_DragonBladeHeavy'
	InstantHitMomentum(HEAVY_ATK_FIREMODE)=30000.f
	InstantHitDamage(HEAVY_ATK_FIREMODE)=700    //200

	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Piercing_DragonBlade'
	InstantHitDamage(BASH_FIREMODE)=100

	// Inventory
	GroupPriority=110
	InventorySize=7
	WeaponSelectTexture=Texture2D'WEP_UI_DragonBlade_TEX.ui_select_dragonblade'
	AssociatedPerkClasses(0)=class'KFPerk_Berserker'

	// Block Sounds
	BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
	ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'

	ParryDamageMitigationPercent=0.6
	BlockDamageMitigation=0.5
	ParryStrength=7

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.15f), (Stat=EWUS_Damage1, Scale=1.15f), (Stat=EWUS_Damage2, Scale=1.15f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.3f), (Stat=EWUS_Damage1, Scale=1.3f), (Stat=EWUS_Damage2, Scale=1.3f), (Stat=EWUS_Weight, Add=0)))
}


