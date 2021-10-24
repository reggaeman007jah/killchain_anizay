/*
This will look for AT players and spawn in light armour 
it will then pass info to a hunting function 
this simply checks for AT players, and spawns APCs every x seconds 

rethink - we run this per cycle 
so when we are attacking, we spawn two of these 
when we are defending we spawn two of these 

note - this is run once on patrol start - a JIP AT player who joined after patrol started will not see this script  - is this still true given that it runs on every cycle?
*/

for "_i" from 0 to 2 do {

	_AT = [];
	{
		_playerRole = roleDescription _x;
		if ((_playerRole == "Viking 2:4 - AT Specialist@Viking 2") or (_playerRole == "Viking 3:4 - AT Specialist@Viking 3")) then {
			_AT pushBack _x;
			systemChat format ["AT player: %1", _x];
		};
	} forEach allPlayers;
	_target = selectRandom _AT;

	// manage where there is no AT 
	_cnt = count _AT;
	if (_cnt == 0) exitWith {
		systemChat "NO AT PLAYERS - NO AT HUNTS TODAY";
	};

	_classList = [
		"LOP_AFR_OPF_BTR60",
		"LOP_AFR_OPF_M113_W"
	];

	_class = selectRandom _classList;
	_opforVic = [[2095.9,2077.84,0], 0, _class, east] call BIS_fnc_spawnVehicle;

	_techCargo = _opforVic select 1;
	{
		bluforZeus addCuratorEditableObjects [[_x], true];
		systemChat format ["DEBUG / SPAWN - bluforZeus _x: %1", _x];
		sleep 1;
	} forEach _techCargo;
	{
		tinmanModule addCuratorEditableObjects [[_x], true];
		systemChat format ["DEBUG / SPAWN - tinmanZeus _x: %1", _x];
		sleep 1;
	} forEach _techCargo;

	[_opforVic, _target, "FULL", 120] spawn RGGo_fnc_order_hunt;

	sleep 120;
};
			
	
	























// old system that failed to count live vics 
// while {KILLCHAINISLIVE} do {
	 
// 	// decide whether to spawn in more armour 
// 	_cnt1 = {typeOf _x == "LOP_AFR_OPF_BTR60"} count vehicles;
// 	_cnt2 = {typeOf _x == "LOP_AFR_OPF_M113_W"} count vehicles;
// 	_total = _cnt1 + _cnt2;

// 	if (_total < 3) then {
			
// 		// look for players who are designated AT
// 		_AT = [];

// 		{
// 			_playerRole = roleDescription _x;
// 			if ((_playerRole == "Viking 2:4 - AT Specialist@Viking 2") or (_playerRole == "Viking 3:4 - AT Specialist@Viking 3")) then {
// 				_AT pushBack _x;
// 				systemChat format ["AT player: %1", _x];
// 			};
// 		} forEach allPlayers;

// 		_target = selectRandom _AT;

// 		_classList = [
// 			"LOP_AFR_OPF_BTR60",
// 			"LOP_AFR_OPF_M113_W"
// 		];

// 		systemChat "DEBUG / SPAWN - HUNTER APC spawning";

// 		_class = selectRandom _classList;
// 		_opforVic = [[2095.9,2077.84,0], 0, _class, east] call BIS_fnc_spawnVehicle;

// 		_techCargo = _opforVic select 1;
// 		// systemChat format ["DEBUG / SPAWN - _opforVic select 1: %1", _testVar];
// 		{
// 			bluforZeus addCuratorEditableObjects [[_x], true];
// 			systemChat format ["DEBUG / SPAWN - bluforZeus _x: %1", _x];
// 			sleep 1;
// 		} forEach _techCargo;
// 		{
// 			tinmanModule addCuratorEditableObjects [[_x], true];
// 			systemChat format ["DEBUG / SPAWN - tinmanZeus _x: %1", _x];
// 			sleep 1;
// 		} forEach _techCargo;

// 		// for testing ..
// 		{
// 			ATZeus addCuratorEditableObjects [[_x], true];
// 			systemChat format ["DEBUG / SPAWN - ATZeus _x: %1", _x];
// 			sleep 1;
// 		} forEach _techCargo;
// 		// for testing ..

// 		systemChat "DEBUG / SPAWN - HUNTER APC given move orders";
// 		[_opforVic, _target, "FULL", 120] spawn RGGo_fnc_order_hunt;
// 	} else {
// 		systemChat "no more Armour, there are two in the mission already";
// 	};
	
// 	sleep 30; // should probably be 600?
// };



	


	





// _opforVic doMove _target;
// systemChat format ["DEBUG / SPAWN - single tech moved to target: %1", _target];

// RGG_checkDestroy pushBack _opforVic;
// publicVariable "RGG_checkDestroy";