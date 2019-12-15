//=============================================================================
// KFWeap_AssaultRifle_CZ805
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AssaultRifle_CZ805 extends KFWeap_RifleBase;

defaultproperties
{
	// Shooting Animations
	FireSightedAnims[0]=Shoot_Iron
	FireSightedAnims[1]=Shoot_Iron2
	FireSightedAnims[2]=Shoot_Iron3

    // FOV
	MeshFOV=70
	MeshIronSightFOV=20
    PlayerIronSightFOV=70

	// Depth of field
	DOF_FG_FocalRadius=150
	DOF_FG_MaxNearBlurSize=3

	// Zooming/Position
	IronSightPosition=(X=20,Y=-0.09,Z=0.09)
	PlayerViewOffset=(X=18.0,Y=9,Z=-3.5)

	PackageKey="CZ805"
	FirstPersonMeshName="WEP_1P_CZ805_MESH.Wep_1stP_CZ805_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_SCAR_ANIM.Wep_1stP_SCAR_Anim"
    PickupMeshName="WEP_3P_CZ805_MESH.Wep_CZ805_Pickup"
	AttachmentArchetypeName="WEP_CZ805_ARCH.Wep_CZ805_3P"
	MuzzleFlashTemplateName="WEP_SCAR_ARCH.Wep_Scar_MuzzleFlash"

	// Ammo
	MagazineCapacity[0]=40
	SpareAmmoCapacity[0]=600
	InitialSpareMags[0]=4
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=130
	minRecoilPitch=113
	maxRecoilYaw=125
	minRecoilYaw=-125
	RecoilRate=0.075
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	IronSightMeshFOVCompensationScale=4.0

	// Inventory
	InventorySize=6
	GroupPriority=100
	WeaponSelectTexture=Texture2D'WEP_UI_CZ805_TEX.UI_WeaponSelect_CZ'

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_CZ805'
	FireInterval(DEFAULT_FIREMODE)=+0.07 // 625 RPM
	Spread(DEFAULT_FIREMODE)=0.007
	InstantHitDamage(DEFAULT_FIREMODE)=57.0 //50
	FireOffset=(X=30,Y=4.5,Z=-5)

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_CZ805'
	FireInterval(ALTFIRE_FIREMODE)=+0.09
	InstantHitDamage(ALTFIRE_FIREMODE)=57.0 //50
	Spread(ALTFIRE_FIREMODE)=0.007

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_SCAR'
	InstantHitDamage(BASH_FIREMODE)=26

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_1P_Loop')
    WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_1P_Single')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Handling_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_1P_EndLoop')
	SingleFireSoundIndex=ALTFIRE_FIREMODE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	AssociatedPerkClasses(0)=class'KFPerk_Commando'

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.5f), (Stat=EWUS_Damage1, Scale=1.5f), (Stat=EWUS_Weight, Add=0)))

}
