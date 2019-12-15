//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC, Jeff Robinson
// Copyright (C) 2017 HickDead
//=============================================================================

class KFWeap_DualMAC10 extends KFWeap_DualBase;


simulated state WeaponFiring
{
	simulated function FireAmmunition()
	{
		bFireFromRightWeapon = !bFireFromRightWeapon;
		Super.FireAmmunition();
	}
}

defaultproperties
{
	// Inventory
	InventorySize=8
	GroupPriority=70
	bCanThrow=true
	bDropOnDeath=true
	WeaponSelectTexture=Texture2D'WEP_UI_Dual_M10_TEX.UI_WeaponSelect_DualMAC10'
	bIsBackupWeapon=false

	PackageKey="Dual_Mac10"
	FirstPersonMeshName="'WEP_1P_Dual_M10_MESH.Wep_1stP_Dual_MAC10_Rig'"
	FirstPersonAnimSetNames(0)="'WEP_1P_Dual_M1911_ANIM.Wep_1stP_Dual_M1911_Anim'"
	PickupMeshName="'WEP_3P_MAC10_MESH.Wep_3rdP_MAC10_Pickup'"
	AttachmentArchetypeName="'WEP_Dual_M10_ARCH.Wep_Dual_MAC10_3P'"
	MuzzleFlashTemplateName="'WEP_MAC10_ARCH.Wep_MAC10_MuzzleFlash'"

	FireOffset=(X=17,Y=4.0,Z=-2.25)
	LeftFireOffset=(X=17,Y=-4,Z=-2.25)

	SingleClass=class'KFWeap_SMG_Mac10_Ext'

	// Zooming/Position
	IronSightPosition=(X=15,Y=0,Z=-2.5)
	PlayerViewOffset=(X=16,Y=0,Z=-5)
	QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)

	// FOV
	MeshFOV=75
	MeshIronSightFOV=60
	PlayerIronSightFOV=77

	// Depth of field
	DOF_FG_FocalRadius=40
	DOF_FG_MaxNearBlurSize=3.5

	// Ammo
	MagazineCapacity[0]=64
	SpareAmmoCapacity[0]=640
	InitialSpareMags[0]=4
	AmmoPickupScale[0]=1.0
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
	FireInterval(DEFAULT_FIREMODE)=+.0335	// twice as fast as single
	Spread(DEFAULT_FIREMODE)=0.025
	InstantHitDamage(DEFAULT_FIREMODE)=30.0
	
	// ALTFIRE_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_Mac10'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Fire_Mac10'
	FireInterval(ALTFIRE_FIREMODE)=+.0335 // 1000 RPM
	InstantHitDamage(ALTFIRE_FIREMODE)=30  //22 //25 //30
	Spread(ALTFIRE_FIREMODE)=0.025

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Mac10'
	InstantHitDamage(BASH_FIREMODE)=24.0

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_3P_Single')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'

	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_1P_Single')
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	AssociatedPerkClasses(0)=class'KFPerk_Firebug'
	AssociatedPerkClasses(1) = class'KFPerk_SWAT'

	BonesToLockOnEmpty=(RW_Bolt, RW_Bullets1)
	BonesToLockOnEmpty_L=(LW_Bolt, LW_Bullets1)

	bHasFireLastAnims=true

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.15f), (Stat=EWUS_Damage1, Scale=1.15f), (Stat=EWUS_Weight, Add=0)))
    WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.3f), (Stat=EWUS_Damage1, Scale=1.3f), (Stat=EWUS_Weight, Add=0)))
}