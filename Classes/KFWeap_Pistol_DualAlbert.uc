// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFWeap_Pistol_DualAlbert extends KFWeap_DualBase;

defaultproperties
{

	PackageKey="Dual_Albert"
	FirstPersonMeshName="'WEP_1P_Dual_Albert_MESH.Wep_1stP_Dual_Albert_Rig'"
	FirstPersonAnimSetNames(0)="'WEP_1P_Dual_Deagle_ANIM.Wep_1stP_Dual_Deagle_Anim'"
	PickupMeshName="'WEP_3P_Albert_MESH.Wep_Albert_Pickup'"
	AttachmentArchetypeName="'WEP_Dual_Albert_ARCH.Wep_Dual_Albert_3P'"
	MuzzleFlashTemplateName="'WEP_Dual_Deagle_ARCH.Wep_Dual_Deagle_MuzzleFlash'"
	
	FireOffset=(X=17,Y=4.0,Z=-2.25)
	LeftFireOffset=(X=17,Y=-4,Z=-2.25)

	// Zooming/Position
	IronSightPosition=(X=-1,Y=0,Z=0)
	PlayerViewOffset=(X=9,Y=0,Z=-5)
	QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)

	SingleClass=class'KFWeap_Pistol_Albert'

	// FOV
	MeshFOV=86
	MeshIronSightFOV=77
    PlayerIronSightFOV=77

	// Depth of field
	DOF_FG_FocalRadius=38
	DOF_FG_MaxNearBlurSize=3.5

	// Ammo
	MagazineCapacity[0]=18 // twice as much as single
	SpareAmmoCapacity[0]=180
	InitialSpareMags[0]=5
	AmmoPickupScale[0]=2.0
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=300
	minRecoilPitch=250
	maxRecoilYaw=150
	minRecoilYaw=-150
	RecoilRate=0.07
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=1250
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65485

	// DEFAULT_FIREMODE
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_PistolAlbert'
	FireInterval(DEFAULT_FIREMODE)=+0.0875 // about twice as fast as single
	InstantHitDamage(DEFAULT_FIREMODE)=75.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_Albert'
	PenetrationPower(DEFAULT_FIREMODE)=2.7
	Spread(DEFAULT_FIREMODE)=0.01

	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'

	// ALTFIRE_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_PistolAlbert'
	FireInterval(ALTFIRE_FIREMODE)=+0.0875 // about twice as fast as single
	InstantHitDamage(ALTFIRE_FIREMODE)=75.0
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_Albert'
	PenetrationPower(ALTFIRE_FIREMODE)=2.7
	Spread(ALTFIRE_FIREMODE)=0.01

	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'

	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=24
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Deagle'

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_1P_Single')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Handling_DryFire'

	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_1P_Single')
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	// Inventory
	InventorySize=4
	GroupPriority=58
	bCanThrow=true
	bDropOnDeath=true
	WeaponSelectTexture=Texture2D'WEP_UI_Dual_Albert_TEX.UI_WeaponSelect_DualAlbert'
	bIsBackupWeapon=false
	AssociatedPerkClasses(0)=class'KFPerk_Gunslinger'

    BonesToLockOnEmpty=(RW_Slide, RW_Bullets1)
    BonesToLockOnEmpty_L=(LW_Slide, LW_Bullets1)

    bHasFireLastAnims=true

    WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[3]=(Stats=((Stat=EWUS_Damage0, Scale=1.8f), (Stat=EWUS_Damage1, Scale=1.8f), (Stat=EWUS_Weight, Add=0)))

}

