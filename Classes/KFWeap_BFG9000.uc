//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFWeap_BFG9000 extends KFWeapon;

//Props related to charging the weapon
var float MaxChargeTime;
var float ValueIncreaseTime;
var float DmgIncreasePerCharge;
var float AOEIncreasePerCharge;
var float IncapIncreasePerCharge;
var int AmmoIncreasePerCharge;

var transient float ChargeTime;
var transient float ConsumeAmmoTime;
var transient float MaxChargeLevel;

var ParticleSystem ChargingEffect;
var ParticleSystem ChargedEffect;

var const ParticleSystem MuzzleFlashEffectL1;
var const ParticleSystem MuzzleFlashEffectL2;
var const ParticleSystem MuzzleFlashEffectL3;

var transient ParticleSystemComponent ChargingPSC;
var transient bool bIsFullyCharged;

var const WeaponFireSndInfo FullyChargedSound;

var float SelfDamageReductionValue;

var float FullChargedTimerInterval;

static simulated event EFilterTypeUI GetTraderFilter()
{
    return FT_Electric;
}

static simulated function float CalculateTraderWeaponStatDamage()
{
	local float CalculatedDamage;
	local class<KFDamageType> DamageType;
	local GameExplosion ExplosionInstance;

	ExplosionInstance = class<KFProjectile>(default.WeaponProjectiles[DEFAULT_FIREMODE]).default.ExplosionTemplate;

	CalculatedDamage = default.InstantHitDamage[DEFAULT_FIREMODE] + ExplosionInstance.Damage;

	DamageType = class<KFDamageType>(ExplosionInstance.MyDamageType);
	if (DamageType != none && DamageType.default.DoT_Type != DOT_None)
	{
		CalculatedDamage += (DamageType.default.DoT_Duration / DamageType.default.DoT_Interval) * (CalculatedDamage * DamageType.default.DoT_DamageScale);
	}

	return CalculatedDamage;
}


/**
* @see Weapon::ConsumeAmmo
*/
simulated function ConsumeAmmo(byte FireModeNum)
{
    local KFPerk InstigatorPerk;

`if(`notdefined(ShippingPC))
    if (bInfiniteAmmo)
    {
        return;
    }
`endif

    InstigatorPerk = GetPerk();
    if (InstigatorPerk != none && InstigatorPerk.GetIsUberAmmoActive(self)) //check for pyro maniac
    {
        return;
    }

    // If AmmoCount is being replicated, don't allow the client to modify it here
    if (Role == ROLE_Authority || bAllowClientAmmoTracking)
    {
		super.ConsumeAmmo(FireModeNum);
    }
}

simulated function StartFire(byte FiremodeNum)
{
	if (IsTimerActive('RefireCheckTimer'))
	{
		return;
	}

	super.StartFire(FiremodeNum);
}

simulated function OnStartFire()
{
	local KFPawn PawnInst;
	PawnInst = KFPawn(Instigator);

	if (PawnInst != none)
	{
		PawnInst.OnStartFire();
	}
}


simulated function FireAmmunition()
{
	// Let the accuracy tracking system know that we fired
	HandleWeaponShotTaken(CurrentFireMode);

	// Handle the different fire types
	switch (WeaponFireTypes[CurrentFireMode])
	{
	case EWFT_InstantHit:
		// Launch a projectile if we are in zed time, and this weapon has a projectile to launch for this mode
		if (`IsInZedTime(self) && WeaponProjectiles[CurrentFireMode] != none )
		{
			ProjectileFire();
		}
		else
		{
			InstantFireClient();
		}
		break;

	case EWFT_Projectile:
		ProjectileFire();
		break;

	case EWFT_Custom:
		CustomFire();
		break;
	}

	// If we're firing without charging, still consume one ammo
	if (GetChargeLevel() < 1)
	{
		ConsumeAmmo(CurrentFireMode);
	}

	NotifyWeaponFired(CurrentFireMode);

	// Play fire effects now (don't wait for WeaponFired to replicate)
	PlayFireEffects(CurrentFireMode, vect(0, 0, 0));
}

simulated state HuskCannonCharge extends WeaponFiring
{
    //For minimal code purposes, I'll directly call global.FireAmmunition after charging is released
    simulated function FireAmmunition()
    {}

    //Store start fire time so we don't have to timer this
    simulated event BeginState(Name PreviousStateName)
    {
        super.BeginState(PreviousStateName);

		ChargeTime = 0;
		ConsumeAmmoTime = 0;
		MaxChargeLevel = int(MaxChargeTime / ValueIncreaseTime);

		if (ChargingPSC == none)
		{
			ChargingPSC = new(self) class'ParticleSystemComponent';

			if(MySkelMesh != none)
			{
				MySkelMesh.AttachComponentToSocket(ChargingPSC, 'MuzzleFlash');
			}
			else
			{
				AttachComponent(ChargingPSC);
			}
		}
		else
		{
			ChargingPSC.ActivateSystem();
		}

		bIsFullyCharged = false;

		global.OnStartFire();

		if(ChargingPSC != none)
		{
			ChargingPSC.SetTemplate(ChargingEffect);
		}
    }

	simulated function bool ShouldRefire()
	{
		// ignore how much ammo is left (super/global counts ammo)
		return StillFiring(CurrentFireMode);
	}

    simulated event Tick(float DeltaTime)
    {
        local float ChargeRTPC;

		global.Tick(DeltaTime);

		// Don't charge unless we're holding down the button
		if (PendingFire(CurrentFireMode))
		{
			ConsumeAmmoTime += DeltaTime;
		}

		if (bIsFullyCharged)
		{
			if (ConsumeAmmoTime >= FullChargedTimerInterval)
			{
				ConsumeAmmo(DEFAULT_FIREMODE);
				ConsumeAmmoTime -= FullChargedTimerInterval;
			}

			return;
		}

		// Don't charge unless we're holding down the button
		if (PendingFire(CurrentFireMode))
		{
			ChargeTime += DeltaTime;
		}

		ChargeRTPC = FMin(ChargeTime / MaxChargeTime, 1.f);
        KFPawn(Instigator).SetWeaponComponentRTPCValue("Weapon_Charge", ChargeRTPC); //For looping component
        Instigator.SetRTPCValue('Weapon_Charge', ChargeRTPC); //For one-shot sounds

		if (ConsumeAmmoTime >= ValueIncreaseTime)
		{
			ConsumeAmmo(DEFAULT_FIREMODE);
			ConsumeAmmoTime -= ValueIncreaseTime;
		}

		if (ChargeTime >= MaxChargeTime || !HasAmmo(DEFAULT_FIREMODE))
		{
			bIsFullyCharged = true;
			ChargingPSC.SetTemplate(ChargedEffect);
			KFPawn(Instigator).SetWeaponAmbientSound(FullyChargedSound.DefaultCue, FullyChargedSound.FirstPersonCue);
		}
    }

    //Now that we're done charging, directly call FireAmmunition. This will handle the actual projectile fire and scaling.
    simulated event EndState(Name NextStateName)
    {
        global.FireAmmunition();

		if (bPlayingLoopingFireAnim || bPlayingLoopingFireAnim)
		{
			StopLoopingFireEffects(CurrentFireMode);
		}

		if (MuzzleFlash != none)
		{
			SetTimer(MuzzleFlash.MuzzleFlash.Duration, false, 'Timer_StopFireEffects');
		}
		else
		{
			SetTimer(0.3f, false, 'Timer_StopFireEffects');
		}

		ClearZedTimeResist();
        ClearPendingFire(CurrentFireMode);
		ClearTimer(nameof(RefireCheckTimer));

		NotifyWeaponFinishedFiring(CurrentFireMode);

		KFPawn(Instigator).bHasStartedFire = false;
		KFPawn(Instigator).bNetDirty = true;

		if (ChargingPSC != none)
		{
			ChargingPSC.DeactivateSystem();
		}
    }
}

// Placing the actual Weapon Firing end state here since we need it to happen at the end of the actual firing loop.
simulated function Timer_StopFireEffects()
{
	// Simulate weapon firing effects on the local client
	if (WorldInfo.NetMode == NM_Client)
	{
		Instigator.WeaponStoppedFiring(self, false);
	}

	ClearFlashCount();
	ClearFlashLocation();
}

simulated function KFProjectile SpawnProjectile(class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir)
{
    local KFProj_BFG9000_Blast HuskBall;
    local int Charges;

    HuskBall = KFProj_BFG9000_Blast(super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir));

    //Calc and set scaling values
    if (HuskBall != none)
    {
        Charges = GetChargeLevel();
        HuskBall.DamageScale = 1.f + DmgIncreasePerCharge * Charges;
        HuskBall.AOEScale = 1.f + AOEIncreasePerCharge * Charges;
        HuskBall.IncapScale = 1.f + IncapIncreasePerCharge * Charges;

        return HuskBall;
    }

    return none;
}

simulated function CauseMuzzleFlash(byte FireModeNum)
{
	if (MuzzleFlash == None)
	{
		AttachMuzzleFlash();
	}

	if (MuzzleFlash != none)
	{
		switch (GetChargeFXLevel())
		{
		case 1:
			MuzzleFlash.MuzzleFlash.ParticleSystemTemplate = MuzzleFlashEffectL1;
			MuzzleFlash.MuzzleFlash.PSC.SetTemplate(MuzzleFlashEffectL1);
			break;
		case 2:
			MuzzleFlash.MuzzleFlash.ParticleSystemTemplate = MuzzleFlashEffectL2;
			MuzzleFlash.MuzzleFlash.PSC.SetTemplate(MuzzleFlashEffectL2);
			break;
		case 3:
			MuzzleFlash.MuzzleFlash.ParticleSystemTemplate = MuzzleFlashEffectL3;
			MuzzleFlash.MuzzleFlash.PSC.SetTemplate(MuzzleFlashEffectL3);
			break;
		}
	}

	super.CauseMuzzleFlash(FireModeNum);
}

simulated function int GetChargeLevel()
{
	return Min(ChargeTime / ValueIncreaseTime, MaxChargeLevel);
}

// Should generally match up with KFWeapAttach_HuskCannon::GetChargeFXLevel
simulated function int GetChargeFXLevel()
{
	local int ChargeLevel;

	ChargeLevel = GetChargeLevel();
	if (ChargeLevel < 1)
	{
		return 1;
	}
	else if (ChargeLevel < MaxChargeLevel)
	{
		return 2;
	}
	else
	{
		return 3;
	}
}

function AdjustDamage(out int InDamage, class<DamageType> DamageType, Actor DamageCauser)
{
	super.AdjustDamage(InDamage, DamageType, DamageCauser);

	if (Instigator != none && DamageCauser != none && DamageCauser.Instigator == Instigator ) //self
	{
		InDamage *= SelfDamageReductionValue;
	}
}

defaultproperties
{
	SelfDamageReductionValue=0.07f
    //Gameplay Props
    MaxChargeTime=2.97
    ValueIncreaseTime=0.27
    DmgIncreasePerCharge=2.7
    AOEIncreasePerCharge=0.9
    IncapIncreasePerCharge=0.22
    AmmoIncreasePerCharge=1

	// Shooting Animations
	FireSightedAnims[0]=Shoot
	FireSightedAnims[1]=Shoot_Heavy_Iron
	FireLoopSightedAnim=ShootLoop_Iron
    FireLoopEndAnim=ShootLoop_End
	FireLoopEndSightedAnim=ShootLoop_Iron_End

    // FOV
    Meshfov=80
	MeshIronSightFOV=65 //52
    PlayerIronSightFOV=50 //80

	// Depth of field
	DOF_FG_FocalRadius=150
	DOF_FG_MaxNearBlurSize=1

	PackageKey="BFG9000"
	FirstPersonMeshName="'WEP_1P_BFG9000_MESH.Wep_1stP_BFG9000_Rig'"
	FirstPersonAnimSetNames(0)="'WEP_1P_HuskCannon_ANIM.Wep_1stP_HuskCannon_Anim'"
	PickupMeshName="'WEP_3P_BFG9000_MESH.Wep_3rdP_BFG9000_Pickup'"
	AttachmentArchetypeName="'WEP_BFG9000_ARCH.Wep_BFG9000_3P'"
	MuzzleFlashTemplateName="'WEP_BFG9000_ARCH.Wep_BFG9000_MuzzleFlash'"

   	// Zooming/Position
	PlayerViewOffset=(X=20.0,Y=12,Z=-1)
	IronSightPosition=(X=0,Y=0,Z=0)

	// Ammo
	MagazineCapacity[0]=30  //25
	SpareAmmoCapacity[0]=60 //300
	InitialSpareMags[0]=1
	AmmoPickupScale[0]=0.5
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=150
	minRecoilPitch=115
	maxRecoilYaw=115
	minRecoilYaw=-115
	RecoilRate=0.085
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	RecoilViewRotationScale=0.25
	IronSightMeshFOVCompensationScale=1.5
    HippedRecoilModifier=1.5

    // Inventory
	InventorySize=12
	GroupPriority=190
	WeaponSelectTexture=Texture2D'WEP_UI_BFG9000_TEX.UI_WeaponSelect_BFG9000' //@TODO: Replace me

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Grenade' //@TODO: Replace me
	FiringStatesArray(DEFAULT_FIREMODE)=HuskCannonCharge

	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	Spread(DEFAULT_FIREMODE) = 0.0085
    WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_BFG9000_Blast'
	FireInterval(DEFAULT_FIREMODE)=+0.3 //0.15 850 RPM //0.19
	FireOffset=(X=30,Y=4.5,Z=-5)

	WeaponFireTypes(ALTFIRE_FIREMODE) = EWFT_None

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_HuskCannon'
	InstantHitDamage(BASH_FIREMODE)=35

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Husk_Cannon.Play_WEP_Husk_Cannon_3P_Start', FirstPersonCue=AkEvent'WW_WEP_Husk_Cannon.Play_WEP_Husk_Cannon_1P_Start')
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Husk_Cannon.Play_WEP_Husk_Cannon_3P_Fire', FirstPersonCue=AkEvent'WW_WEP_Husk_Cannon.Play_WEP_Husk_Cannon_1P_Fire')
	FullyChargedSound=(DefaultCue = AkEvent'WW_WEP_Husk_Cannon.Play_WEP_Husk_Cannon_Charged_3P', FirstPersonCue=AkEvent'WW_WEP_Husk_Cannon.Play_WEP_Husk_Cannon_Charged')

	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Handling_DryFire' //@TODO: Replace me
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Handling_DryFire' //@TODO: Replace me

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	SingleFireSoundIndex=FIREMODE_NONE
	bLoopingFireAnim(ALTFIRE_FIREMODE)=false
	bLoopingFireSnd(ALTFIRE_FIREMODE)=false
	Spread(ALTFIRE_FIREMODE) = 0.0085

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

   	AssociatedPerkClasses(0)= class'KFPerk_Survivalist'
    AssociatedPerkClasses(1)= class'KFPerk_Demolitionist'

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Weak_Recoil'

	ChargingEffect=ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_Charging_01'
	ChargedEffect=ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_Charged_01'

	MuzzleFlashEffectL1=ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_MuzzleFlash_L1_1P'
	MuzzleFlashEffectL2=ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_MuzzleFlash_L2_1P'
	MuzzleFlashEffectL3=ParticleSystem'WEP_BFG9000_EMIT.FX_Huskcannon_MuzzleFlash_L3_1P'

	FullChargedTimerInterval=2.0f

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=0)))
}