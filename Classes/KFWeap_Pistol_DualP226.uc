//=============================================================================
// KFWeap_Pistol_DualColt1911
//=============================================================================
// A set of Colt 1911 pistols
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFWeap_Pistol_DualP226 extends KFWeap_DualBase;

defaultproperties
{
	// Content
	PackageKey="P226"
	FirstPersonMeshName="WEP_P226_MESH.Wep_1stP_Dual_P226_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_Dual_M1911_ANIM.Wep_1stP_Dual_M1911_Anim"
	PickupMeshName="WEP_P226_MESH.Wep_P226_Pickup"
	AttachmentArchetypeName="WEP_P226_ARCH.Wep_Dual_P226_3P"
	MuzzleFlashTemplateName="WEP_Dual_M1911_ARCH.Wep_Dual_M1911_MuzzleFlash"

	FireOffset=(X=17,Y=4.0,Z=-2.25)
	LeftFireOffset=(X=17,Y=-4,Z=-2.25)

	// Zooming/Position
	IronSightPosition=(X=15,Y=0,Z=-1.6)
	PlayerViewOffset=(X=16,Y=0,Z=-5)
	QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)

	bCanThrow=true
	bDropOnDeath=true

	SingleClass=class'KFWeap_Pistol_P226'

	// FOV
	MeshFOV=75
	MeshIronSightFOV=60
    PlayerIronSightFOV=77

	// Depth of field
	DOF_FG_FocalRadius=40
	DOF_FG_MaxNearBlurSize=3.5

	// Ammo
	MagazineCapacity[0]=40
	SpareAmmoCapacity[0]=160
	InitialSpareMags[0]=3
	AmmoPickupScale[0]=1.0
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
	FireInterval(DEFAULT_FIREMODE)=+0.0825 // about twice as fast as single
	InstantHitDamage(DEFAULT_FIREMODE)=60.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_P226'
	PenetrationPower(DEFAULT_FIREMODE)=1.0
	Spread(DEFAULT_FIREMODE)=0.015

	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'

	// ALTFIRE_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_PistolP226'
	FireInterval(ALTFIRE_FIREMODE)=+0.0825 // about twice as fast as single
	InstantHitDamage(ALTFIRE_FIREMODE)=60.0
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_P226'
	PenetrationPower(ALTFIRE_FIREMODE)=1.0
	Spread(ALTFIRE_FIREMODE)=0.015

	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'

	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=24
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_P226'

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_1P_Single')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Handling_DryFire'

	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_Mac_10.Play_Mac_10_Fire_1P_Single')
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	// Inventory
	InventorySize=6
	GroupPriority=60
	WeaponSelectTexture=Texture2D'WEP_P226_TEX.UI_DUAL_P226_TEX'
	bIsBackupWeapon=false
	AssociatedPerkClasses(0)=class'KFPerk_Gunslinger'

	BonesToLockOnEmpty=(RW_Bolt, RW_Bullets1)
    BonesToLockOnEmpty_L=(LW_Bolt, LW_Bullets1)

    bHasFireLastAnims=true

    // Weapon Upgrade stat boosts
    WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=2.0f), (Stat=EWUS_Damage1, Scale=2.0f), (Stat=EWUS_Weight, Add=0)))
}

