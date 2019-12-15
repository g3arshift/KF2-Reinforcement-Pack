class MyKFPickupFactory_Ammo extends KFPickupFactory_Ammo;


var Pawn MyOwner;


//no connects with global map ammo
simulated function InitializePickup();

function PickedUpBy(Pawn P)
{
	Destroy();
}

//auto state Pickup
//{
	//owner can't grab oewn ammo cause it make no sence
	//function bool ValidTouch( Pawn Other )
	//{		
		///DISABLED FOR OWNER
		//if(Other==MyOwner)
			//return false;
		///
	
		//if (Other == None || !Other.bCanPickupInventory)
		//{
			//return false;
		//}
		//else if (Other.Controller == None)
		//{
			//SetTimer( 0.2, false, nameof(RecheckValidTouch) );
			//return false;
		//}		
		//else if ( !FastTrace(Other.Location, Location) )
		//{
			//SetTimer( 0.5, false, nameof(RecheckValidTouch) );
			//return false;
		//}
	
		//if (WorldInfo.Game.PickupQuery(Other, InventoryType, self))
		//{
			//return true;
		//}
		//return false;
	//}
//}

defaultproperties
{

	Begin Object Name=StaticMeshComponent0
		// YOUR MESH HERE (AMMO DROP MESH)
		StaticMesh(0)=StaticMesh'WEP_3P_AMMOBOX_MESH.rig.Static'
		Materials(0)=MaterialInstanceConstant'WEP_3P_AMMOBOX_TEX.txr.test_MIC'
		Materials(1)=MaterialInstanceConstant'WEP_3P_AMMOBOX_TEX.txr.test_MIC'
		Scale=2.0f
		bCastDynamicShadow=FALSE
		CollideActors=FALSE
	End Object
	PickupMesh=StaticMeshComponent0
	Components.Add(StaticMeshComponent0)
	
	//allow to spawn at runtime
	bNoDelete=false
	
	//we can be dropped!
	bMovable=true
	bCollideWorld=true;
	Physics=PHYS_Walking
}
