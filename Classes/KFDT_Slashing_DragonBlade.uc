//=============================================================================
// KFDT_Slashing_Zweihander
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_DragonBlade extends KFDT_Slashing
	abstract
	hidedropdown;

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
	return true;
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
	 	if( InHitZoneName == 'chest' || InHitZoneName == 'abdomen'  || InHitZoneName == 'stomach' )
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

/** Allows the damage type to modify the impulse when a specified hit zone is dismembered */
static simulated function ModifyDismembermentHitImpulse(KFPawn_Monster InPawn, name InHitZoneName, vector HitDirection,
												out vector OutImpulseDir, out vector OutParentImpulseDir,
												out float OutImpulseScale, out float OutParentImpulseScale)
{
	local EPawnOctant SlashDir;

	SlashDir = GetLastSlashDirection(InPawn, HitDirection);

    // Apply upward impulse on decapitation from a clean horizontal slash
	if( InHitZoneName == 'head' &&
		( SlashDir == DIR_Left || SlashDir == DIR_Right ) )
	{
		OutImpulseDir += 10*vect(0,0,1);
		OutImpulseDir = Normal(OutImpulseDir);
		OutParentImpulseScale = 0.f;
	}
	// Do not apply any impulse on split in half from a vertical slash
	else if( (InHitZoneName == 'head' || InHitZoneName == 'chest' ) &&
			 ( SlashDir == DIR_Forward || SlashDir == DIR_Backward) )
	{
		OutImpulseScale = 0.f;
		OutParentImpulseScale = 0.f;
	}
}

defaultproperties
{
	KDamageImpulse=1600
	KDeathUpKick=200
	KDeathVel=375

	KnockdownPower=0
	StunPower=0
	StumblePower=300
	MeleeHitPower=120

	WeaponDef=class'WeaponPack.KFWeapDef_DragonBlade'
	ModifierPerkList(0)=class'KFPerk_Berserker'
}
