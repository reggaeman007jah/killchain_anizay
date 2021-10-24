// --- create enemy camp items --- //

/*
CargoNet_01_barrels_F
CargoNet_01_box_F
I_CargoNet_01_ammo_F
B_CargoNet_01_ammo_F
FlexibleTank_01_sand_F
FlexibleTank_01_forest_F
Land_SharpStone_02
Land_W_sharpStone_02
Land_BluntStone_02
Land_LavaStone_small_F
Land_BluntStone_01
Land_Limestone_01_01_F
Land_Wreck_Skodovka_F
Land_Wreck_Truck_F
Land_Wreck_Ural_F
Land_Wreck_T72_hull_F
Land_Wreck_Heli_Attack_02_F
*/

_objPos = _this select 0; // anchor point for patrol obj 

// --- new camp location and items --- //
_randomCampLocation = _objPos findEmptyPosition [1,500,"B_Quadbike_01_F"];
RGG_CampItems = [];
_random5 = random 5;
_random3 = random 3;

// --- create barrels and other camp stuff --- //

// main loot box - action - randmoise this 
[_randomCampLocation] execVM "killchain\systems\spawnerSystems\createLootBox.sqf";

for "_i" from 1 to 8 do {
	_randomDir = random 359;
	_random25 = random 50;
	_spawnPos = _randomCampLocation getPos [_random3, _randomDir];
	_campItem = selectRandom [
		"CargoNet_01_barrels_F",
		"CargoNet_01_box_F",
		"FlexibleTank_01_sand_F",
		"FlexibleTank_01_forest_F",
		"Land_SharpStone_02",
		"Land_W_sharpStone_02",
		"Land_BluntStone_02",
		"Land_LavaStone_small_F",
		"Land_BluntStone_01",
		"Land_Limestone_01_01_F",
		"Land_Wreck_Skodovka_F",
		"Land_Wreck_Truck_F",
		"Land_Wreck_Ural_F",
		"Land_Wreck_T72_hull_F"
	];
	_campItem2 = createVehicle [_campItem, _spawnPos]; 
	_campItem2 setDir _randomDir;
	RGG_CampItems pushback _campItem2;
	sleep 0.5;
};
// ACTION - change above items to modern items 

// --- create crates --- //
for "_i" from 1 to _random5 do {
	_randomDir = random 359;
	_random5 = random 5;
	_random25 = random 25;
	_spawnPos = _randomCampLocation getPos [_random5, _randomDir];
	_campItem = selectRandom [
		"Land_WoodenCrate_01_stack_x3_F",
		"Weapon_launch_O_Vorona_brown_F",
		"Box_T_East_Wps_F",
		"Land_CratesWooden_F",
		"Land_Pallet_MilBoxes_F",
		"Land_MetalBarrel_F",
		"Land_WaterTank_F"
	];
	_campItem2 = createVehicle [_campItem, _spawnPos];
	_campItem2 setDir _randomDir;
	RGG_CampItems pushback _campItem2;
	sleep 0.5;
};

// [_RGG_CampItems] execVM "killchain\systems\cleanUpSystems\deleteCampItems.sqf";
// how to delete?? 

// intel item 
// _randomDir = random 359;
// _random5 = random 5;
// _random25 = random 25;
// _spawnPos = _randomCampLocation getPos [_random5, _randomDir];
// _campItem = createVehicle ["SatelliteAntenna_01_Sand_F", _spawnPos];
// _campItem setDir _randomDir;
// _RGG_CampItems pushback _campItem;
/*
Taking this out until I can work out how to best manage ammo destroy actions to make that action critical to progression 
[_campItem] execVM "killchain\systems\intelSystems\enemyIntel.sqf";
*/

