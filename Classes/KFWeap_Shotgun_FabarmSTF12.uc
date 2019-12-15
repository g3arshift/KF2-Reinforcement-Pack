//=============================================================================
// KFWeap_Shotgun_MB500
//=============================================================================
// A Mossberg 500 Shotgun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeap_Shotgun_FabarmSTF12 extends KFWeap_ShotgunBase;

defaultproperties
{
	// Inventory
	InventorySize=5
	GroupPriority=40
	WeaponSelectTexture=Texture2D'WEP_Fabarm_TEX.UI_FABARM_TEX'

    // FOV
	MeshIronSightFOV=52
    PlayerIronSightFOV=70

	// Depth of field
	DOF_FG_FocalRadius=25
	DOF_FG_MaxNearBlurSize=3

	// Zooming/Position
	PlayerViewOffset=(X=8.0,Y=7.6,Z=-3.0)
	IronSightPosition=(X=4.0,Y=0,Z=-3.2)

	// Content
	PackageKey="Fabarm"
	FirstPersonMeshName="WEP_Fabarm_MESH.Wep_1stP_Fabarm_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_MB500_ANIM.Wep_1st_MB500_Anim_New"
	PickupMeshName="WEP_Fabarm_MESH.Wep_Fabarm_Pickup"
	AttachmentArchetypeName="WEP_FABARM_ARCH.Wep_FABARM_3P"
	MuzzleFlashTemplateName="WEP_MB500_ARCH.Wep_MB500_MuzzleFlash"

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)="ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle"
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_Pellet'
	InstantHitDamage(DEFAULT_FIREMODE)=28.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_Fabarm'
	PenetrationPower(DEFAULT_FIREMODE)=2.0
	FireInterval(DEFAULT_FIREMODE)=0.48 // 78 RPM
	Spread(DEFAULT_FIREMODE)=0.16
	FireOffset=(X=30,Y=3,Z=-3)
	// Shotgun
	NumPellets(DEFAULT_FIREMODE)=10

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Fabarm'
	InstantHitDamage(BASH_FIREMODE)=25

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_M', FirstPersonCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_S')
    WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_M', FirstPersonCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_S')

    // using M4 dry fire sound. this is intentional.
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	// Ammo
	MagazineCapacity[0]=8
	SpareAmmoCapacity[0]=96
	InitialSpareMags[0]=3
	bCanBeReloaded=true
	bReloadFromMagazine=false

	// Recoil
	maxRecoilPitch=850
	minRecoilPitch=651
	maxRecoilYaw=500
	minRecoilYaw=-500
	RecoilRate=0.085
	RecoilBlendOutRatio=0.35
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=1500
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65485
	RecoilViewRotationScale=0.8
	FallingRecoilModifier=1.5
	HippedRecoilModifier=1.25

	AssociatedPerkClasses(0)=class'KFPerk_Support'

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'

	// Weapon Upgrade stat boost
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.15f), (Stat=EWUS_Damage1, Scale=1.15f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.5f), (Stat=EWUS_Damage1, Scale=1.5f), (Stat=EWUS_Weight, Add=0)))
}