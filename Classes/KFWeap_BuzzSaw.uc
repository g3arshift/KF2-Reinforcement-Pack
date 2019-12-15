//=============================================================================
// KFWeap_Buzzsaw
//=============================================================================
// A crossbow with saw-blade
//=============================================================================

class KFWeap_Buzzsaw extends KFWeap_RifleBase;

/** Return true if this weapon should play the fire last animation for this shoot animation */
simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
    if( SpareAmmoCount[GetAmmoType(FireModeNum)] == 0 )
    {
        return true;
    }

    return false;
}

/** Returns animation to play based on reload type and status */
simulated function name GetReloadAnimName( bool bTacticalReload )
{
	if ( AmmoCount[0] > 0 )
	{
		// Disable half-reloads for now.  This can happen if server gets out
		// of sync, but choosing the wrong animation will just make it worse!
		`warn("Grenade launcher reloading with non-empty mag");
	}

	return bTacticalReload ? ReloadEmptyMagEliteAnim : ReloadEmptyMagAnim;
}

/** Returns trader filter index based on weapon type (copied from riflebase) */
static simulated event EFilterTypeUI GetTraderFilter()
{
    return FT_Projectile;
}

defaultproperties
{
	// Inventory
	InventorySize=6
	GroupPriority=50
	WeaponSelectTexture=Texture2D'WEP_UI_Buzzsaw_TEX.UI_WeaponSelect_Buzzsaw'
   	AssociatedPerkClasses(0)=class'KFPerk_Berserker'

    // FOV / Position
    MeshFOV=70
	MeshIronSightFOV=52
    PlayerIronSightFOV=70
	PlayerViewOffset=(X=1,Y=8,Z=-5)
	IronSightPosition=(X=-23,Y=0,Z=-1)

	// AI warning system
	bWarnAIWhenAiming=true
    MaxAIWarningDistSQ=4000000
	AimWarningDelay=(X=0.4f, Y=0.8f)
	AimWarningCooldown=0.0f

	// Depth of field
	DOF_BlendInSpeed=3.0
	DOF_FG_FocalRadius=0.0
	DOF_FG_MaxNearBlurSize=3.5

	PackageKey="Buzzsaw"
	FirstPersonMeshName="'WEP_1P_Buzzsaw_MESH.Wep_1stP_Buzzsaw_Rig'"
	FirstPersonAnimSetNames(0)="'WEP_1P_Crossbow_ANIM.Wep_1stP_Crossbow_Anim'"
	PickupMeshName="WEP_3P_Buzzsaw_MESH.Wep_Buzzsaw_Pickup'"
	AttachmentArchetypeName="'WEP_Buzzsaw_ARCH.Wep_Buzzsaw_3P'"
	MuzzleFlashTemplateName="'WEP_Crossbow_ARCH.Wep_Crossbow_MuzzleFlash'"

	// Ammo
	MagazineCapacity[0]=1
	SpareAmmoCapacity[0]=50
	InitialSpareMags[0]=21
	AmmoPickupScale[0]=3.0 // 3 arrows
	bCanBeReloaded=true
	bReloadFromMagazine=true // reloading from mag is one step, while NOT reloading from mag is multi-step (open bolt, load ammo, close bolt) and not applicable for bow

	// Recoil
	maxRecoilPitch=100
	minRecoilPitch=70
	maxRecoilYaw=100
	minRecoilYaw=-100
	RecoilRate=0.03
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFireAndReload
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Blade_Buzzsaw'
	InstantHitDamage(DEFAULT_FIREMODE)=480
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Piercing_Crossbow'
	PenetrationPower(DEFAULT_FIREMODE)=6.0
	FireInterval(DEFAULT_FIREMODE)=0.3 // For this weapon, this is not the fire rate, but the time when the auto reload anim kicks in
	Spread(DEFAULT_FIREMODE)=0.009 //0.007
	FireOffset=(X=25,Y=3.0,Z=-4.0)

	// ALT_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Fire_1P')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_Crossbow.Play_WEP_SA_Crossbow_DryFire'


	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Crossbow'
	InstantHitDamage(BASH_FIREMODE)=30

	// Custom animations
	FireSightedAnims=(Shoot_Iron, Shoot_Iron2, Shoot_Iron3)
	BonesToLockOnEmpty=(RW_Cable_Parent)

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	// Just like the launchers, this weapon has mag size of 1 and force reload which
	// causes significant ammo sync issues.  This fix is far from perfect, but it helps.
	bAllowClientAmmoTracking=true

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))
}