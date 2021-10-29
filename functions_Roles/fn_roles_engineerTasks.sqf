/*
Demo / engineer related side mission - destroy AA or will eventually be manned 

LOP_AFR_OPF_Static_ZU23

this should run every patrol objective phase - once per objective 
it will create two AA half way between origin and obj - roughly 
spawn them empty and place in array - we need to keep an eye on these and send operators to them if left undestroyed, and if no players are near 
also spawn other bits around them 

and/or gen a repair order for C_IDAP_Truck_02_F - damaged ofc 

LOP_AFR_OPF_Static_ZU23
Land_PlasticCase_01_large_F
Land_WaterBarrel_F
Land_WoodenCrate_01_stack_x3_F
Land_WoodenCrate_01_F
Land_Pallet_MilBoxes_F

use AA opfor marekrs or repair indi markers 

*/


/*
this will be called once on every patrol cycle, and use origin and dest to calc good locations 


*/

params ["_initStartPos", "_objPos"];


_eng = [];
{
	_playerRole = roleDescription _x;
	if ((_playerRole == "Viking 2:6 - Combat Engineer@Viking 2") or (_playerRole == "Viking 3:6 - Combat Engineer@Viking 3")) then {
		_eng pushBack _x;
		systemChat format ["Engineer player selected for tasking: %1", _x];
	};
} forEach allPlayers;
_target = selectRandom _eng;

// manage where there is no AT 
_cnt = count _eng;
if (_cnt == 0) exitWith {
	systemChat "NO ENGINEER PLAYERS - NO AT HUNTS TODAY";
};

// we should not see the following if no engineers are in mission - confirm this 

for "_i" from 0 to 1 do {

	// generate location for task 
	// get mid point between two params 
	_dist = _initStartPos distance _objPos;
	systemChat format ["_Dist: %1", _dist];
	_half = _dist / 2;
	systemChat format ["_half: %1", _half];
	_dir = _initStartPos getDir _objPos;
	systemChat format ["_dir: %1", _dir];
	_anchor = _initStartPos getPos [_half, _dir];

	_anchor2 = _anchor getPos [(random 100) + 100, (random 359)];
	_spawnPos = [_anchor2, 10, 150, 3, 0, 0.2, 0, 150] call RGGf_fnc_find_locationNoPlayers;

	// decide if AA or Truck task 
	_tsk = selectRandom [1,2];
	_destroyAA = false;
	_repairTruck = false;

	switch (_tsk) do {
		case 1: { systemChat "Engineer Task 1 Selected - Destroy AA"; _destroyAA = true; };
		// case 2: { systemChat "Engineer Task 2 Selected - Repair IDAP Truck"; _repairTruck = true; };
		default { systemChat "Engineer Mission Error" };
	};

	if (_destroyAA) then {
		_classList = [
			"LOP_AFR_OPF_Static_ZU23"
		];
		_class = selectRandom _classList;

		_AA_Item = createVehicle [_class, _spawnPos]; 
		_AA_Item setDir (random 350);
		RGG_itemsAA pushback _AA_Item;

		// generate a position suitable - can this be done inside a compound?
		_mkrName = str _spawnPos;
		_mkr = createMarker ["_mkrName", _spawnPos];
		_mkr setMarkerType "o_antiair";
		// generate side assets 
		// tbc 
		_checking = true;
		while {_checking} do {
			if ((!alive _AA_Item)) then {
				deleteMarker "_mkrName";
				_checking = false;
				["Enemy AA Destroyed"] remoteExec ["RGGi_fnc_information_lowerRight", 0]; 
				RGG_destroyedAA = RGG_destroyedAA + 1;
				publicVariable "RGG_destroyedAA";
			};
			sleep 20;
		};
		// run checker - actually only run checker at beginning of phase 

	};

	if (_repairTruck) then {
		_classList = [
			"C_IDAP_Truck_02_F"
		];
		_class = selectRandom _classList;

		// generate a position suitable 

		// generate driver 

	};











	// _opforVic = [[2095.9,2077.84,0], 0, _class, east] call BIS_fnc_spawnVehicle;

	// _techCargo = _opforVic select 1;
	// {
	// 	bluforZeus addCuratorEditableObjects [[_x], true];
	// 	systemChat format ["DEBUG / SPAWN - bluforZeus _x: %1", _x];
	// 	sleep 1;
	// } forEach _techCargo;
	// {
	// 	tinmanModule addCuratorEditableObjects [[_x], true];
	// 	systemChat format ["DEBUG / SPAWN - tinmanZeus _x: %1", _x];
	// 	sleep 1;
	// } forEach _techCargo;


	sleep 10;
};
		