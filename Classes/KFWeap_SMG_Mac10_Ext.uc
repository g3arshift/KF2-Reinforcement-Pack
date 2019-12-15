//=============================================================================
// KFWeap_SMG_Mac10
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFWeap_SMG_Mac10_Ext extends KFWeap_SMGBase;

static simulated event EFilterTypeUI GetAltTraderFilter()
{
	return FT_Flame;
}

defaultproperties
{
	// Inventory
	InventorySize=4
	GroupPriority=60
	WeaponSelectTexture=Texture2D'WEP_UI_MAC10_TEX.UI_WeaponSelect_Mac10'


	// Shooting Animations
	FireSightedAnims[0]=Shoot_Iron
	FireSightedAnims[1]=Shoot_Iron2
	FireSightedAnims[2]=Shoot_Iron3

	// FOV
	MeshFOV=75
	MeshIronSightFOV=60
	PlayerIronSightFOV=75

	// Zooming/Position
	IronSightPosition=(X=15.f,Y=0,Z=0)
	PlayerViewOffset=(X=18.f,Y=8,Z=-5.0)  //(X=17.f,Y=8,Z=-3.0)

	// Content
	PackageKey="MAC10"
	FirstPersonMeshName="WEP_1P_MAC10_MESH.Wep_1stP_MAC10_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_MAC10_ANIM.WEP_1P_MAC10_ANIM"
	PickupMeshName="WEP_3P_MAC10_MESH.Wep_3rdP_MAC10_Pickup"
	AttachmentArchetypeName="WEP_MAC10_ARCH.Wep_MAC10_3P"
	MuzzleFlashTemplateName="WEP_MAC10_ARCH.Wep_MAC10_MuzzleFlash"

	// Ammo
	MagazineCapacity[0]=32   //40
	SpareAmmoCapacity[0]=320 //360
	InitialSpareMags[0]=4
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=60
	minRecoilPitch=40
	maxRecoilYaw=50
	minRecoilYaw=-50
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
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_Mac10'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Fire_Mac10'
	FireInterval(DEFAULT_FIREMODE)=+.067 // 900 RPM
	Spread(DEFAULT_FIREMODE)=0.01
	InstantHitDamage(DEFAULT_FIREMODE)=30 //22 //25 //30
	FireOffset=(X=30,Y=4.5,Z=-5)

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_Mac10'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Fire_Mac10'
	FireInterval(ALTFIRE_FIREMODE)=+.067 // 1000 RPM
	InstantHitDamage(ALTFIRE_FIREMODE)=30  //22 //25 //30
	Spread(ALTFIRE_FIREMODE)=0.01

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Mac10'
	InstantHitDamage(BASH_FIREMODE)=24.0

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'WEP_MAC10_ARCH.Wep_MAC10_MuzzleFlash'

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

	DualClass=class'KFWeap_DualMAC10'

	bCanThrow=true
	bDropOnDeath=true
	bIsBackupWeapon=false

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	AssociatedPerkClasses(0)=class'KFPerk_Firebug'
	AssociatedPerkClasses(1) = class'KFPerk_SWAT'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.15f), (Stat=EWUS_Damage1, Scale=1.15f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.3f), (Stat=EWUS_Damage1, Scale=1.3f), (Stat=EWUS_Weight, Add=1)))
}
