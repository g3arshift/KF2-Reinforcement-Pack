//=============================================================================
// KFWeap_Rifle_STAR21
//=============================================================================
// An semi-auto bullpup sniper rifle 
//=============================================================================

class KFWeap_Rifle_STAR21 extends KFWeap_ScopedBase;

DefaultProperties
{
	// Inventory / Grouping
	InventorySize=6
	GroupPriority=80
	WeaponSelectTexture=Texture2D'WEP_STAR21_TEX.UI_STAR21_TEX'
   	AssociatedPerkClasses(0)=class'KFPerk_Sharpshooter'

   	// 2D scene capture
	Begin Object Name=SceneCapture2DComponent0
	   TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
	   FieldOfView=12.5 // "2.0X" = 25.0(our real world FOV determinant)/2.0
	End Object

    ScopedSensitivityMod=8.0

	ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_STAR21_MAT.WEP_1P_STAR21_Scope_MAT'

	// FOV
   	MeshFOV=70
	MeshIronSightFOV=27
    PlayerIronSightFOV=50
    
	// Depth of field
	DOF_BlendInSpeed=3.0
	DOF_FG_FocalRadius=0//70
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position
	PlayerViewOffset=(X=15.0,Y=11.5,Z=-4)
	IronSightPosition=(X=0.0,Y=0,Z=-3)

	// AI warning system
	bWarnAIWhenAiming=true
	AimWarningDelay=(X=0.4f, Y=0.8f)
	AimWarningCooldown=0.0f

	// Content
	PackageKey="STAR21"
	FirstPersonMeshName="WEP_STAR21_MESH.Wep_1stP_STAR21_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_L85A2_ANIM.Wep_1st_L85A2_Anim"
	PickupMeshName="WEP_STAR21_MESH.Wep_STAR21_Pickup"
	AttachmentArchetypeName="WEP_STAR21_ARCH.Wep_STAR21_3P"
	MuzzleFlashTemplateName="WEP_L85A2_ARCH.Wep_L85A2_MuzzleFlash"

	// Ammo
	MagazineCapacity[0]=25
	SpareAmmoCapacity[0]=275
	InitialSpareMags[0]=4
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=150
	minRecoilPitch=115
	maxRecoilYaw=200
	minRecoilYaw=-200
	RecoilRate=0.06
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=150
	RecoilISMinYawLimit=65385
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	RecoilViewRotationScale=0.6

    // DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_STAR21'
	InstantHitDamage(DEFAULT_FIREMODE)=55.0 //90
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_STAR21'
	FireInterval(DEFAULT_FIREMODE)=0.13 //0.2
	PenetrationPower(DEFAULT_FIREMODE)=1.5
	Spread(DEFAULT_FIREMODE)=0.006
	FireOffset=(X=30,Y=4.5,Z=-5)

	// ALT_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_STAR21'
	InstantHitDamage(BASH_FIREMODE)=35

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_EBR.Play_WEP_SA_EBR_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_SA_EBR.Play_WEP_SA_EBR_Fire_Single_S')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_EBR.Play_WEP_SA_EBR_Handling_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true

	// Custom animations
	FireSightedAnims=(Shoot_Iron, Shoot_Iron2, Shoot_Iron3)

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false
	bHasLaserSight=false

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.3f), (Stat=EWUS_Damage1, Scale=1.3f), (Stat=EWUS_Weight, Add=0)))
}
