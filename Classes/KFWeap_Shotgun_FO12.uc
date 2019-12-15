//=============================================================================
// KFWeap_Shotgun
//=============================================================================
//=============================================================================

class KFWeap_Shotgun_FO12 extends KFWeap_ShotgunBase;

defaultproperties
{
	// Inventory
	InventorySize=8
	GroupPriority=110
	WeaponSelectTexture=Texture2D'Wep_FO12_TEX.UI_FO12_TEX'

	// Shooting Animations
	FireSightedAnims[0]=Shoot_Iron
	FireSightedAnims[1]=Shoot_Iron2
	FireSightedAnims[2]=Shoot_Iron3

     // FOV
 	MeshFOV=86
	MeshIronSightFOV=52
    PlayerIronSightFOV=70

	// Depth of field
	DOF_FG_FocalRadius=85
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position
	PlayerViewOffset=(X=15.0,Y=8.5,Z=0.0)
	IronSightPosition=(X=4,Y=0,Z=2.5)

	// Content
	PackageKey="FO12"
	FirstPersonMeshName="Wep_FO12_MESH.Wep_1stP_FO12_Rig"
	FirstPersonAnimSetNames(0)="Wep_1P_AA12_ANIM.Wep_1stP_AA12_Anim"
	PickupMeshName="Wep_FO12_MESH.Wep_FO12_Pickup"
	AttachmentArchetypeName="WEP_FO12_ARCH.Wep_FO12_3P"
	MuzzleFlashTemplateName="WEP_AA12_ARCH.Wep_AA12_MuzzleFlash"

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_Pellet'
	InstantHitDamage(DEFAULT_FIREMODE)=25.0 //25 //20
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_FO12'
	PenetrationPower(DEFAULT_FIREMODE)=2.0
	FireInterval(DEFAULT_FIREMODE)=0.17 // 300 RPM
	FireOffset=(X=30,Y=5,Z=-4)
	// Shotgun
	NumPellets(DEFAULT_FIREMODE)=8

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_Pellet'
	InstantHitDamage(ALTFIRE_FIREMODE)=25.0 //25 //20
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_FO12'
	PenetrationPower(ALTFIRE_FIREMODE)=2.0
	FireInterval(ALTFIRE_FIREMODE)=0.17 // 300 RPM
	Spread(ALTFIRE_FIREMODE)=0.07

	// Shotgun
	NumPellets(ALTFIRE_FIREMODE)=8


	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_FO12'
	InstantHitDamage(BASH_FIREMODE)=40

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_Fire_1P_Single') //@TODO: Replace
    WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_Fire_3P_AltFire', FirstPersonCue=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_Fire_1P_AltFire') //@TODO: Replace

	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	// Ammo
	MagazineCapacity[0]=25
	SpareAmmoCapacity[0]=125 //120
	InitialSpareMags[0]=2
	bCanBeReloaded=true
	bReloadFromMagazine=true
	bHasFireLastAnims=false

	// Recoil
	maxRecoilPitch=245
	minRecoilPitch=215
	maxRecoilYaw=125
	minRecoilYaw=-125
	RecoilRate=0.065
	RecoilBlendOutRatio=0.25
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	RecoilViewRotationScale=0.6
	FallingRecoilModifier=1.4
	HippedRecoilModifier=1.55
    
	AssociatedPerkClasses(0)=class'KFPerk_Support'

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.15f), (Stat=EWUS_Damage1, Scale=1.15f), (Stat=EWUS_Weight, Add=0)))
}