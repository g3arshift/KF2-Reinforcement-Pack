class HealthpackKFPickupFactory_Ammo extends KFPickupFactory_Ammo;

var Pawn MyOwner;

//no connects with global map ammo
simulated function InitializePickup();

//It makes thee better
function GiveTo( Pawn P )
{
	local KFPawn_Human H;
	H=KFPawn_Human(P);
		
	if(H==None)
		return;
		
	//`log("PICKUP");
	
	//Heal health
	H.HealDamage(50, MyOwner.Controller, class'KFDT_Healing');
	//Repair armor
	H.Armor += Min(50, H.GetMaxArmor()-H.Armor);
	PickedUpBy(P);
}

auto state Pickup
{
	//Heal only for wounded ones
	function bool ValidTouch( Pawn Other )
	{
		local KFPawn_Human P;
		P=KFPawn_Human(Other);

		//Heal thyself?
		//if(Other==MyOwner)
		//	return false;		
			
		//`log("TOUCH");		
		
		//Health or Armor
		if(P!=None && (P.Health < P.HealthMax || P.GetMaxArmor()>P.Armor))
			return true;
			
		return false;
	}
}

//no re:respawn
function PickedUpBy(Pawn P)
{
	Destroy();
}

//this is not ammmo
function bool CurrentPickupIsAmmo();


defaultproperties
{
	//some custom sounds
	AmmoPickupSound=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Heal'

	Begin Object Name=StaticMeshComponent0
		// YOUR MESH HERE (AMMO DROP MESH)
		StaticMesh=StaticMesh'WEP_3P_CAREPACK_MESH.healthpak_SM'
		Materials(0)=MaterialInstanceConstant'WEP_3P_CAREPACK_MAT.GP_HealthpakNormal_MIC'
		Scale=6.0f
	End Object
	PickupMesh=StaticMeshComponent0
	Components.Add(StaticMeshComponent0)
	
	//allow to spawn at runtime
	bNoDelete=false
		
	//we can be dropped!
	bMovable=true
	bCollideWorld=true;
	Physics=PHYS_Falling
}
