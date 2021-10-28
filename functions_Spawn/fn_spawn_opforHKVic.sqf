// --- opfor HK Vic system --- //

/*

This system will gen opfor vis to constantly harass players 
they will come directly for random players one player at a time 
spawn one of these every 20 minutes 

create technical 



.....

select player on the ground 

select position to spawn in specops - where no players are near 

send specops to player on a cycle 

disable fire until firedUpon 

get them close before opening up 

.....

Notes:
I removed stealth behaviour to keep things fast 

To-do:
Check dist between HK team and target player - if over x, and if no players nearby, then delete squad and re-run 
Check if target is dead, and if so, re-route HK to another target 



Runs HK system for a fire team dropped into the AO 

Takes name of hunting group the only param 
*/

// _hunterGroup = _this select 0;
// systemChat format ["running runHK, received: %1", _hunterGroup];

// // confirm position of hunter leader 
// _groupLeader = leader _hunterGroup;
// _hunterPos = getPos _groupLeader;


// find nearest enemy to populate the function 
// get group name of that nearest enemy 

// _hunted = objnull;
// _distance = 1000000;
// _hostiles = allUnits select {side _x == east};
// {
//  if (_hunter distance _x < _distance) then {
//   _hunted =_x;
//   _distance = _hunter distance _x;
// };
// } forEach _hostiles;
// _hunted;

// _opforCount1 = 0;
// _blueforCount1 = 0;
// _units = allUnits inAreaArray "Objective 1";
// _unitCount1 = count _units;
// {
// 	switch ((side _x)) do
// 	{
// 		case EAST: {_opforCount1 = _opforCount1 + 1};
// 		case WEST: {_blueforCount1 = _blueforCount1 + 1};
// 	};
// } forEach allGroups;


// TEST_opforGroups = []; // empty array to store opfor group IDs / names 
// TEST_groups = allGroups; // gets all known game groups 
// _numberOfGroups = count TEST_groups; // counts all known game groups 
// systemChat format ["there are %1 groups in the game", _numberOfGroups]; // info 

// // now extract only opfor groups and put into storage array 
// {
// 	switch ((side _x)) do
// 	{
// 		case EAST: {TEST_opforGroups pushBack _x};
// 		case WEST: {};
// 	};
// } forEach TEST_groups;
// systemChat format ["opfor groups in redzone: %1", TEST_opforGroups]; // debug lists all opfor groups 

// RGG_distanceStore = []; // storage to manage distance data 


// process each opfor group 
// {
// 	_leader = leader _x; // get group leader 
// 	_leaderPos = getPos _leader; 
// 	_dist = _leaderPos distance _hunterPos; // get distance between hunter and hunted 
// 	systemChat format ["opfor group distance: %1", _dist]; // debug info 
// 	RGG_distanceStore pushBack _dist;
// } forEach TEST_opforGroups;
// debug text 
// systemChat format ["RGG_distanceStore: %1", RGG_distanceStore]; // debug lists all opfor groups 
// // debug sleep 
// sleep 4;

// now to try to only keep the closest one 
// _cnt = count RGG_distanceStore;

// _min = selectMin RGG_distanceStore; // this gives us the minimum value, but not the array position 
// systemChat format ["_min = selectMin RGG_distanceStore: %1", _min]; // debug lists all opfor groups 
// // debug sleep 
// // sleep 4;

// {
// 	systemChat "cycle";
// 	_leader = leader _x; // get group leader 
// 	_leaderPos = getPos _leader; 
// 	_dist = _leaderPos distance _hunterPos; // get distance between hunter and hunted 
// 	if (_dist == _min) then {
// 		systemChat format ["winning group and distance is: %1 %2", _x, _dist]; // debug lists all opfor groups 
// 		_stalking = [_hunterGroup, _x] spawn BIS_fnc_stalk;
// 		systemChat format ["stalking group: %1 %2 away", _x, _dist]; // debug lists all opfor groups 
// 		RGG_distanceStore = [];
// 		TEST_opforGroups = [];
// 	};
// } forEach TEST_opforGroups;



// {
// 	if (_x == _min) then {
// 		_closest = RGG_distanceStore select _min;
// 		systemChat format ["opfor group smallest distance: %1", _closest];
// 	} else {
		
// 	};
// } forEach RGG_distanceStore;


// _closest = RGG_distanceStore select _min;
// systemChat format ["opfor group smallest distance: %1", _closest];


// _hunter = player;
// _hostiles = allUnits select {side _x == east};
// _nearestEnemy = [_hostiles , [_hunter], { _input0 distance _x }, "ASCEND", { canMove _x }] call BIS_fnc_sortBy;
// _huntedGroup = group (_nearestEnemy select 0);
// _huntedGroup

// sleep 2;
// _stalked = TEST_opforGroups select _min;
// _stalking = [_hunterGroup, _stalked] spawn BIS_fnc_stalk;

// // _arr sort true;

// // select lowest dist 
// _nearestEnemyDist = selectMin 

// _min = selectMin [1,2,3,4,5]; //1


// args: delay 

_delay = _this select 0; // how long before triggering script - nice to not trigger immediately for main mission for example ... 
sleep _delay;

// classes 
_classList = [
	"LOP_BH_Landrover_M2",
	"LOP_BH_Nissan_PKM",
	"LOP_BH_Offroad_M2",
	"LOP_AFR_OPF_Offroad_M2",
	"O_G_Offroad_01_armed_F"
];

// select player and get their target pos 
_targetPlayer = call RGGg_fnc_get_anyPlayer;
_targetPos = getPos _targetPlayer;

// generate spawn area relative to target anchor pos that has no players near 
_anchorPos = [_targetPos, 800, 1000] call BIS_fnc_findSafePos; // probably dont need this, a more simple get system would be more perf friendly 
_spawnPos = [_anchorPos, 400, 400, 10, 0, 1, 0, 400] call RGGf_fnc_find_locationNoPlayers; 

// debug 
systemChat "debug - HK technical spawning";

// generate specific spawn pos for techncial 
_pos = [_spawnPos, 0, 150] call BIS_fnc_findSafePos;
_class = selectRandom _classList;
_opforVic = [_pos, 180, _class, east] call BIS_fnc_spawnVehicle;
_opforVic doMove _target;
systemChat format ["single HK tech moved to target: %1", _targetPlayer];

_hkVics = true;

while {_hkVics} do {

	// select player on the ground 
	// get all players 
	_dataStore = [];
	{
		_playerPos = getPos _x;
		_dataStore pushback _x;
	} forEach allPlayers;

	// this should prevent attacks when near base 
	_dataStore2 = [];
	{
		_dist = ammo1 distance _x;
		if (_dist > 500) then {
			_dataStore2 pushback _x;
		};
	} forEach _dataStore;

	_cnt = count _dataStore2;
	if (_cnt > 0) then {

		// choose a player at random 
		_ranTarget = selectRandom _dataStore2;
		systemChat format ["hk vic dataStore for player targets: %1", _ranTarget];

		sleep 10;

		// select position to spawn in specops - where no players are near 
		_targetPos = getPos _ranTarget;
		_spawnPos = [_targetPos, 400, 400, 10, 0, 1, 0, 400] call RGGf_fnc_find_locationNoPlayers;

		_opGroup = createGroup [east, true];
		{
			_dist = random 5;
			_dir = random 359;
			_pos = _spawnPos getPos [_dist, _dir];
			_unit = _opGroup createUnit [_x, _pos, [], 0.1, "none"]; 
			_unit setCombatMode "RED";
			// tinmanModule addCuratorEditableObjects [[_unit], true];
			bluforZeus addCuratorEditableObjects [[_unit], true];
			sleep 0.2;
		} forEach _specOps;
		
		// _cnt = count _opGroup;

		_hunt = true;
		while {_hunt} do {
			_target = getPos _ranTarget;
			_opGroup move _target;

			// debug markers 
			_leader = leader _opGroup;
			_leaderPos = getPos _leader;
			_stampToString = str _opGroup;
			// deleteMarker _stampToString;
			// _tempMarker = createMarker [_stampToString, _leaderPos];
			// _tempMarker setMarkerType "o_inf";

			// the below line shows HK markers - comment in for debug or to help players see invcoming, comment out to create more terror
			// [_leaderPos, "o_inf", _stampToString, 20] spawn RGGe_fnc_effects_fadeMarkers;

			// _pos = _this select 0; // position  
			// _type = _this select 1; // marker className 
			// _name = _this select 2; // unique marker name 
			// _duration = _this select 3; // time to live before fading  



			// systemChat "OPFOR KILLERS MOVING";
			if (count (units _opGroup) < 1) then { 
				_hunt = false;
				systemChat "opfor HK team is dead - re-running opfor HK"; 
				sleep 600;
			};
			// - need to check if player was killed too, so they can move to next target 
			// - need to check if distance is too far away, to remove and reset team 
			// _cnt = count _opGroup;
			// if (_cnt ==0) then {
			// 	_hunt = false;
			// };
			sleep 30;
		};

	};

	// send specops to player on a cycle 

	// disable fire until firedUpon 

	// get them close before opening up 

	// .....
	sleep 30;
};

/*
idea, maybe this script generates techs and sends them on a one-time move mission 
then there is a secondary checker in different function that periodically checks for techs, and if found, 
sends them to random player 
And maybe we use the checker to decide if any new techs need to be spawned 
So the check runs first - if none found, create (and send in) 

alt 
checker runs periodically checking for techs - if are found, send to player, if not, create and send to player 


position nearEntities [type, radius]