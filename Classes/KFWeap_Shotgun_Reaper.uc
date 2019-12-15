// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_Shotgun_Reaper extends KFWeap_ShotgunBase;


defaultproperties
{
	// Inventory
	InventorySize=8
	GroupPriority=120
	WeaponSelectTexture=Texture2D'WEP_UI_Reaper_TEX.UI_WeaponSelect_Reaper'

	FireSightedAnims=(Shoot_Iron, Shoot_Iron2, Shoot_Iron3)
	IdleFidgetAnims=(Guncheck_v1, Guncheck_v2, Guncheck_v3, Guncheck_v4)
	
     // FOV
 	Meshfov=80
	MeshIronSightFOV=65 //52
    PlayerIronSightFOV=50 //80

	// Depth of field
	DOF_FG_FocalRadius=85
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position
	PlayerViewOffset=(X=9.0,Y=10,Z=-4)
	IronSightPosition=(X=11,Y=0,Z=1.3)

	PackageKey="Reaper"
	FirstPersonMeshName="'WEP_1P_Reaper_MESH.Wep_1stP_Reaper_Rig'"
	FirstPersonAnimSetNames(0)="'WEP_1P_Deagle_ANIM.Wep_1st_Deagle_Anim'"
	PickupMeshName="'WEP_3P_Reaper_MESH.Wep_3rdP_Reaper_Pickup'"
	AttachmentArchetypeName="'wep_reaper_arch.Wep_Reaper_3P'"
	MuzzleFlashTemplateName="'WEP_AA12_ARCH.Wep_AA12_MuzzleFlash'"

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_ExplosiveSubmunition_ReaperExp'
	InstantHitDamage(DEFAULT_FIREMODE)=23.0 //25
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_ReaperExpSubmunitionImpact'
	PenetrationPower(DEFAULT_FIREMODE)=2.0
	FireInterval(DEFAULT_FIREMODE)=0.4 // 300 RPM
	Spread(DEFAULT_FIREMODE)=0.07
	// Shotgun
	NumPellets(DEFAULT_FIREMODE)=7

	// ALT_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None
	
	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Reaper'
	InstantHitDamage(BASH_FIREMODE)=40

	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_Microwave_Gun.Play_SA_MicrowaveGun_Fire_Secondary_3P', FirstPersonCue=AkEvent'WW_WEP_SA_Microwave_Gun.Play_SA_MicrowaveGun_Fire_Secondary_1P')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	// Ammo
	MagazineCapacity[0]=20
	SpareAmmoCapacity[0]=100
	InitialSpareMags[0]=3
	bCanBeReloaded=true
	bReloadFromMagazine=true
	bHasFireLastAnims=true

	// Recoil
	maxRecoilPitch=280
	minRecoilPitch=225
	maxRecoilYaw=125
	minRecoilYaw=-125
	RecoilRate=0.075
	RecoilBlendOutRatio=0.25
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	RecoilViewRotationScale=0.7
	FallingRecoilModifier=1.5
	HippedRecoilModifier=1.75
    
	AssociatedPerkClasses(0)=class'KFPerk_Support'

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))
}