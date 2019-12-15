//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFWeap_Shotgun_DualHellFire extends KFWeap_DualBase;

var(Weapon) array<byte>	NumPellets;

/*********************************************************************************************
 Firing / Projectile
********************************************************************************************* */

/** Spawn projectile is called once for each shot pellet fired */
simulated function KFProjectile SpawnProjectile( class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir )
{
	local int i;
	local rotator AimRot;
	local KFPerk InstigatorPerk;

    if( CurrentFireMode == GRENADE_FIREMODE )
    {
        return Super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
    }

    InstigatorPerk = GetPerk();
    if( InstigatorPerk != none )
    {
    	Spread[CurrentFireMode] = default.Spread[CurrentFireMode] * InstigatorPerk.GetTightChokeModifier();
    }

	AimRot = rotator(AimDir);

	for (i = 0; i < GetNumProjectilesToFire(CurrentFireMode); i++)
	{
		Super.SpawnProjectile(KFProjClass, RealStartLoc, vector(class'KFWeap_ShotgunBase'.static.AddMultiShotSpread(AimRot, Spread[CurrentFireMode])));	}

	return None;
}

/** Returns number of projectiles to fire from SpawnProjectile */
simulated function byte GetNumProjectilesToFire(byte FireModeNum)
{
	return NumPellets[CurrentFireMode];
}

/** Notification that a weapon attack has has happened */
function HandleWeaponShotTaken( byte FireMode )
{
    if( KFPlayer != None )
	{
        KFPlayer.AddShotsFired(GetNumProjectilesToFire( FireMode ));
	}
}

/** Disable normal bullet spread */
simulated function rotator AddSpread(rotator BaseAim)
{
	return BaseAim; // do nothing
}

 /** Same as AddSpread(), but used with MultiShotSpread */
static function rotator AddMultiShotSpread( rotator BaseAim, float CurrentSpread )
{
	local vector X, Y, Z;
	local float RandY, RandZ;

	if (CurrentSpread == 0)
	{
		return BaseAim;
	}
	else
	{
		// Add in any spread.
		GetAxes(BaseAim, X, Y, Z);
		RandY = FRand() - 0.5;
		RandZ = Sqrt(0.5 - Square(RandY)) * (FRand() - 0.5);
		return rotator(X + RandY * CurrentSpread * Y + RandZ * CurrentSpread * Z);
	}
}

/*********************************************************************************************
 * @name	Trader
 *********************************************************************************************/

/** Allows weapon to calculate its own damage for display in trader.
  * Overridden to multiply damage by number of pellets.
  */
static simulated function float CalculateTraderWeaponStatDamage()
{
	local float BaseDamage, DoTDamage;
	local class<KFDamageType> DamageType;

	BaseDamage = default.InstantHitDamage[DEFAULT_FIREMODE];

	DamageType = class<KFDamageType>(default.InstantHitDamageTypes[DEFAULT_FIREMODE]);
	if( DamageType != none && DamageType.default.DoT_Type != DOT_None )
	{
		DoTDamage = (DamageType.default.DoT_Duration / DamageType.default.DoT_Interval) * (BaseDamage * DamageType.default.DoT_DamageScale);
	}

	return BaseDamage * default.NumPellets[DEFAULT_FIREMODE] + DoTDamage;
}

defaultproperties
{
	SingleClass=class'KFWeap_Shotgun_HellFire'

	PackageKey="Dual_HellFireS"
	FirstPersonMeshName="'WEP_1P_Dual_HellFireS_MESH.Wep_1stP_Dual_HellFireS_Rig'"
	FirstPersonAnimSetNames(0)="'WEP_1P_Dual_SW_500_ANIM.Wep_1stP_Dual_SW_500_Anim'"
	PickupMeshName="'WEP_3P_Dual_HellFireS_MESH.Wep_HellFireS_Pickup'"
	AttachmentArchetypeName="'WEP_Dual_HellFireS_ARCH.Wep_Dual_HellFireS_3P'"
	MuzzleFlashTemplateName="'WEP_Dual_SW_500_ARCH.Wep_Dual_SW_500_MuzzleFlash'"
	
	Begin Object Name=FirstPersonMesh	
		// new anim tree with skelcontrol to rotate cylinders
		AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master_Revolver'
	End Object

	FireOffset=(X=17,Y=4.0,Z=-2.25)
	LeftFireOffset=(X=17,Y=-4,Z=-2.25)

	// Zooming/Position
	IronSightPosition=(X=7,Y=0,Z=0)
	PlayerViewOffset=(X=29,Y=0,Z=-4)
	QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)

	bCanThrow=true
	bDropOnDeath=true

	// FOV
	MeshFOV=60
	MeshIronSightFOV=60
    PlayerIronSightFOV=77

	// Depth of field
	DOF_FG_FocalRadius=40
	DOF_FG_MaxNearBlurSize=3.5

	// Ammo
	MagazineCapacity[0]=8 // twice as much as single
	SpareAmmoCapacity[0]=80
	InitialSpareMags[0]=4
	AmmoPickupScale[0]=2.5
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=675
	minRecoilPitch=600
	maxRecoilYaw=150
	minRecoilYaw=-150
	RecoilRate=0.05
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65485
	IronSightMeshFOVCompensationScale=1.4
	FallingRecoilModifier=1.2
	HippedRecoilModifier=1.02

	// DEFAULT_FIREMODE
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_Pellet'
	FireInterval(DEFAULT_FIREMODE)=+0.3 // 0.14 about twice as fast as single
	InstantHitDamage(DEFAULT_FIREMODE)=40.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_HellFireS'
	PenetrationPower(DEFAULT_FIREMODE)=2.0
	Spread(DEFAULT_FIREMODE)=0.15
	// Shotgun
	NumPellets(DEFAULT_FIREMODE)=20

	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'

	// ALTFIRE_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_Pellet'
	FireInterval(ALTFIRE_FIREMODE)=+0.3 // 0.14 about twice as fast as single
	InstantHitDamage(ALTFIRE_FIREMODE)=40.0 //150
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_HellFireS'
	PenetrationPower(ALTFIRE_FIREMODE)=2.0
	Spread(ALTFIRE_FIREMODE)=0.15
	// Shotgun
	NumPellets(ALTFIRE_FIREMODE)=20


	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'

	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=50
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_HellFireS'

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_M', FirstPersonCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_S')
    WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'

	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_M', FirstPersonCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_S')
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'

	// Inventory
	InventorySize=8
	GroupPriority=120
	WeaponSelectTexture=Texture2D'WEP_UI_Dual_HellFireS_TEX.UI_WeaponSelect_DuaHellFireS'
	bIsBackupWeapon=false
	AssociatedPerkClasses(0)=class'KFPerk_Support'

    bHasFireLastAnims=true
    BonesToLockOnEmpty=(RW_Hammer)
    BonesToLockOnEmpty_L=(LW_Hammer)

    // Revolver
	bRevolver=true
	CylinderRotInfo=(Inc=-72.0, Time=0.0875/*about 0.35 in the anim divided by ratescale of 4*/)
    CylinderRotInfo_L=(Inc=-72.0, Time=0.0875/*about 0.35 in the anim divided by ratescale of 4*/)

    // Revolver shell/cap replacement
    WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))

}

