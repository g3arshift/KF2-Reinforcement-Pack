//=============================================================================
// KFWeap_Bullpup
//=============================================================================
// A L85A2 'bullpup'
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_GrenadeLauncher_XM25 extends KFWeap_ScopedBase;

defaultproperties
{
	// Shooting Animations
	FireSightedAnims[0]=Shoot_Iron
	FireSightedAnims[1]=Shoot_Iron2
	FireSightedAnims[2]=Shoot_Iron3

	// 2D scene capture
	Begin Object Name=SceneCapture2DComponent0
	   TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
	   FieldOfView=12.5 // "2.0X" = 25.0(our real world FOV determinant)/2.0
	End Object

    ScopedSensitivityMod=8.0

	ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_XM25_MAT.WEP_1P_XM25_Scope_MAT'

    // FOV
    MeshFOV=70
	MeshIronSightFOV=52
    PlayerIronSightFOV=70

    // Zooming/Position
	PlayerViewOffset=(X=4,Y=10,Z=-2)
	IronSightPosition=(X=-17,Y=0,Z=-1)

	// Depth of field
	DOF_BlendInSpeed=3.0	
	DOF_FG_FocalRadius=0//70
	DOF_FG_MaxNearBlurSize=3.5

	// Content
	PackageKey="XM25"
	FirstPersonMeshName="WEP_XM25_MESH.Wep_1stP_XM25_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_L85A2_ANIM.Wep_1st_L85A2_Anim"
	PickupMeshName="WEP_XM25_MESH.Wep_XM25_Pickup"
	AttachmentArchetypeName="WEP_XM25_ARCH.Wep_XM25_3P"
	MuzzleFlashTemplateName="WEP_M79_ARCH.Wep_M79_MuzzleFlash"


	// Ammo
	MagazineCapacity[0]=5
	SpareAmmoCapacity[0]=50
	InitialSpareMags[0]=3
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=450
	minRecoilPitch=340
	maxRecoilYaw=500
	minRecoilYaw=-500
	RecoilRate=0.085
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	RecoilViewRotationScale=0.8
	FallingRecoilModifier=1.5
	IronSightMeshFOVCompensationScale=1.5
    HippedRecoilModifier=1.5

    // Inventory / Grouping
	InventorySize=7
	GroupPriority=200
	WeaponSelectTexture=Texture2D'WEP_XM25_TEX.UI_XM25_TEX'
   	AssociatedPerkClasses(0)=class'KFPerk_Demolitionist'
   	AssociatedPerkClasses(1)=class'KFPerk_Firebug'
   	AssociatedPerkClasses(2)=class'KFPerk_FieldMedic'

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Grenade'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_HighExplosive_XM25'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_XM25Impact'
	FireInterval(DEFAULT_FIREMODE)=+0.3 // 660 RPM
	Spread(DEFAULT_FIREMODE)=0.009
	InstantHitDamage(DEFAULT_FIREMODE)=150 //25
	FireOffset=(X=23,Y=4.5,Z=-5)

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_MedicDart'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_XM25Healing_Nade'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_XM25HealingNadeImpact'
	FireInterval(ALTFIRE_FIREMODE)=+0.3
	InstantHitDamage(ALTFIRE_FIREMODE)=150.0 //25
	Spread(ALTFIRE_FIREMODE)=0.0085

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Bullpup'
	InstantHitDamage(BASH_FIREMODE)=30

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Fire_M', FirstPersonCue=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Fire_S')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Fire_M', FirstPersonCue=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Fire_S')

	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Handling_DryFire'

	// Advanced (High RPM) Fire Effects
	SingleFireSoundIndex=ALTFIRE_FIREMODE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.15f), (Stat=EWUS_Damage1, Scale=1.15f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.3f), (Stat=EWUS_Damage1, Scale=1.3f), (Stat=EWUS_Weight, Add=0)))
}


