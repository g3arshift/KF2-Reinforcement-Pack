//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson is original author of this code
//=============================================================================

class KFDT_Slashing_BuzzSawProj extends KFDT_Slashing
	abstract
	hidedropdown;

`define COSINE_0_DEGREES   1
`define COSINE_20_DEGREES  0.94
`define COSINE_70_DEGREES  0.34
`define COSINE_90_DEGREES  0

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
	return true;
}

/** @return The slast type from the HitFxInfo. This returns a 8-way slash info. */
static simulated function EPawnOctant GetLastSlashDirection(KFPawn_Monster InPawn, vector HitDirection)
{
	local vector SlashPlaneNormal;
	local rotator InstigatorRotation;
	local vector InstigatorFaceDir, InstigatorRightDir;
	local float UpDotSlash, RightDotSlash, UpThresholdValue;

	if( InPawn != none )
	{
		HitDirection = Normal(HitDirection);
		InstigatorRotation = InPawn.GetBaseAimRotation();
		InstigatorFaceDir = GetRotatorAxis(InstigatorRotation, 0);
		InstigatorRightDir = GetRotatorAxis(InstigatorRotation, 1);

		// Cross the face direction of the instigator with the hit direction to find
		// the normal to the "slashing" plane
		SlashPlaneNormal = Normal(InstigatorFaceDir Cross HitDirection);

		// Dot the slash plane normal with the world up direction to figure out
		// the quadrant for the normal of the slash plane
		UpDotSlash = vect(0,0,1) Dot SlashPlaneNormal;
		UpThresholdValue = Abs(UpDotSlash);

		// Dot the slash plane normal with the instigator right to figure out
		// the direction of the slash
		RightDotSlash = InstigatorRightDir Dot SlashPlaneNormal;

		// Threshhold against the preset values to find out the type of slash. The sign (+ or -) of the
		// dot products are used to further classify the direction of the slash
		if( UpThresholdValue <= `COSINE_0_DEGREES && UpThresholdValue >= `COSINE_20_DEGREES )
		{
			if( UpDotSlash > 0 )
				return DIR_Right;
			else
				return DIR_Left;
		}
		else if( UpThresholdValue <= `COSINE_20_DEGREES && UpThresholdValue >= `COSINE_70_DEGREES )
		{
			if( UpDotSlash < 0 && RightDotSlash > 0 )
				return DIR_ForwardLeft;
			else if( UpDotSlash > 0 && RightDotSlash > 0 )
				return DIR_ForwardRight;
			else if( UpDotSlash > 0 && RightDotSlash < 0 )
				return DIR_BackwardRight;
			else if( UpDotSlash < 0 && RightDotSlash < 0 )
				return DIR_BackwardLeft;
		}
		else if( UpThresholdValue <= `COSINE_70_DEGREES && UpThresholdValue >= `COSINE_90_DEGREES )
		{
			if( RightDotSlash > 0 )
				return DIR_Forward;
			else
				return DIR_Backward;
		}
	}

	return DIR_None;
}

/** Allows the damage type to map a hit zone to a different bone for dismemberment purposes */
static simulated function GetBoneToDismember(KFPawn_Monster InPawn, vector HitDirection, name InHitZoneName, out name OutBoneName)
{
	local EPawnOctant SlashDir;
	local KFCharacterInfo_Monster MonsterInfo;

	MonsterInfo = InPawn.GetCharacterMonsterInfo();
    if ( MonsterInfo == none )
	{
		return;
	}

	SlashDir = GetLastSlashDirection(InPawn, HitDirection);

	if( SlashDir == DIR_Forward || SlashDir == DIR_Backward )
	{
		if( InHitZoneName == 'chest' || InHitZoneName == 'head' )
		{
			if( MonsterInfo.SpecialMeleeDismemberment.bAllowVerticalSplit )
			{
				// Randomly pick the left or right shoulder bone and split the guy in half vertically
				OutBoneName = Rand(2) == 0
							? MonsterInfo.SpecialMeleeDismemberment.LeftShoulderBoneName
							: MonsterInfo.SpecialMeleeDismemberment.RightShoulderBoneName;
			}
		}
	}
	else if( SlashDir == DIR_Left || SlashDir == DIR_Right )
	{
	 	if( InHitZoneName == 'chest' || InHitZoneName == 'abdomen' || InHitZoneName == 'stomach')
	 	{
	 		if( MonsterInfo.SpecialMeleeDismemberment.bAllowHorizontalSplit )
			{
	 			// Split the guy in half horizontally
				OutBoneName = MonsterInfo.SpecialMeleeDismemberment.SpineBoneName;
			}
		}
	}
	else if( SlashDir == DIR_ForwardLeft || SlashDir == DIR_BackwardRight )
	{
		if( InHitZoneName == 'chest' )
		{
			if( MonsterInfo.SpecialMeleeDismemberment.bAllowVerticalSplit )
			{
				OutBoneName = MonsterInfo.SpecialMeleeDismemberment.RightShoulderBoneName;
			}
		}
		else if( InHitZoneName == 'head' )
		{
			if( MonsterInfo.SpecialMeleeDismemberment.bAllowVerticalSplit )
			{
				// Use a random chance to decide whether to dismember the head or the shoulder constraints
				if( Rand(2) == 0 )
				{
					// ... and choose one of the shoulder constraints at random
					OutBoneName = MonsterInfo.SpecialMeleeDismemberment.RightShoulderBoneName;
				}
			}
		}
	}
	else if( SlashDir == DIR_ForwardRight || SlashDir == DIR_BackwardLeft )
	{
		if( InHitZoneName == 'chest' )
		{
			if( MonsterInfo.SpecialMeleeDismemberment.bAllowVerticalSplit )
			{
				OutBoneName = MonsterInfo.SpecialMeleeDismemberment.LeftShoulderBoneName;
			}
		}
		else if( InHitZoneName == 'head' )
		{
			if( MonsterInfo.SpecialMeleeDismemberment.bAllowVerticalSplit )
			{
				// Use a random chance to decide whether to dismember the head or the shoulder constraints
				if( Rand(2) == 0 )
				{
					OutBoneName = MonsterInfo.SpecialMeleeDismemberment.LeftShoulderBoneName;
				}
			}
		}
	}
}

defaultproperties
{
	EffectGroup=FXG_Sawblade
	KDamageImpulse=1200
	KDeathUpKick=820
	KDeathVel=135

	// Instigator damage can happen on owning client when projectile hits before Instigator is replicated and 
	// (Other != Instigator) == FALSE.  This problem is specific to the eviscerator projectile since it's a
	// replicated CSHD weapon, but it might make sense to have bNoInstigatorDamage=true on more weapons.
	bNoInstigatorDamage=true

	StunPower=10
	StumblePower=120
    GunHitPower=0
	MeleeHitPower=100

	WeaponDef=class'KFWeapDef_Buzzsaw'

	ModifierPerkList(0)=class'KFPerk_Berserker'
}
