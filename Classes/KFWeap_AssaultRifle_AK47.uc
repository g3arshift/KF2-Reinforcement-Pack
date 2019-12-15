//=============================================================================
// KFWeap_AssaultRifle_AK47
//=============================================================================
// An AK47 Assault Rifle
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AssaultRifle_AK47 extends KFWeap_RifleBase;

defaultproperties
{
	// FOV
	MeshFOV=75
	MeshIronSightFOV=40
	PlayerIronSightFOV=70

	// Depth of field
	DOF_FG_FocalRadius=50
	DOF_FG_SharpRadius=0
	DOF_FG_MinBlurSize=0
	DOF_FG_MaxNearBlurSize=3
	DOF_FG_ExpFalloff=1

	// Zooming/Position
	IronSightPosition=(X=13,Y=0,Z=0.05)
	PlayerViewOffset=(X=20.0,Y=8,Z=-1.0)

	// Content
	PackageKey="AK47"
	FirstPersonMeshName="WEP_AK47_MESH.Wep_1stP_AK47_Rig"
	FirstPersonAnimSetNames(0)="wep_1p_mkb42_anim.wep_1p_mkb42_anim"
	PickupMeshName="WEP_AK47_MESH.Wep_3rdP_AK47_Pickup"
	AttachmentArchetypeName="WEP_AK47_ARCH.Wep_AK47_3P"
	MuzzleFlashTemplateName="WEP_AK12_ARCH.Wep_AK12_MuzzleFlash" //@TODO: Replace me

	// Ammo
	MagazineCapacity[0]=30
	SpareAmmoCapacity[0]=300 //240
	InitialSpareMags[0]=3
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=225  //200  //300 //200
	minRecoilPitch=119 //150   //225 //170
	maxRecoilYaw=227  //175    //262 //274
	minRecoilYaw=-224  //-175    //-262  //-274
	RecoilRate=0.095 //0.085
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	IronSightMeshFOVCompensationScale=1.9 //1.3

	// Inventory / Grouping
	InventorySize=6
	GroupPriority=80
	WeaponSelectTexture=Texture2D'WEP_AK47_TEX.UI_AK47_TEX'

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	FireInterval(DEFAULT_FIREMODE)=+0.1 // 500 RPM
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_AK47'
	Spread(DEFAULT_FIREMODE)=0.0085
	InstantHitDamage(DEFAULT_FIREMODE)=56.0 //60
	FireOffset=(X=32,Y=4.0,Z=-5)

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	FireInterval(ALTFIRE_FIREMODE)=+0.1 // 1000 RPM
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_AK47'
	InstantHitDamage(ALTFIRE_FIREMODE)=56.0 //60
	Spread(ALTFIRE_FIREMODE)=0.0085

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_MKB42'
	InstantHitDamage(BASH_FIREMODE)=26

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_S')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Single_S')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire' //@TODO: Replace me
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire' //@TODO: Replace me


	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_End_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_End_S') //@TODO: Replace me
	SingleFireSoundIndex=ALTFIRE_FIREMODE

	FireLoopEndLastAnim=ShootLoop_End_Last
	FireLoopEndLastSightedAnim=ShootLoop_Iron_End_Last
	bHasFireLastAnims=true

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	AssociatedPerkClasses(0)=class'KFPerk_Commando'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.25f), (Stat=EWUS_Damage1, Scale=1.25f), (Stat=EWUS_Weight, Add=0)))
}



