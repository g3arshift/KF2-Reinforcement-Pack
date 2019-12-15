//=============================================================================
// KFWeap_SMG_MP5RAS
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//  - Brooks Butler
//=============================================================================

class KFWeap_SMG_CZSkorpion extends KFWeap_SMGBase;

defaultproperties
{
	// Inventory
	InventorySize=5
	GroupPriority=75
	WeaponSelectTexture=Texture2D'WEP_CZSkorpion_TEX.UI_CZSkorpion_TEX'

	// FOV
	MeshFOV=86
	MeshIronSightFOV=50
	PlayerIronSightFOV=40

	// Zooming/Position
	IronSightPosition=(X=1.f,Y=-0.3,Z=-1.0)
	PlayerViewOffset=(X=12.f,Y=8,Z=-4.0)

	// Content
	PackageKey="CZSkorpion"
	FirstPersonMeshName="WEP_CZSkorpion_MESH.Wep_1stP_CZSkorpion_Rig"
	FirstPersonAnimSetNames(0)="wep_1p_mp5ras_anim.wep_1p_mp5ras_anim"
	PickupMeshName="WEP_CZSkorpion_MESH.Wep_CZSkor_Pickup"
	AttachmentArchetypeName="WEP_CZSkorpion_ARCH.Wep_CZSkor_3P"
	MuzzleFlashTemplateName="wep_mp5ras_arch.Wep_MP5RAS_MuzzleFlash"

	// Ammo
	MagazineCapacity[0]=30
	SpareAmmoCapacity[0]=360 //360
	InitialSpareMags[0]=4
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=80
	minRecoilPitch=70
	maxRecoilYaw=80
	minRecoilYaw=-80
	RecoilRate=0.06
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=550 //900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	IronSightMeshFOVCompensationScale=1.6
	WalkingRecoilModifier=1.1
	JoggingRecoilModifier=1.2

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_CZSkorpion'
	FireInterval(DEFAULT_FIREMODE)=+.08 // 900 RPM
	Spread(DEFAULT_FIREMODE)=0.01
	InstantHitDamage(DEFAULT_FIREMODE)=38 //22
	FireOffset=(X=30,Y=4.5,Z=-5)

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletBurst'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponBurstFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_CZSkorpion'
	FireInterval(ALTFIRE_FIREMODE)=+.08 // 900 RPM
	InstantHitDamage(ALTFIRE_FIREMODE)=38  //22
	Spread(ALTFIRE_FIREMODE)=0.01
	BurstAmount=3

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_CZSkorpion'
	InstantHitDamage(BASH_FIREMODE)=24.0
	
	//@todo: add akevents when we have them
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_3P_Loop', FirstPersonCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_1P_Loop')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_1P_Single')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_3P_EndLoop', FirstPersonCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_1P_EndLoop')
	SingleFireSoundIndex=ALTFIRE_FIREMODE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	AssociatedPerkClasses(0)=class'KFPerk_Swat'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.15f), (Stat=EWUS_Damage1, Scale=1.15f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.35f), (Stat=EWUS_Damage1, Scale=1.35f), (Stat=EWUS_Weight, Add=0)))
}
