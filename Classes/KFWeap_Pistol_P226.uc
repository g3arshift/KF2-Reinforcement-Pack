//=============================================================================
// KFWeap_Pistol_Colt1911
//=============================================================================
// A Colt 1911 pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFWeap_Pistol_P226 extends KFWeap_PistolBase;

defaultproperties
{
    // FOV
	MeshFOV=75
	MeshIronSightFOV=60
    PlayerIronSightFOV=77

	// Depth of field
	DOF_FG_FocalRadius=40
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position
	PlayerViewOffset=(X=22.0,Y=12,Z=-6)
	IronSightPosition=(X=10,Y=0,Z=-1.6)

	// Content
	PackageKey="P226"
	FirstPersonMeshName="WEP_P226_MESH.Wep_1stP_P226_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_M1911_ANIM.Wep_1stP_M1911_Anim"
	PickupMeshName="WEP_P226_MESH.Wep_P226_Pickup"
	AttachmentArchetypeName="WEP_P226_ARCH.Wep_P226_3P"
	MuzzleFlashTemplateName="WEP_M1911_ARCH.Wep_M1911_MuzzleFlash"

	// Ammo
	MagazineCapacity[0]=20
	SpareAmmoCapacity[0]=180
	InitialSpareMags[0]=4
	AmmoPickupScale[0]=2.0
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=290
	minRecoilPitch=250
	maxRecoilYaw=100
	minRecoilYaw=-100
	RecoilRate=0.07
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=250
	RecoilISMinPitchLimit=65485
	IronSightMeshFOVCompensationScale=1.35

	// DEFAULT_FIREMODE
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_PistolP226'
	FireInterval(DEFAULT_FIREMODE)=+0.1650
	InstantHitDamage(DEFAULT_FIREMODE)=60.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_P226'
	Spread(DEFAULT_FIREMODE)=0.015
	PenetrationPower(DEFAULT_FIREMODE)=1.5
	FireOffset=(X=20,Y=4.0,Z=-3)

	// ALT_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None


	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_P226'
	InstantHitDamage(BASH_FIREMODE)=22

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_1P_Single')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	// Inventory
	InventorySize=3
	GroupPriority=30
	bCanThrow=true
	bDropOnDeath=true
	WeaponSelectTexture=Texture2D'WEP_P226_TEX.UI_P226_TEX'
	bIsBackupWeapon=false
	AssociatedPerkClasses(0)=class'KFPerk_Gunslinger'

	DualClass=class'KFWeap_Pistol_DualP226'

	// Custom animations
	FireSightedAnims=(Shoot_Iron, Shoot_Iron2, Shoot_Iron3)
	IdleFidgetAnims=(Guncheck_v1, Guncheck_v2, Guncheck_v3, Guncheck_v4, Guncheck_v5,Guncheck_v6)

	bHasFireLastAnims=true

	BonesToLockOnEmpty=(RW_Bolt, RW_Bullets1)

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=2.0f), (Stat=EWUS_Damage1, Scale=2.0f), (Stat=EWUS_Weight, Add=0)))
}

