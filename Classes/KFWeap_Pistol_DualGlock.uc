//=============================================================================
// KFWeap_Pistol_DualGlock
//=============================================================================
// A set of Glock pistols
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC, Jeff Robinson
// Copyright (C) 2017 HickDead
//=============================================================================

class KFWeap_Pistol_DualGlock extends KFWeap_DualBase;

simulated state WeaponFiring
{
	simulated function FireAmmunition()
	{
		bFireFromRightWeapon = !bFireFromRightWeapon;
		Super.FireAmmunition();
	}
}

defaultproperties
{

	PackageKey="Dual_Glock"
	FirstPersonMeshName="'WEP_1P_Dual_Glock_MESH.Wep_1stP_Dual_Glock_Rig'"
	FirstPersonAnimSetNames(0)="'WEP_1P_Dual_Glock_ANIM.Wep_1stP_Dual_Glock_Anim'"
	PickupMeshName="'WEP_3P_Glock_MESH.Wep_Glock_Pickup'"
	AttachmentArchetypeName="'WEP_Dual_Glock_ARCH.Wep_Dual_Glock_3P'"
	MuzzleFlashTemplateName="'WEP_Dual_Glock_ARCH.Wep_Dual_Glock_MuzzleFlash'"

	FireOffset=(X=17,Y=4.0,Z=-2.25)
	LeftFireOffset=(X=17,Y=-4,Z=-2.25)

	// Zooming/Position
	IronSightPosition=(X=15,Y=0,Z=0)
	PlayerViewOffset=(X=16,Y=0,Z=-5)
	QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)

	// FOV
	MeshFOV=75
	MeshIronSightFOV=60
	PlayerIronSightFOV=77

	// Depth of field
	DOF_FG_FocalRadius=40
	DOF_FG_MaxNearBlurSize=3.5

	// Ammo
	MagazineCapacity[0]=66
	SpareAmmoCapacity[0]=594
	InitialSpareMags[0]=4
	AmmoPickupScale[0]=1.0
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=130
	minRecoilPitch=70
	maxRecoilYaw=90
	minRecoilYaw=-90
	RecoilRate=0.05
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=2500
	RecoilISMinPitchLimit=65485
	IronSightMeshFOVCompensationScale=1.2

	// DEFAULT_FIREMODE
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_PistolGlock'
	FireInterval(DEFAULT_FIREMODE)=+0.025	// twice as fast as single
	InstantHitDamage(DEFAULT_FIREMODE)=25.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_Glock'
	Spread(DEFAULT_FIREMODE)=0.016

	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'

	// ALTFIRE_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_PistolGlock'
	FireInterval(ALTFIRE_FIREMODE)=+0.025	// twice as fast as single
	InstantHitDamage(ALTFIRE_FIREMODE)=25.0
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_Glock'
	Spread(ALTFIRE_FIREMODE)=0.016

	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'

	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=22
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Glock'

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_S')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Handling_DryFire'

	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_S')
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	// Inventory
	InventorySize=4
	GroupPriority=44
	bCanThrow=true
	bDropOnDeath=true
	WeaponSelectTexture=Texture2D'WEP_UI_Dual_Glock_TEX.UI_WeaponSelect_DualGlock'
	bIsBackupWeapon=false
	AssociatedPerkClasses(0)=class'KFPerk_Gunslinger'

	SingleClass=class'KFWeap_Pistol_Glock'

	BonesToLockOnEmpty=(RW_Bolt, RW_Bullets1)
	BonesToLockOnEmpty_L=(LW_Bolt, LW_Bullets1)

	bHasFireLastAnims=true

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[3]=(Stats=((Stat=EWUS_Damage0, Scale=1.8f), (Stat=EWUS_Damage1, Scale=1.8f), (Stat=EWUS_Weight, Add=0)))
}