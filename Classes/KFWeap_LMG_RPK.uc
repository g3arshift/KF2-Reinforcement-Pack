//=============================================================================
// KFWeap_AssaultRifle_AK12
//=============================================================================
// An AK12 Assault Rifle
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_LMG_RPK extends KFWeap_RifleBase;

/** RecoilRate when firing in burst fire. */
var(Recoil) float BurstFireRecoilRate;
/** How much to scale recoil when firing in burst fire. */
var(Recoil) float BurstFireRecoilModifier;

// Standard
/** Animation to play when the weapon is fired  in burst mode with 2 rounds left */
var(Animations) const editconst	name	BurstFire2RdAnim;
/** Animation to play when the weapon is fired in burst fire mode for 3 rounds*/
var(Animations) const editconst	name	BurstFire3RdAnim;

// Iron Sights
/** Animation to play when the weapon is fired in burst mode with 2 rounds left */
var(Animations) const editconst	name	BurstFire2RdSightedAnim;
/** Animation to play when the weapon is fired in burst fire mode for 3 rounds*/
var(Animations) const editconst	name	BurstFire3RdSightedAnim;

/** Sound to play when the weapon is fired in burst mode with 2 rounds left  */
var(Sounds)	WeaponFireSndInfo	WeaponFire2RdSnd;
/** Sound to play when the weapon is fired in burst fire mode for 3 rounds */
var(Sounds)	WeaponFireSndInfo	WeaponFire3RdSnd;
/** Keeps track of whether or not the gun has played fire effects this burst. */
var bool bBurstPlayedFireEffects;

/*********************************************************************************************
 * State WeaponBurstFiring
 * Fires a burst of bullets. Fire must be released between every shot.
 *********************************************************************************************/

simulated state WeaponBurstFiring
{
	simulated function BeginState(Name PrevStateName)
	{
		// Modify the recoil for burst fire
		RecoilRate=BurstFireRecoilRate;

		// Initialize recoil blend out settings
		if( RecoilRate > 0 && RecoilBlendOutRatio > 0 )
		{
			RecoilYawBlendOutRate = maxRecoilYaw/RecoilRate * RecoilBlendOutRatio;
			RecoilPitchBlendOutRate = maxRecoilPitch/RecoilRate * RecoilBlendOutRatio;
		}

		bBurstPlayedFireEffects = false;

		super.BeginState(PrevStateName);
	}


	/**
	 * PlayFireEffects Is the root function that handles all of the effects associated with
	 * a weapon.  This function creates the 1st person effects.  It should only be called
	 * on a locally controlled player.
	 */
	simulated function PlayFireEffects( byte FireModeNum, optional vector HitLocation )
	{
		local name WeaponFireAnimName;

		// Only play the burst fire sound on the first shot as the sound includes additional shot sounds baked in
		if( FireModeNum != ALTFIRE_FIREMODE || (FireModeNum == ALTFIRE_FIREMODE &&
			(!bBurstPlayedFireEffects || `IsInZedTime(self))) )
		{
			PlayFiringSound(CurrentFireMode);
		}

		if( Instigator != none )
		{
			UpdateWeaponAttachmentAnimRate( GetThirdPersonAnimRate() );

			if( Instigator.IsFirstPerson() )
			{
				if ( !bPlayingLoopingFireAnim && (FireModeNum != ALTFIRE_FIREMODE || (FireModeNum == ALTFIRE_FIREMODE &&
					!bBurstPlayedFireEffects)) )
				{
					WeaponFireAnimName = GetWeaponFireAnim(FireModeNum);

					if ( WeaponFireAnimName != '' )
					{
						PlayAnimation(WeaponFireAnimName, MySkelMesh.GetAnimLength(WeaponFireAnimName),,FireTweenTime);
					}
				}

				HandleRecoil();

				ShakeView();

				// Start muzzle flash effect
				CauseMuzzleFlash(FireModeNum);
			}
		}

		bBurstPlayedFireEffects = true;
	}

	/** Overridden to include the BurstFireModifier*/
	simulated function ModifyRecoil( out float CurrentRecoilModifier )
	{
		super.ModifyRecoil( CurrentRecoilModifier );
		CurrentRecoilModifier *= BurstFireRecoilModifier;
	}

	/** Get name of the animation to play for PlayFireEffects. Overriden to play the right animation for the number of shots in the burst fire */
	simulated function name GetWeaponFireAnim(byte FireModeNum)
	{
		if( BurstAmount == 3 )
		{
			if ( bUsingSights )
			{
				return BurstFire3RdSightedAnim;
			}
			return BurstFire3RdAnim;
		}
		else if( BurstAmount == 2 )
		{
			if ( bUsingSights )
			{
				return BurstFire2RdSightedAnim;
			}
			return BurstFire2RdAnim;
		}
		else
		{
			return super.GetWeaponFireAnim(FireModeNum);
		}
	}

	/**
	 * Tells the weapon to play a firing sound (uses CurrentFireMode)
	 */
	simulated function PlayFiringSound( byte FireModeNum )
	{
		if ( !bPlayingLoopingFireSnd && BurstAmount > 1 && `NotInZedTime(self) )
		{
			MakeNoise(1.0, 'PlayerFiring');
			if( BurstAmount == 3 )
			{
				WeaponPlayFireSound(WeaponFire3RdSnd.DefaultCue, WeaponFire3RdSnd.FirstPersonCue);
			}
			else if( BurstAmount == 2 )
			{
				WeaponPlayFireSound(WeaponFire2RdSnd.DefaultCue, WeaponFire2RdSnd.FirstPersonCue);
			}
		}
		else
		{
			super.PlayFiringSound( FireModeNum );
		}
	}

	simulated event EndState( Name NextStateName )
	{
		// Set recoil settings back to normal
		RecoilRate=default.RecoilRate;

		// Initialize recoil blend out settings
		if( RecoilRate > 0 && RecoilBlendOutRatio > 0 )
		{
			RecoilYawBlendOutRate = maxRecoilYaw/RecoilRate * RecoilBlendOutRatio;
			RecoilPitchBlendOutRate = maxRecoilPitch/RecoilRate * RecoilBlendOutRatio;
		}

		Super.EndState(NextStateName);
	}
}

defaultproperties
{
	// FOV
	MeshFOV=75
	MeshIronSightFOV=23
	PlayerIronSightFOV=70

	// Depth of field
	DOF_FG_FocalRadius=50
	DOF_FG_SharpRadius=0
	DOF_FG_MinBlurSize=0
	DOF_FG_MaxNearBlurSize=3
	DOF_FG_ExpFalloff=1

	// Zooming/Position
	PlayerViewOffset=(X=4,Y=10,Z=-3)
	IronSightPosition=(X=3,Y=-0.2,Z=0.9)

	// Content
	PackageKey="RPK"
	FirstPersonMeshName="WEP_RPK_MESH.Wep_1stP_RPK_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_AK12_ANIM.Wep_1st_AK12_Anim"
	PickupMeshName="WEP_RPK_MESH.Wep_RPK_Pickup"
	AttachmentArchetypeName="WEP_RPK_ARCH.WEP_RPK_3P"
	MuzzleFlashTemplateName="WEP_AK12_ARCH.Wep_AK12_MuzzleFlash"

	// Ammo
	MagazineCapacity[0]=75
	SpareAmmoCapacity[0]=525
	InitialSpareMags[0]=2
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=280
	minRecoilPitch=190
	maxRecoilYaw=175
	minRecoilYaw=-125
	RecoilRate=0.09
	BurstFireRecoilRate=0.05
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	BurstFireRecoilModifier=0.8
	IronSightMeshFOVCompensationScale=2.5

	// Inventory / Grouping
	InventorySize=9
	GroupPriority=120
	WeaponSelectTexture=Texture2D'WEP_RPK_TEX.UI_RPK_TEX'

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	FireInterval(DEFAULT_FIREMODE)=+0.113 // 600 RPM
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_RPK'
	Spread(DEFAULT_FIREMODE)=0.0085
	PenetrationPower(DEFAULT_FIREMODE)=1.0
	InstantHitDamage(DEFAULT_FIREMODE)=60.0
	FireOffset=(X=32,Y=4.0,Z=-5)

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletBurst'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponBurstFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	FireInterval(ALTFIRE_FIREMODE)=+0.08 // 1000 RPM
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_RPK'
	InstantHitDamage(ALTFIRE_FIREMODE)=60.0
	PenetrationPower(ALTFIRE_FIREMODE)=1.0
	Spread(ALTFIRE_FIREMODE)=0.0085
	BurstAmount=3
	BurstFire2RdAnim=Shoot_Burst2
	BurstFire3RdAnim=Shoot_Burst
	BurstFire2RdSightedAnim=Shoot_Burst2_Iron
	BurstFire3RdSightedAnim=Shoot_Burst_Iron
	WeaponFire2RdSnd=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_2RdBurst_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_2RdBurst_S')
	WeaponFire3RdSnd=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Burst_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Burst_S')


	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_RPK'
	InstantHitDamage(BASH_FIREMODE)=35

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_S')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Single_S')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'


	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_End_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_End_S')
	SingleFireSoundIndex=ALTFIRE_FIREMODE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	AssociatedPerkClasses(0)=class'KFPerk_Commando'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.3f), (Stat=EWUS_Damage1, Scale=1.3f), (Stat=EWUS_Weight, Add=0)))
}



