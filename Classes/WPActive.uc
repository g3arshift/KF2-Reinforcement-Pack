Class WPActive extends KFMutator
	config(Dont_Ever_Think_About_It_If_You_Can_Read_This);

var config array<string> CustomItems;

var array<FCustomTraderItem> CustomItemList;
var KFGFxObject_TraderItems CustomTrader;

function PostBeginPlay()
{
	local int i;
	local FCustomTraderItem CI;	

	Super.PostBeginPlay();
	
	if( WorldInfo.Game.BaseMutator==None )
		WorldInfo.Game.BaseMutator = Self;
	else WorldInfo.Game.BaseMutator.AddMutator(Self);
	
	if( bDeleteMe ) // This was a duplicate instance of the mutator.
		return;
	
	WorldInfo.Game.PlayerReplicationInfoClass = class'CTPlayerReplicationInfo';	
	
	KFGameReplicationInfo(WorldInfo.GRI).TraderItems=class'CTPlayerReplicationInfo'.Default.MyTraderItems;	

	//we use solid archetype but I keep it just for debug
	for( i=0; i<CustomItems.Length; ++i )
	{
		CI.WeaponDef = class<KFWeaponDefinition>(DynamicLoadObject(CustomItems[i],class'Class'));
		if( CI.WeaponDef==None )
		{
			`log("FAILED TO LOAD CUSTOM WEAPON"@CustomItems[i]);
			continue;
		}
		
		CI.WeaponClass = class<KFWeapon>(DynamicLoadObject(CI.WeaponDef.Default.WeaponClassPath,class'Class'));
		if( CI.WeaponClass==None )
		{
			`log("FAILED TO LOAD CUSTOM WEAPON"@CustomItems[i]);
			continue;
		}
			
		`log("SUCCESSED TO LOAD CUSTOM WEAPON"@CustomItems[i]);
		
		CustomItemList.AddItem(CI);
	}
}
	
function AddMutator(Mutator M)
{
	if( M!=Self ) // Make sure we don't get added twice.
	{
		if( M.Class==Class )
			M.Destroy();
		else Super.AddMutator(M);
	}
}
defaultproperties
{
	// nothing
}