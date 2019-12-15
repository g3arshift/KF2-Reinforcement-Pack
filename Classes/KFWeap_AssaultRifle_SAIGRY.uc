//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 8/8/2013
//=============================================================================

class KFWeap_AssaultRifle_SAIGRY extends KFWeap_RifleBase;

defaultproperties
{
	// Shooting Animations
	FireSightedAnims[0]=Shoot_Iron
	FireSightedAnims[1]=Shoot_Iron2
	FireSightedAnims[2]=Shoot_Iron3

    // FOV
	MeshIronSightFOV=52
    PlayerIronSightFOV=70

	// Depth of field
	DOF_FG_FocalRadius=75
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position
	PlayerViewOffset=(X=9.0,Y=10,Z=-4)
	IronSightPosition=(X=1,Y=-0.1,Z=-0.85)

	// Content
	PackageKey="SAI_GRY"
	FirstPersonMeshName="WEP_SAI_GRY_MESH.Wep_1stP_SAI_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_AR15_9mm_ANIM.Wep_1stP_AR15_9mm_Anim"
	PickupMeshName="WEP_SAI_GRY_MESH.Wep_SAI_Pickup"
	AttachmentArchetypeName="WEP_SAI_GRY_ARCH.Wep_SAI_3P"
	MuzzleFlashTemplateName="WEP_AR15_9mm_ARCH.Wep_AR15_9MM_MuzzleFlash"

   	
	// Ammo
	MagazineCapacity[0]=40
	SpareAmmoCapacity[0]=320
	InitialSpareMags[0]=5
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=200
	minRecoilPitch=120
	maxRecoilYaw=150
	minRecoilYaw=-150
	RecoilRate=0.085
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=195
	RecoilISMinPitchLimit=65460
	RecoilViewRotationScale=0.25
	IronSightMeshFOVCompensationScale=1.5

	// Inventory / Grouping
	InventorySize=6
	GroupPriority=50
	WeaponSelectTexture=Texture2D'WEP_SAI_GRY_TEX.UI_SAIGRY_TEX'

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_SAIGRY'
	FireInterval(DEFAULT_FIREMODE)=+0.085
	InstantHitDamage(DEFAULT_FIREMODE)=34.0 //20
	Spread(DEFAULT_FIREMODE)=0.015
	FireOffset=(X=30,Y=4.5,Z=-4)
	
	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletBurst'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponBurstFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_SAIGRY'
	FireInterval(ALTFIRE_FIREMODE)=+0.15 // 500 RPM
	InstantHitDamage(ALTFIRE_FIREMODE)=34.0 //20
	Spread(ALTFIRE_FIREMODE)=0.015
	BurstAmount=3

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_SAIGRY'
	InstantHitDamage(BASH_FIREMODE)=30

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Fire_1P')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Fire_1P')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	AssociatedPerkClasses(0)=class'KFPerk_Commando'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
    WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.5f), (Stat=EWUS_Damage1, Scale=1.5f), (Stat=EWUS_Weight, Add=0)))

