//=============================================================================
// KFWeap_AssaultRifle_AK12
//=============================================================================
// An AK12 Assault Rifle
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_AssaultRifle_AKA extends KFWeap_RifleBase;

defaultproperties
{
	// FOV
	MeshFOV=75
	MeshIronSightFOV=33
	PlayerIronSightFOV=60

	// Depth of field
	DOF_FG_FocalRadius=50
	DOF_FG_SharpRadius=0
	DOF_FG_MinBlurSize=0
	DOF_FG_MaxNearBlurSize=3
	DOF_FG_ExpFalloff=1

	// Zooming/Position
	PlayerViewOffset=(X=2.0,Y=8,Z=0)
	IronSightPosition=(X=6,Y=0.1,Z=0.78)

	// Content
	PackageKey="AKA"
	FirstPersonMeshName="WEP_AKALPHA_MESH.Wep_1stP_AKA_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_AK12_ANIM.Wep_1st_AK12_Anim"
	PickupMeshName="WEP_AKALPHA_MESH.Wep_AKA_Pickup"
	AttachmentArchetypeName="WEP_AKA_ARCH.Wep_AKA_3P"
	MuzzleFlashTemplateName="WEP_AK12_ARCH.Wep_AK12_MuzzleFlash"

	// Ammo
	MagazineCapacity[0]=30
	SpareAmmoCapacity[0]=330
	InitialSpareMags[0]=3
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=195
	minRecoilPitch=135
	maxRecoilYaw=175
	minRecoilYaw=-125
	RecoilRate=0.085
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	IronSightMeshFOVCompensationScale=2.7

	// Inventory / Grouping
	InventorySize=6
	GroupPriority=80
	WeaponSelectTexture=Texture2D'WEP_AKALPHA_TEX.UI_AKA_TEX'

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	FireInterval(DEFAULT_FIREMODE)=+0.095 // 600 RPM
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_AKA'
	Spread(DEFAULT_FIREMODE)=0.0089
	InstantHitDamage(DEFAULT_FIREMODE)=45.0
	FireOffset=(X=32,Y=4.0,Z=-5)

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	FireInterval(ALTFIRE_FIREMODE)=+0.095 // 1000 RPM
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_AKA'
	InstantHitDamage(ALTFIRE_FIREMODE)=45.0
	Spread(ALTFIRE_FIREMODE)=0.0085
	//BurstAmount=3
	//BurstFire2RdAnim=Shoot_Burst2
	//BurstFire3RdAnim=Shoot_Burst
	//BurstFire2RdSightedAnim=Shoot_Burst2_Iron
	//BurstFire3RdSightedAnim=Shoot_Burst_Iron
	//WeaponFire2RdSnd=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_2RdBurst_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_2RdBurst_S')
	//WeaponFire3RdSnd=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Burst_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Burst_S')


	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_AKA'
	InstantHitDamage(BASH_FIREMODE)=30

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_S')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Single_S')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'


	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_End_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_End_S')
	SingleFireSoundIndex=ALTFIRE_FIREMODE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	AssociatedPerkClasses(0)=class'KFPerk_Commando'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))

}



