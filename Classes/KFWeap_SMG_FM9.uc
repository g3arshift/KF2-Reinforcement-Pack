//=============================================================================
// KFWeap_SMG_MP7
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//  - Brooks Butler
//=============================================================================

class KFWeap_SMG_FM9 extends KFWeap_SMGBase;

defaultproperties
{
	// Inventory
	InventorySize=5
	GroupPriority=80
	WeaponSelectTexture=Texture2D'WEP_MAGPUL_TEX.UI_MAGPUL_TEX'

	// FOV
	MeshFOV=81
	MeshIronSightFOV=30
	PlayerIronSightFOV=70

	// Zooming/Position
	IronSightPosition=(X=-10,Y=0,Z=-0.6)
	PlayerViewOffset=(X=16.5f,Y=10.25f,Z=-4.0f)

	// Content
	PackageKey="MAGPUL"
	FirstPersonMeshName="WEP_MAGPUL_MESH.Wep_1stP_FM9_Rig"
	FirstPersonAnimSetNames(0)="wep_1p_mp7_anim.wep_1p_mp7_anim"
	PickupMeshName="WEP_MAGPUL_MESH.Wep_FM9_Pickup"
	AttachmentArchetypeName="WEP_MAGPUL_ARCH.Wep_MAGPUL_3P"
	MuzzleFlashTemplateName="wep_mp5ras_arch.Wep_MP5RAS_MuzzleFlash"

	// Ammo
	MagazineCapacity[0]=40
	SpareAmmoCapacity[0]=440
	InitialSpareMags[0]=6
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=50
	minRecoilPitch=40
	maxRecoilYaw=80
	minRecoilYaw=-80
	RecoilRate=0.06
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	IronSightMeshFOVCompensationScale=1.5
	WalkingRecoilModifier=1.1
	JoggingRecoilModifier=1.2

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_FM9'
	FireInterval(DEFAULT_FIREMODE)=+.05 // 950 RPM
	Spread(DEFAULT_FIREMODE)=0.015
	InstantHitDamage(DEFAULT_FIREMODE)=30 //20
	FireOffset=(X=30,Y=4.5,Z=-5)

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletBurst'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponBurstFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_FM9'
	FireInterval(ALTFIRE_FIREMODE)=+.05 // 950 RPM
	InstantHitDamage(ALTFIRE_FIREMODE)=30 //20
	Spread(ALTFIRE_FIREMODE)=0.01
	BurstAmount=3

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_FM9'
	InstantHitDamage(BASH_FIREMODE)=24

	//@todo: add akevents when we have them
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Fire_Single_S')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Fire_Single_S')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	//bLoopingFireSnd(DEFAULT_FIREMODE)=true
	//WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_3P_EndLoop', FirstPersonCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_1P_EndLoop')
	SingleFireSoundIndex=ALTFIRE_FIREMODE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	AssociatedPerkClasses(0)=class'KFPerk_Swat'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.8f), (Stat=EWUS_Damage1, Scale=1.8f), (Stat=EWUS_Weight, Add=0)))

}
