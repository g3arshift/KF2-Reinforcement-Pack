//=============================================================================
// KFWeap_Pistol_Glock
//=============================================================================
// A Glock pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC, Jeff Robinson
// Copyright (C) 2017 HickDead
//=============================================================================

class KFWeap_SMG_Uzi extends KFWeap_MedicBase;

/*********************************************************************************************
 * @name	Trader
 *********************************************************************************************/

const NewShootDartAnim		= 'Shoot';
const NewShootDartIronAnim	= 'Shoot_Iron';

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_SMG;
}

/** Override for 1st person healing dart anims */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	if ( FireModeNum == ALTFIRE_FIREMODE )
	{
		return (bUsingSights) ? NewShootDartIronAnim : NewShootDartAnim;
	}

	return Super.GetWeaponFireAnim(FireModeNum);
}

defaultproperties
{
	// Healing charge
    HealAmount=20
	HealFullRechargeSeconds=12

	// Inventory
	InventorySize=4 //3
	GroupPriority=70
	WeaponSelectTexture=Texture2D'WEP_UZIPRO_TEX.UI_UZIP_TEX'
	SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'

    // FOV
	MeshFOV=81
	MeshIronSightFOV=55
	PlayerIronSightFOV=70

	// Zooming/Position
	IronSightPosition=(X=5,Y=0.2,Z=-3.0)
	PlayerViewOffset=(X=18.5f,Y=10.25f,Z=-4.0f)

	// Content
	PackageKey="UZIPRO"
	FirstPersonMeshName="WEP_UZIPRO_MESH.Wep_1stP_UZIP_Rig"
	FirstPersonAnimSetNames(0)="wep_1p_mp7_anim.wep_1p_mp7_anim"
	PickupMeshName="WEP_UZIPRO_MESH.Wep_UZIPRO_Pickup"
	AttachmentArchetypeName="WEP_UZIPRO_ARCH.Wep_UZIP_3P"
	MuzzleFlashTemplateName="wep_MP7_arch.Wep_MP7_MuzzleFlash"

	// Ammo
	MagazineCapacity[0]=36
	SpareAmmoCapacity[0]=422
	InitialSpareMags[0]=5
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=50
	minRecoilPitch=40
	maxRecoilYaw=80
	minRecoilYaw=-80
	RecoilRate=0.06
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	IronSightMeshFOVCompensationScale=1.5
	WalkingRecoilModifier=1.1
	JoggingRecoilModifier=1.2

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_UZIP_Medic'
	FireInterval(DEFAULT_FIREMODE)=+.06 // 900 RPM
	Spread(DEFAULT_FIREMODE)=0.007
	InstantHitDamage(DEFAULT_FIREMODE)=25.0  //15.0
	FireOffset=(X=30,Y=4.5,Z=-5)

	// ALTFIRE_FIREMODE
	AmmoCost(ALTFIRE_FIREMODE)=30

	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=30.0
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_SMG_Medic'

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_3P_Loop', FirstPersonCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_1P_Loop')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_1P_Single')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_3P_EndLoop', FirstPersonCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_1P_EndLoop')
	SingleFireSoundIndex=ALTFIRE_FIREMODE

	DualClass=class'KFWeap_SMG_DualUzi'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	AssociatedPerkClasses(0)=class'KFPerk_FieldMedic'
	AssociatedPerkClasses(1)=class'KFPerk_SWAT'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.5f), (Stat=EWUS_Weight, Add=0), (Stat=EWUS_HealFullRecharge, Scale=0.8f)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.69f), (Stat=EWUS_Weight, Add=0), (Stat=EWUS_HealFullRecharge, Scale=0.7f)))
	WeaponUpgrades[3]=(Stats=((Stat=EWUS_Damage0, Scale=1.95f), (Stat=EWUS_Weight, Add=0), (Stat=EWUS_HealFullRecharge, Scale=0.6f)))

	//need to do a full test on healing level increasing
}


