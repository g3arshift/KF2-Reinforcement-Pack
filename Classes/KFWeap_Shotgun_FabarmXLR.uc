//=============================================================================
// KFWeap_Shotgun_M4
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 3/19/2014
//=============================================================================

class KFWeap_Shotgun_FabarmXLR extends KFWeap_ShotgunBase;

defaultproperties
{
	// Ineventory
	InventorySize=6 //8
	GroupPriority=90
	WeaponSelectTexture=Texture2D'WEP_FabarmXLR_TEX.UI_XLR5_TEX'

    // FOV
 	MeshFOV=75
	MeshIronSightFOV=52
    PlayerIronSightFOV=70

	// Depth of field
	DOF_FG_FocalRadius=25
	DOF_FG_MaxNearBlurSize=3

	// Zooming/Position
	PlayerViewOffset=(X=15.0,Y=8.5,Z=-3.5)
	IronSightPosition=(X=5,Y=0,Z=-0.5)

	// Content
	PackageKey="FabarmXLR"
	FirstPersonMeshName="WEP_FabarmXLR_MESH.Wep_1stP_FabarmXLR_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_M4Shotgun_ANIM.Wep_1st_M4Shotgun_ANIM"
	PickupMeshName="WEP_FabarmXLR_MESH.Wep_FabarmXLR_Pickup"
	AttachmentArchetypeName="WEP_FabarmXLR_ARCH.Wep_FabarmXLR_3P"
	MuzzleFlashTemplateName="WEP_M4Shotgun_ARCH.Wep_M4Shotgun_MuzzleFlash"

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_Pellet'
	InstantHitDamage(DEFAULT_FIREMODE)=32.0 //28
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_FabarmXLR'
	PenetrationPower(DEFAULT_FIREMODE)=1.8
	FireInterval(DEFAULT_FIREMODE)=0.3 // 265 RPM
	Spread(DEFAULT_FIREMODE)=0.095
	FireOffset=(X=30,Y=5,Z=-4)
	// Shotgun
	NumPellets(DEFAULT_FIREMODE)=8 //7

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_FabarmXLR'
	InstantHitDamage(BASH_FIREMODE)=28

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Fire_1P')
    WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Fire_1P')

	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	// Ammo
	MagazineCapacity[0]=7
	SpareAmmoCapacity[0]=105
	InitialSpareMags[0]=4
	bCanBeReloaded=true
	bReloadFromMagazine=false

	// Recoil
	maxRecoilPitch=775
	minRecoilPitch=600
	maxRecoilYaw=375
	minRecoilYaw=-375
	RecoilRate=0.065
	RecoilBlendOutRatio=0.25
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65485
	RecoilViewRotationScale=0.7
	FallingRecoilModifier=1.5
	HippedRecoilModifier=1.3 //1.5

	AssociatedPerkClasses(0)=class'KFPerk_Support'

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.05f), (Stat=EWUS_Damage1, Scale=1.05f), (Stat=EWUS_Weight, Add=0)))
}