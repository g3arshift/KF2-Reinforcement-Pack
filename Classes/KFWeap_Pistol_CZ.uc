//=============================================================================
// KFWeap_Pistol_Medic
//=============================================================================
// A 9mm Pistol that fires healing medic darts
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_Pistol_CZ extends KFWeap_MedicBase;

/*********************************************************************************************
 * @name	Trader
 *********************************************************************************************/

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Pistol;
}

defaultproperties
{

	// Healing charge
    HealAmount=27
	
	// Inventory
	InventoryGroup=IG_Secondary
	InventorySize=2
	GroupPriority=40
	bCanThrow=true
	bDropOnDeath=true
	WeaponSelectTexture=Texture2D'WEP_CZ_TEX.UI_CZ75_TEX'
	SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
	AssociatedPerkClasses(0)=class'KFPerk_FieldMedic'
	AssociatedPerkClasses(1)=class'KFPerk_Gunslinger'

	// Shooting Animations
	FireSightedAnims[0]=Shoot_Iron
	FireSightedAnims[1]=Shoot_Iron2
	FireSightedAnims[2]=Shoot_Iron3

    // FOV
	MeshFOV=86
	MeshIronSightFOV=77
    PlayerIronSightFOV=77

	// Depth of field
	DOF_FG_FocalRadius=40
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position
	PlayerViewOffset=(X=29.0,Y=13,Z=-4)

	//Content
	PackageKey="CZ"
	FirstPersonMeshName="WEP_CZ_MESH.Wep_1stP_CZ_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_Medic_Pistol_ANIM.WEP_1P_Medic_Pistol_ANIM"
	PickupMeshName="WEP_CZ_MESH.Wep_CZ_Pickup"
	AttachmentArchetypeName="WEP_CZ_ARCH.Wep_CZ_3P"
	MuzzleFlashTemplateName="WEP_Medic_Pistol_ARCH.Wep_Medic_Pistol_MuzzleFlash"

   	// Zooming/Position
	IronSightPosition=(X=5,Y=0,Z=-2.5)

	// Ammo
	MagazineCapacity[0]=15
	SpareAmmoCapacity[0]=150
	InitialSpareMags[0]=5
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=325
	minRecoilPitch=242
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

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_Pistol9mm'
	FireInterval(DEFAULT_FIREMODE)=+0.2
	InstantHitDamage(DEFAULT_FIREMODE)=34.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_Pistol_CZ'
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Pistol_CZ'
	Spread(DEFAULT_FIREMODE)=0.019
	FireOffset=(X=20,Y=4.0,Z=-3)

	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=30

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Fire_Single_S')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_HealFullRecharge, Scale=0.9f)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.9f), (Stat=EWUS_HealFullRecharge, Scale=0.8f)))
	WeaponUpgrades[3]=(Stats=((Stat=EWUS_Damage0, Scale=2.2f), (Stat=EWUS_HealFullRecharge, Scale=0.7f)))

}

