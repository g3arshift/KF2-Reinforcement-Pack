//=============================================================================
// KFWeap_AssaultRifle_SCAR
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_SMG_SCARPDW extends KFWeap_SMGBase;

defaultproperties
{
	// Shooting Animations
	FireSightedAnims[0]=Shoot_Iron
	FireSightedAnims[1]=Shoot_Iron2
	FireSightedAnims[2]=Shoot_Iron3

    // FOV
	MeshFOV=86
	MeshIronSightFOV=45
	PlayerIronSightFOV=60

	// Depth of field
	DOF_FG_FocalRadius=150
	DOF_FG_MaxNearBlurSize=3

	// Zooming/Position
	IronSightPosition=(X=12,Y=0,Z=-3.6)
	PlayerViewOffset=(X=18.0,Y=9,Z=-3.5)

	// Content
	PackageKey="SCAR_PDW"
	FirstPersonMeshName="WEP_SCAR_PDW_MESH.Wep_1stP_PDW_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_SCAR_ANIM.Wep_1stP_SCAR_Anim"
	PickupMeshName="WEP_SCAR_PDW_MESH.Wep_PDW_Pickup"
	AttachmentArchetypeName="WEP_SCAR_PDW_ARCH.Wep_SCARPDW_3P"
	MuzzleFlashTemplateName="WEP_SCAR_ARCH.Wep_Scar_MuzzleFlash"

	// Ammo
	MagazineCapacity[0]=35
	SpareAmmoCapacity[0]=385
	InitialSpareMags[0]=4
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=120
	minRecoilPitch=110
	maxRecoilYaw=100
	minRecoilYaw=-100
	RecoilRate=0.045
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=100
	RecoilISMinYawLimit=65435
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	IronSightMeshFOVCompensationScale=2.5
	WalkingRecoilModifier=1.1
	JoggingRecoilModifier=1.2

	// Inventory
	InventorySize=6
	GroupPriority=100
	WeaponSelectTexture=Texture2D'WEP_SCAR_PDW_TEX.UI_PDW_TEX'

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_SCARPDW'
	FireInterval(DEFAULT_FIREMODE)=+0.08 // 625 RPM
	Spread(DEFAULT_FIREMODE)=0.015
	InstantHitDamage(DEFAULT_FIREMODE)=48.0 //50 //55
	FireOffset=(X=30,Y=4.5,Z=-5)

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_SCARPDW'
	FireInterval(ALTFIRE_FIREMODE)=+0.08
	InstantHitDamage(ALTFIRE_FIREMODE)=48.0 //50 //55
	Spread(ALTFIRE_FIREMODE)=0.015

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_SCAR'
	InstantHitDamage(BASH_FIREMODE)=26

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Fire_Loop_M', FirstPersonCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Fire_Loop_S')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Single_Fire_M', FirstPersonCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Single_Fire_S')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Handling_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Fire_Loop_End_M', FirstPersonCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Fire_Loop_End_S')
	SingleFireSoundIndex=ALTFIRE_FIREMODE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	AssociatedPerkClasses(0)=class'KFPerk_SWAT'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))
}
