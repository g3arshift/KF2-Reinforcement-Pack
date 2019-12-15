//=============================================================================
// KFWeap_Shotgun_MB500
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeap_Shotgun_HellFire extends KFWeap_ShotgunBase;

defaultproperties
{
	// Inventory
	InventorySize=4
	GroupPriority=60
	WeaponSelectTexture=Texture2D'WEP_UI_Dual_HellFireS_TEX.UI_WeaponSelect_HellFireS'

	DualClass=class'KFWeap_Shotgun_DualHellFire'

    // FOV
	MeshFOV=60
	MeshIronSightFOV=60
    PlayerIronSightFOV=77

	// Depth of field
	DOF_FG_FocalRadius=40
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position
	PlayerViewOffset=(X=22,Y=12,Z=-6)
	IronSightPosition=(X=2,Y=0,Z=0)

	PackageKey="Dual_HellFireS"
	FirstPersonMeshName="'WEP_1P_Dual_HellFireS_MESH.Wep_1stP_HellFire_Single_Rig'"
	FirstPersonAnimSetNames(0)="'WEP_1P_SW_500_ANIM.WEP_1stP_SW_500_Anim'"
	PickupMeshName="'WEP_3P_Dual_HellFireS_MESH.Wep_HellFireS_Pickup'"
	AttachmentArchetypeName="'WEP_Dual_HellFireS_ARCH.Wep_HellFire_3P'"
	MuzzleFlashTemplateName="'WEP_Dual_SW_500_ARCH.Wep_Dual_SW_500_MuzzleFlash'"

	Begin Object Name=FirstPersonMesh
		AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master_Revolver'
	End Object

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)="ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle"
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_Pellet'
	InstantHitDamage(DEFAULT_FIREMODE)=40.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_HellFireS'
	PenetrationPower(DEFAULT_FIREMODE)=2.0
	FireInterval(DEFAULT_FIREMODE)=0.3 // 78 RPM
	Spread(DEFAULT_FIREMODE)=0.15
	FireOffset=(X=30,Y=3,Z=-3)
	// Shotgun
	NumPellets(DEFAULT_FIREMODE)=20

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_HellFireS'
	InstantHitDamage(BASH_FIREMODE)=25

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_M', FirstPersonCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_S')
    WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'

	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_M', FirstPersonCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_S')
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	// Ammo
	MagazineCapacity[0]=4
	SpareAmmoCapacity[0]=40
	InitialSpareMags[0]=2
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=675
	minRecoilPitch=600
	maxRecoilYaw=150
	minRecoilYaw=-150
	RecoilRate=0.05
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65485
	IronSightMeshFOVCompensationScale=1.4
	FallingRecoilModifier=1.2
	HippedRecoilModifier=1.02

	AssociatedPerkClasses(0)=class'KFPerk_Support'

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))
}