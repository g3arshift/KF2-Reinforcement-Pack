//=============================================================================
// KFWeap_Revolver_DualRem1858
//=============================================================================
// A set of Remington 1858 revolvers
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFWeap_Revolver_DualPatriot extends KFWeap_Dualbase;

var MaterialInstanceConstant NewSkin1;

reliable client function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
	Super.ClientWeaponSet(bOptionalSet, bDoNotActivate);

	if ( Instigator != None && InvManager != None
		&& WorldInfo.NetMode != NM_DedicatedServer )
	{		
		Mesh.SetMaterial(0, NewSkin1);
		Mesh.SetMaterial(1, NewSkin1);
	}
}

simulated function AttachWeaponTo( SkeletalMeshComponent MeshCpnt, optional Name SocketName )
{
	local KFPawn KFP;

	super.AttachWeaponTo(MeshCpnt, SocketName);
	
	KFP = KFPawn(Instigator);
	
	if(KFP!=None && KFP.WeaponAttachment!=None && KFP.WeaponAttachment.WeapMesh!=None)
	{		
		KFP.WeaponAttachment.WeapMesh.SetMaterial(0, NewSkin1);
		KFP.WeaponAttachment.WeapMesh.SetMaterial(1, NewSkin1);
	}
}

defaultproperties
{
	NewSkin1=MaterialInstanceConstant'WEP_SkinSet01_P01_MAT.precious_remington1858.Precious_Remington_1858_3P_Mint_MIC'

	PackageKey="Patriot"
	FirstPersonMeshName="'WEP_1P_PATRIOT_MESH.1stP_DualPatriot_Rig'"
	FirstPersonAnimSetNames(0)="'WEP_1P_DualRemington1858_Anim.WEP_1P_DualRemington1858_Anim'"
	PickupMeshName="'WEP_3P_PATRIOT_MESH.3P_Patriot_Pickup'"
	AttachmentArchetypeName="'WEP_PATRIOT_ARCH.DualPatriot_3P'"
	MuzzleFlashTemplateName="'WEP_PATRIOT_ARCH.DualPatriot_MuzzleFlash'"

	Begin Object Name=FirstPersonMesh
		// new anim tree with skelcontrol to rotate cylinders
		AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master_Revolver'
	End Object

	FireOffset=(X=17,Y=4.0,Z=-2.25)
	LeftFireOffset=(X=17,Y=-4,Z=-2.25)

	// Zooming/Position
	IronSightPosition=(X=4,Y=0,Z=0)
	PlayerViewOffset=(X=23,Y=0,Z=-1)
	QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)

	bCanThrow=true
	bDropOnDeath=true

	SingleClass=Class'WeaponPack.KFWeap_Revolver_Patriot'
	
	// FOV
	MeshFOV=60
	MeshIronSightFOV=55
    PlayerIronSightFOV=77

	// Depth of field
	DOF_FG_FocalRadius=40
	DOF_FG_MaxNearBlurSize=3.5

	// Ammo
	MagazineCapacity[0]=12
	SpareAmmoCapacity[0]=96
	InitialSpareMags[0]=3
	AmmoPickupScale[0]=2.0
	bCanBeReloaded=true
	bReloadFromMagazine=true


	// Recoil
	maxRecoilPitch=600
	minRecoilPitch=350
	maxRecoilYaw=125
	minRecoilYaw=-125
	RecoilRate=0.08
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=400
	RecoilISMinPitchLimit=65485
	RecoilBlendOutRatio=0.75
	IronSightMeshFOVCompensationScale=1.5

	// DEFAULT_FIREMODE
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Explosive_Patriot'
	FireInterval(DEFAULT_FIREMODE)=+0.11 // about twice as fast as single
	InstantHitDamage(DEFAULT_FIREMODE)=60.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Explosive_Patriot'
	Spread(DEFAULT_FIREMODE)=0.025

	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'

	// ALTFIRE_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Explosive_Patriot'
	FireInterval(ALTFIRE_FIREMODE)=+0.11 // about twice as fast as single
	InstantHitDamage(ALTFIRE_FIREMODE)=60.0
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Explosive_Patriot'
	Spread(ALTFIRE_FIREMODE)=0.015

	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'

	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=40.0
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Rem1858'

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_1858.Play_WEP_SA_1858_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_1858.Play_WEP_SA_1858_Fire_1P')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_1858.Play_WEP_SA_1858_Fire_DryFire'

	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_1858.Play_WEP_SA_1858_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_1858.Play_WEP_SA_1858_Fire_1P')
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_1858.Play_WEP_SA_1858_Fire_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	// Inventory
	InventorySize=4
	GroupPriority=60
	WeaponSelectTexture=Texture2D'WEP_UI_PATRIOT_TEX.UI_DualPatriot_Select'
	bIsBackupWeapon=false
	
	// Custom anims
	IdleFidgetAnims=(Guncheck_v1, Guncheck_v2, Guncheck_v3, Guncheck_v4)

    bHasFireLastAnims=true
    BonesToLockOnEmpty=(RW_Hammer)
    BonesToLockOnEmpty_L=(LW_Hammer)

    // Revolver
	bRevolver=true
	CylinderRotInfo=(Inc=-60.0, Time=0.0875/*about 0.35 in the anim divided by ratescale of 4*/)
	CylinderRotInfo_L=(Inc=-60.0, Time=0.0875/*about 0.35 in the anim divided by ratescale of 4*/)

	// Revolver shell/cap replacement
	UnusedBulletMeshTemplate=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
	UsedBulletMeshTemplate=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_UsedCap'
	BulletFXSocketNames=(RW_Bullet_FX_6, LW_Bullet_FX_6, RW_Bullet_FX_5, LW_Bullet_FX_5, RW_Bullet_FX_4, LW_Bullet_FX_4, RW_Bullet_FX_3, LW_Bullet_FX_3, RW_Bullet_FX_2, LW_Bullet_FX_2, RW_Bullet_FX_1, LW_Bullet_FX_1)

	AssociatedPerkClasses(0)=class'KFPerk_Demolitionist'

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[3]=(Stats=((Stat=EWUS_Damage0, Scale=1.8f), (Stat=EWUS_Damage1, Scale=1.8f), (Stat=EWUS_Weight, Add=0)))

}

