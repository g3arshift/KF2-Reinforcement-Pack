//=============================================================================
// KFWeap_Bullpup
//=============================================================================
// A L85A2 'bullpup'
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AssaultRifle_Feline extends KFWeap_RifleBase;

defaultproperties
{
	// Shooting Animations
	FireSightedAnims[0]=Shoot_Iron
	FireSightedAnims[1]=Shoot_Iron2
	FireSightedAnims[2]=Shoot_Iron3

    // FOV
	MeshIronSightFOV=52
    PlayerIronSightFOV=70

	// Depth of field
	DOF_FG_FocalRadius=85
	DOF_FG_MaxNearBlurSize=2.5

	// Content
	PackageKey="FELINE"
	FirstPersonMeshName="WEP_FELINE_MESH.Wep_1stP_Feline_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_L85A2_ANIM.Wep_1st_L85A2_Anim"
	PickupMeshName="WEP_FELINE_MESH.Wep_Feline_Pickup"
	AttachmentArchetypeName="WEP_FELINE_ARCH.Wep_FELINE_3P"
	MuzzleFlashTemplateName="WEP_L85A2_ARCH.Wep_L85A2_MuzzleFlash"

   	// Zooming/Position
	PlayerViewOffset=(X=3.0,Y=9,Z=-3)
	IronSightPosition=(X=-10,Y=0.1,Z=-3.48)

	// Ammo
	MagazineCapacity[0]=30
	SpareAmmoCapacity[0]=270
	InitialSpareMags[0]=3
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=225
	minRecoilPitch=195
	maxRecoilYaw=135
	minRecoilYaw=-115
	RecoilRate=0.085
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	RecoilViewRotationScale=0.25
	IronSightMeshFOVCompensationScale=1.5
    HippedRecoilModifier=1.5

    // Inventory / Grouping
	InventorySize=7
	GroupPriority=215
	WeaponSelectTexture=Texture2D'WEP_FELINE_TEX.UI_FELINE_TEX'
   	AssociatedPerkClasses(0)=class'KFPerk_Commando'

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_ExpAmmu_Feline'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_FelineExpAmmu'
	FireInterval(DEFAULT_FIREMODE)=+0.095 // 660 RPM
	Spread(DEFAULT_FIREMODE)=0.0085
	InstantHitDamage(DEFAULT_FIREMODE)=30.0 //25
	FireOffset=(X=30,Y=4.5,Z=-5)

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_ExpAmmu_Feline'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_FelineExpAmmu'
	FireInterval(ALTFIRE_FIREMODE)=+0.1
	InstantHitDamage(ALTFIRE_FIREMODE)=30.0 //25
	Spread(ALTFIRE_FIREMODE)=0.0085

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Bullpup'
	InstantHitDamage(BASH_FIREMODE)=30

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Loop_M', FirstPersonCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Loop_S')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Single_S')
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Loop_End_M', FirstPersonCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Loop_End_S')

	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Handling_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	SingleFireSoundIndex=ALTFIRE_FIREMODE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.12f), (Stat=EWUS_Damage1, Scale=1.12f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.3f), (Stat=EWUS_Damage1, Scale=1.3f), (Stat=EWUS_Weight, Add=0)))
}


