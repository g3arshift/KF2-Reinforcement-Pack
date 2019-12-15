class KFWeap_AmmoBox extends KFWeap_ThrownBase;

simulated state WeaponPuttingDown
{
	ignores SetIronSights;
}

static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Explosive;
}

simulated state WeaponEquipping
{
	simulated event BeginState( name PreviousStateName )
	{
		super.BeginState( PreviousStateName );

		// perform a "reload" if we refilled our ammo from empty while it was unequipped
		if( !HasAmmo(THROW_FIREMODE) && HasSpareAmmo() )
		{
			PerformArtificialReload();
		}
	}
}

simulated state WeaponThrowing
{
	/** Never refires.  Must re-enter this state instead. */
	simulated function bool ShouldRefire()
	{
		return false;
	}
}

static simulated event bool UsesAmmo()
{
    return true;
}

// do nothing, as we have no alt fire mode
simulated function AltFireMode();

simulated state Active
{
	/** Overridden to prevent playing fidget if play has no more ammo */
	simulated function bool CanPlayIdleFidget(optional bool bOnReload)
	{
		if( !HasAmmo(0) )
		{
			return false;
		}

		return super.CanPlayIdleFidget( bOnReload );
	}
}

simulated function Projectile ProjectileFire()
{
	local vector		StartTrace, X, Y, Z;
	local vector	POVLoc, TossVel;
	local rotator	POVRot;
	local MyKFPickupFactory_Ammo MPF;
	
	if ( ShouldIncrementFlashCountOnFire() )
	{
		IncrementFlashCount();
	}
	
	if( Role == ROLE_Authority )
	{		
		Instigator.GetAxes(Instigator.Rotation, X, Y, Z);
		StartTrace = Instigator.Location + 2.8 * Instigator.CylinderComponent.CollisionRadius * X - 0.5 * Instigator.CylinderComponent.CollisionRadius * Y;
		StartTrace.Z += Instigator.BaseEyeHeight / 2;
		
		MPF = Spawn(class'MyKFPickupFactory_Ammo',,, StartTrace,,,true); //Spawn(class'MyKFPickupFactory_Ammo', RealStartLoc, AimDir);

		if(MPF!=None)
		{
			Instigator.GetActorEyesViewPoint(POVLoc, POVRot);
			TossVel = Vector(POVRot);
			TossVel = TossVel * ((Instigator.Velocity Dot TossVel) + 500) + Vect(0,0,200);
			MPF.SetTimer( 0.5, false, nameof(MPF.Reset) );
			MPF.Velocity = TossVel;
			MPF.MyOwner=Instigator;
		}
	}

	return None;
}

defaultproperties
{ 	
	WeaponSelectTexture=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	
	PackageKey="Ammobox"
	PickupMeshName="'WEP_3P_AMMOBOX_MESH.rig.Static'"
	AttachmentArchetypeName="'WEP_AMMOBOX_ARCH.Wep_AmmoBox_3P'"
	
	MagazineCapacity[0]=1
	//MAX AMMO
	SpareAmmoCapacity[0]=100
	InitialSpareMags[0]=10
	AmmoPickupScale[0]=1.0
	
	//timings from C4
	FireInterval(THROW_FIREMODE)=0.25
	FireModeIconPaths(THROW_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Grenade'
	WeaponProjectiles(THROW_FIREMODE)=class'KFProj_Thrown_C4'
	
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_C4'
	InstantHitDamage(BASH_FIREMODE)=30
	
	// Inventory
	InventorySize=3
	GroupPriority=21
	bCanThrow=true
	bDropOnDeath=true
	InventoryGroup=IG_Primary
	
   	AssociatedPerkClasses(0)=class'KFPerk_Support'
}