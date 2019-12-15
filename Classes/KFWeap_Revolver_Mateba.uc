//=============================================================================
// KFWeap_Revolver_SW500
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFWeap_Revolver_Mateba extends KFWeap_PistolBase;

defaultproperties
{
    // FOV
	MeshFOV=60
	MeshIronSightFOV=28
    PlayerIronSightFOV=77

	// Depth of field
	DOF_FG_FocalRadius=40
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position
	PlayerViewOffset=(X=22,Y=12,Z=-6)
	IronSightPosition=(X=2,Y=0,Z=-3.4)

	// Content
	PackageKey="Mateba"
	FirstPersonMeshName="WEP_MATEBA_MESH.Wep_1stP_MATEBA_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_SW_500_ANIM.WEP_1stP_SW_500_Anim"
	PickupMeshName="WEP_MATEBA_MESH.Wep_MATEBA_Pickup"
	AttachmentArchetypeName="WEP_MATEBA_ARCH.Wep_MATEBA_3P"
	MuzzleFlashTemplateName="WEP_SW_500_ARCH.Wep_SW_500_MuzzleFlash"

	Begin Object Name=FirstPersonMesh
		// new anim tree with skelcontrol to rotate cylinders
		AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master_Revolver'
	End Object

	// Ammo
	MagazineCapacity[0]=6
	SpareAmmoCapacity[0]=120
	InitialSpareMags[0]=4
	AmmoPickupScale[0]=2.0
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=750
	minRecoilPitch=650
	maxRecoilYaw=150
	minRecoilYaw=-150
	RecoilRate=0.1
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65485
	IronSightMeshFOVCompensationScale=1.4

	// DEFAULT_FIREMODE
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_Mateba'
	FireInterval(DEFAULT_FIREMODE)=+0.26
	InstantHitDamage(DEFAULT_FIREMODE)=180.0 //150
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_Mateba'
	Spread(DEFAULT_FIREMODE)=0.015
	PenetrationPower(DEFAULT_FIREMODE)=3.0
	FireOffset=(X=20,Y=4.0,Z=-3)

	// ALT_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None


	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=25
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Mateba'

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Flare_Gun.Play_WEP_Flare_Gun_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_Flare_Gun.Play_WEP_Flare_Gun_Fire_1P')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	// Inventory
	InventorySize=3
	GroupPriority=50
	bCanThrow=true
	bDropOnDeath=true
	WeaponSelectTexture=Texture2D'WEP_MATEBA_TEX.UI_MATEBA_TEX'
	bIsBackupWeapon=false
	AssociatedPerkClasses(0)=class'KFPerk_Gunslinger'
	AssociatedPerkClasses(1)=class'KFPerk_Sharpshooter'

	DualClass=class'KFWeap_Revolver_DualMateba'

	// Custom animations
	FireSightedAnims=(Shoot_Iron, Shoot_Iron2, Shoot_Iron3)
	IdleFidgetAnims=(Guncheck_v1, Guncheck_v2, Guncheck_v3, Guncheck_v4, Guncheck_v5)

	bHasFireLastAnims=true
	BonesToLockOnEmpty=(RW_Hammer)

	// Revolver
	bRevolver=true
	CylinderRotInfo=(Inc=-72.0, Time=0.0875/*about 0.35 in the anim divided by ratescale of 4*/)

	// Revolver shell/cap replacement
	UnusedBulletMeshTemplate=SkeletalMesh'WEP_MATEBA_MESH.Wep_1stP_MATEBA_Bullet'
	UsedBulletMeshTemplate=SkeletalMesh'WEP_MATEBA_MESH.Wep_1stP_MATEBA_EmptyShell'
	BulletFXSocketNames=(RW_Bullet_FX_5, RW_Bullet_FX_4, RW_Bullet_FX_3, RW_Bullet_FX_2, RW_Bullet_FX_1)

	Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp0
		SkeletalMesh=SkeletalMesh'WEP_MATEBA_MESH.Wep_1stP_MATEBA_Bullet'
		CollideActors=false
		BlockActors=false
		BlockZeroExtent=false
		BlockNonZeroExtent=false
		BlockRigidBody=false
		bAcceptsStaticDecals=false
		bAcceptsDecals=false
		CastShadow=false
		bUseAsOccluder=false
		DepthPriorityGroup=SDPG_Foreground // First person only
	End Object
	Components.Add(BulletMeshComp0)
	BulletMeshComponents.Add(BulletMeshComp0)

	Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp1
		SkeletalMesh=SkeletalMesh'WEP_MATEBA_MESH.Wep_1stP_MATEBA_Bullet'
		CollideActors=false
		BlockActors=false
		BlockZeroExtent=false
		BlockNonZeroExtent=false
		BlockRigidBody=false
		bAcceptsStaticDecals=false
		bAcceptsDecals=false
		CastShadow=false
		bUseAsOccluder=false
		DepthPriorityGroup=SDPG_Foreground // First person only
	End Object
	Components.Add(BulletMeshComp1)
	BulletMeshComponents.Add(BulletMeshComp1)

	Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp2
		SkeletalMesh=SkeletalMesh'WEP_MATEBA_MESH.Wep_1stP_MATEBA_Bullet'
		CollideActors=false
		BlockActors=false
		BlockZeroExtent=false
		BlockNonZeroExtent=false
		BlockRigidBody=false
		bAcceptsStaticDecals=false
		bAcceptsDecals=false
		CastShadow=false
		bUseAsOccluder=false
		DepthPriorityGroup=SDPG_Foreground // First person only
	End Object
	Components.Add(BulletMeshComp2)
	BulletMeshComponents.Add(BulletMeshComp2)

	Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp3
		SkeletalMesh=SkeletalMesh'WEP_MATEBA_MESH.Wep_1stP_MATEBA_Bullet'
		CollideActors=false
		BlockActors=false
		BlockZeroExtent=false
		BlockNonZeroExtent=false
		BlockRigidBody=false
		bAcceptsStaticDecals=false
		bAcceptsDecals=false
		CastShadow=false
		bUseAsOccluder=false
		DepthPriorityGroup=SDPG_Foreground // First person only
	End Object
	Components.Add(BulletMeshComp3)
	BulletMeshComponents.Add(BulletMeshComp3)

	Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp4
		SkeletalMesh=SkeletalMesh'WEP_MATEBA_MESH.Wep_1stP_MATEBA_Bullet'
		CollideActors=false
		BlockActors=false
		BlockZeroExtent=false
		BlockNonZeroExtent=false
		BlockRigidBody=false
		bAcceptsStaticDecals=false
		bAcceptsDecals=false
		CastShadow=false
		bUseAsOccluder=false
		DepthPriorityGroup=SDPG_Foreground // First person only
	End Object
	Components.Add(BulletMeshComp4)
	BulletMeshComponents.Add(BulletMeshComp4)

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
}