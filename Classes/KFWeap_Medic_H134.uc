//=============================================================================
// H134 Heavy Shotgun
//=============================================================================
class KFWeap_Medic_H134 extends KFWeap_MedicBase;

var(Weapon) array<byte> NumPellets;

/*********************************************************************************************
 Firing / Projectile - Below projectile spawning code copied from KFWeap_ShotgunBase
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

    for (i = 0; i < NumPellets[CurrentFireMode]; i++)
    {
        Super.SpawnProjectile(KFProjClass, RealStartLoc, vector(class'KFWeap_ShotgunBase'.static.AddMultiShotSpread(AimRot, Spread[CurrentFireMode])));
    }

    return None;
}

/** Disable normal bullet spread */
simulated function rotator AddSpread(rotator BaseAim)
{
    return BaseAim; // do nothing
}

/** Notification that a weapon attack has has happened */
function HandleWeaponShotTaken( byte FireMode )
{
    if( KFPlayer != None )
    {
        KFPlayer.AddShotsFired(NumPellets[FireMode]);
    }
}

///////////////////////////////////////////////////////////////////////////////////////////
//
// Trader
//
///////////////////////////////////////////////////////////////////////////////////////////

/** Allows weapon to calculate its own damage for display in trader.
  * Overridden to multiply damage by number of pellets.
  * Exact copy of KFWeap_ShotgunBase.CalculateTraderWeaponStatDamage
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
    // Inventory / Grouping
    InventorySize=8
    GroupPriority=110
    WeaponSelectTexture=Texture2D'WEP_UI_H134_TEX.UI_WeaponSelect_H134'
    SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
    AssociatedPerkClasses(0)=class'KFPerk_FieldMedic'
    AssociatedPerkClasses(1)=class'KFGame.KFPerk_Support'

    // FOV
    MeshFOV=70
    MeshIronSightFOV=27
    PlayerIronSightFOV=70

    // Depth of field
    DOF_BlendInSpeed=3.0	
    DOF_FG_FocalRadius=0//70
    DOF_FG_MaxNearBlurSize=3.5

    PackageKey="H134"
    FirstPersonMeshName="WEP_1P_H134_MESH.Wep_1stP_H134_Rig"
    FirstPersonAnimSetNames(0)="WEP_1P_Bleeder_ANIM.Wep_1stP_Bleeder_Anim"
    PickupMeshName="WEP_3P_H134_MESH.Wep_3rdP_H134_Pickup"
    AttachmentArchetypeName="WEP_H134_ARCH.Wep_H134_3P"
    MuzzleFlashTemplateName="WEP_H134_ARCH.Wep_H134_MuzzleFlash"

    LaserSightTemplate=KFLaserSightAttachment'FX_LaserSight_ARCH.LaserSight_WithAttachment_1P'

    // Ammo
    MagazineCapacity[0]=30
    SpareAmmoCapacity[0]=300
    InitialSpareMags[0]=3
    bCanBeReloaded=true
    bReloadFromMagazine=true

    // Healing Dart Ammo
    MagazineCapacity[1]=200
    HealingDartAmmo=200

    // Healing charge
    HealAmount=30 //30
    HealFullRechargeSeconds=12

    // Zooming/Position
    PlayerViewOffset=(X=20.0,Y=11.0,Z=-2) //(X=15.0,Y=11.5,Z=-4)
    IronSightPosition=(X=30.0,Y=0,Z=0)

    // AI warning system
    bWarnAIWhenAiming=true
    AimWarningDelay=(X=0.4f, Y=0.8f)
    AimWarningCooldown=0.0f

    // Recoil
    maxRecoilPitch=350
    minRecoilPitch=250
    maxRecoilYaw=375
    minRecoilYaw=-375
    RecoilRate=0.05
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=150
    RecoilISMinYawLimit=65385
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    RecoilViewRotationScale=0.6
    FallingRecoilModifier=1.5
    HippedRecoilModifier=1.5

    // DEFAULT_FIREMODE
    FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
    FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
    WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
    WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_Pellet'
    InstantHitDamage(DEFAULT_FIREMODE)=27.0 //50
    InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_H134'
    FireInterval(DEFAULT_FIREMODE)=0.2
    PenetrationPower(DEFAULT_FIREMODE)=2.5
    Spread(DEFAULT_FIREMODE)=0.12
    FireOffset=(X=30,Y=3.0,Z=-2.5)

    // Superior Shotgun
    NumPellets(DEFAULT_FIREMODE)=8

    // Lock On Functionality
    LockRange=100000
    LockAim=0.98
    LockChecktime=0.09
    LockAcquireTime=0.09
    LockTolerance=0.09

    // ALT_FIREMODE
    AmmoCost(ALTFIRE_FIREMODE)=30
    NumPellets(ALTFIRE_FIREMODE)=1
    FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_MedicDart'

    // BASH_FIREMODE
    InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Hemogoblin'
    InstantHitDamage(BASH_FIREMODE)=27

    // Fire Effects
    WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MedicShotgun.Play_SA_MedicShotgun_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_MedicShotgun.Play_SA_MedicShotgun_Fire_1P')
    WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MedicShotgun.Play_SA_MedicShotgun_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_MedicShotgun.Play_SA_MedicShotgun_Fire_1P')

    WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_MedicShotgun.Play_SA_MedicShotgun_Handling_DryFire'
    WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'

    // Attachments
    bHasIronSights=true
    bHasFlashlight=true
  
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'

    WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Weight, Add=0), (Stat=EWUS_HealFullRecharge, Scale=0.8f)))
    WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Weight, Add=0), (Stat=EWUS_HealFullRecharge, Scale=0.8f)))
}