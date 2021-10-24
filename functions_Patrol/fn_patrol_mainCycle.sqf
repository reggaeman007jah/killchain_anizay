// --- Main Mission Cycle --- //

_initStartPos = _this select 0; // starting point for any new mission
_objPos = _this select 1; // objective point for any new mission 
systemChat format ["debug - Patrol Points Taken: %1", patrolPointsTaken];


// --- side mission management bool --- //
RGG_sideMissionCompleted = true; // remove and re-do side missions - leave in for now as unsure of breakages 


// --- ambient burning vics --- //
[] spawn RGGa_fnc_ambient_burningVics;
// action - vary this better 


// --- ambient mortars nearby -- //
[] spawn RGGa_fnc_ambient_mortarsClose;


// --- roamers --- // 
[_objPos] spawn RGGs_fnc_spawn_opforRandomThreats;


// --- patrol stage markers are created here --- //
[_objPos, _initStartPos] spawn RGGp_fnc_patrol_markers; 


// --- create enemy camp items --- //
[_objPos] spawn RGGp_fnc_patrol_createEnemyCamp; 
sleep 10; // to allow time for camp to be built 


// --- send in welcome party towards indifor --- //
[_initStartPos, _objPos] spawn RGGs_fnc_spawn_opforWelcomeParty;


// --- welcoming technical --- // 
[_objPos, [0,0]] spawn RGGs_fnc_spawn_opforTechnicals; // placeholder pos 


// --- create defenders --- //
[_objPos] spawn RGGs_fnc_spawn_opforDefenders;


// --- create statics and mortars --- //
[_objPos, _initStartPos] spawn RGGs_fnc_spawn_opforStatics;
// systemChat "debug - opfor defenders done";


// --- create loot crate --- // 
[_objPos] call RGGs_fnc_spawn_lootCrate;


// -- generate engineer tasks -- //
[_initStartPos, _objPos] call RGGr_fnc_roles_engineerTasks;


// // --- generate investigation side mission --- // 
// _targetArea = _objPos getPos [1200, (random 359)]; // the general area 
// _building1 = [_targetArea] call RGGg_fnc_get_randomHouse; // building 1
// _building1Pos = getPos _building1;
// systemChat format ["DEBUG / MAIN CYCLE - returned building 1 is: %1", _building1];
// systemChat format ["DEBUG / MAIN CYCLE - returned building 1 pos is: %1", _building1Pos];
// sleep 3;

// // test 
// _list = _building1Pos nearObjects ["House", 100]; // get all houses within 100m of _building1Pos

// _buildingData = []; // init declaration of array 
// // here we cycle through all of the results found, putting them in this array ready for sending 
// {
// 	_buildingData pushBack _x;
// } forEach _list;

// // here we send the anchor and building data (array) to the investigate fnc (mission)
// [_targetArea, _buildingData] spawn RGGm_fnc_mission_investigate; // generate investigate side mission 

// --- attack stage --- // 
RFCHECK = true; 
systemChat "DEBUG / MISSION CYCLE - RFCHECK starting now";

while {RFCHECK} do {

	// cycle debug 
	systemChat "DEBUG / MISSION CYCLE - Cycle - RFCHECK";

	// flybys 
	// [_objPos] execVM "killchain\systems\ambientSystems\randomFlybys.sqf";
	execVM "killchain\systems\ambientSystems\flares.sqf";
	[_objPos] execVM "killchain\systems\ambientSystems\mortars.sqf";

	// total numbers 
	_indi = independent countSide allUnits;
	_east = east countSide allUnits;

	// get overall numbers of troops in redzone 
	_unitsRedzone = allUnits inAreaArray "redzone";
	
	// get overall numbers of troops in obj core area 
	_unitsCore = allUnits inAreaArray "missionCore";

	// Redzone stats 
	_redzoneIndi = 0;
	_redzoneOpfor = 0;
	{
		switch ((side _x)) do
		{
			case INDEPENDENT: {_redzoneIndi = _redzoneIndi + 1};
			case EAST: {_redzoneOpfor = _redzoneOpfor + 1};
		};
	} forEach _unitsRedzone;

	// Core stats 
	_coreIndi = 0;
	_coreOpfor = 0;
	{
		switch ((side _x)) do
		{
			case INDEPENDENT: {_coreIndi = _coreIndi + 1};
			case EAST: {_coreOpfor = _coreOpfor + 1};
		};
	} forEach _unitsCore;

	// debug stats 
	systemChat "RFCHECK1";
	systemChat format ["TOTAL INDI: %1", _indi];
	systemChat format ["TOTAL OPFOR: %1", _east];
	systemChat ".....";
	systemChat format ["REDZONE INDI: %1", _redzoneIndi];
	systemChat format ["REDZONE OPFR: %1", _redzoneOpfor];
	systemChat ".....";
	systemChat format ["CORE INDI:    %1", _coreIndi];
	systemChat format ["CORE OPFR:    %1", _coreOpfor];

	// format ["Indi Units in AO: %1", _redzoneIndi] remoteExec ["systemChat", 0];
	["Indi Units in AO: %1", _redzoneIndi] call RGGi_fnc_information_leadershipGroup;


	// format ["Indi Units at Pathfinder: %1", RGG_availableIndifor] remoteExec ["systemChat", 0];
	// 22 oct - reinstate the above when you have a better system for earning pesh fighters 

	// // rf check 
	// if ((_redzoneIndi <= 8) && (_indi < 20)) then {
	// 	// this will check before churning out new reinforcement units 
	// 	systemChat "LOGIC - indifor in redzone is less than 5 now";
	// 	[_initStartPos, _objPos] execVM "killChain\systems\reinforcementSystems\indiforRf.sqf";
	// };

	// check if won point and if so, move to defend 
	if ((_coreOpfor <= 2) && (_coreIndi >=3)) then {
		systemChat "LOGIC - POINT IS WON - indifor in core is 3+ and opfor is 3-";
		// move indi units to a rough defensive position around the center point - note will also attrack any opfor strags 
		{
			_dir = random 360;
			_dist = selectRandom [14, 16, 18, 20, 22, 24, 30]; 
			_defendPoint = _objPos getPos [_dist, _dir]; // moves units into a rough 360 defensive circle
			_x setBehaviour "COMBAT";
			_x doMove _defendPoint;
			sleep 1;
		} forEach _unitsCore;
		RFCHECK = false;
	} else {
		// insurance move order while in attack mode 
		systemChat "LOGIC - initiate indifor insurance move order";
		[_objPos] spawn RGGo_fnc_order_insuranceMoveIndifor;
	};
	sleep 120;
};


// Question - at what stage should these initial defenders retreat?


// --- pop phase-change smoke --- //
_smoke = createVehicle ["G_40mm_smokeYELLOW", _objPos, [], 0, "none"]; 


// --- voice stuff --- //
if (!BESILENT) then {
	// voice broadcast - prepare for retalliation 
	execVM "media\sounds\thisIsCommand.sqf";
	sleep 2;
	execVM "media\sounds\prepare.sqf";
};


// --- adjust marker --- //
[_objPos] spawn RGGp_fnc_patrol_markerChange;
sleep 3;


// --- more roamers --- // 
[_objPos] spawn RGGs_fnc_spawn_opforRandomThreats;
systemChat "debug - Roamers created";


// --- QFR Here -- //
// this switch will determine the next available point - qrf comes from this direction 
private ["_mainAnchor"];
switch (patrolPointsTaken) do {
	case (0): { _mainAnchor = RGG_PatrolPoints select 1 };
	case (1): { _mainAnchor = RGG_PatrolPoints select 2 };
	case (2): { _mainAnchor = RGG_PatrolPoints select 3 };
	case (3): { _mainAnchor = RGG_PatrolPoints select 4 };
	case (4): { _mainAnchor = RGG_PatrolPoints select 5 };
	case (5): { _mainAnchor = RGG_PatrolPoints select 6 };
	default { systemChat "error Patrol Point switch" };
};
systemChat "debug - QRF initiated";
// from the above we know where the QRF anchor is - now we need to generate a new calc for each batch of QRF 
// each QRF team will either be on the anchor, or rel 290 or rel 110 - not quite rel East or West, 

// for each team, select random 3 - then switch the results 
_anchorSelection = selectRandom [1,2,3];
private ["_anchor1"];
switch (_anchorSelection) do {
	case (1): { _anchor1 = _mainAnchor };
	case (2): { _anchor1 = [_mainAnchor, 300, 240] call BIS_fnc_relPos };
	case (3): { _anchor1 = [_mainAnchor, 300, 130] call BIS_fnc_relPos };
	default { systemChat "error: _anchorSelection" };
};
_qrfAnchor = [_anchor1, 10, 150] call BIS_fnc_findSafePos; 
// this gives us one of three positions - roughly in line but could be ahead, ahead left or ahead right relative to last taken point 

// technicals 
// [_qrfAnchor, _objPos] execVM "killChain\systems\spawnerSystems\spawnTechnicals.sqf";
// [_qrfAnchor, _objPos] spawn RGGs_fnc_spawn_opforTechnicals;
// systemChat "debug - Technical created";
// removed techs 

// unit creation 
for "_i" from 1 to 2 do {

	systemChat "debug - creating QRF here";

	_anchorSelection = selectRandom [1,2,3];
	private ["_anchor1"];
	switch (_anchorSelection) do {
		case (1): { _anchor1 = _mainAnchor };
		case (2): { _anchor1 = [_mainAnchor, 100, 240] call BIS_fnc_relPos };
		case (3): { _anchor1 = [_mainAnchor, 300, 130] call BIS_fnc_relPos };
		default { systemChat "error: _anchorSelection" };
	};
	_qrfAnchor = [_anchor1, 10, 150] call BIS_fnc_findSafePos;

	// delete when we know this works 
	deleteMarker "Point 1"; 
	_objective1 = createMarker ["Point 1", _qrfAnchor];
	_objective1 setMarkerShape "ELLIPSE";
	// _objective1 setMarkerColor "ColorRed";
	_objective1 setMarkerSize [50, 50];
	_objective1 setMarkerAlpha 0.1;

	for "_i" from 1 to 4 do {
		_opforGroup = createGroup [east, true];
		_anchor1a = [_anchor1, 1, 50, 3, 0] call BIS_fnc_findSafePos;
		_opforTeam = [];

		for "_i" from 1 to 5 do {
			_unit = [] call RGGg_fnc_get_randomOpforClassname; 
			_unit1 = _opforGroup createUnit [_unit, _anchor1a, [], 0.1, "none"];
			tinmanModule addCuratorEditableObjects [[_unit1], true];
			bluforZeus addCuratorEditableObjects [[_unit1], true];
			_opforTeam pushBack _unit1;
		};

		sleep 0.7;

		// move orders 
		_ranDist = random 100;
		_ranDir = random 359;
		_unitDest = _objPos getPos [_ranDist, _ranDir];
		_opforTeam doMove _unitDest;
	};

	sleep 5;
};

// here we add more incoming if later on in mission 
if (patrolPointsTaken > 2) then {
	// unit creation 
	sleep 120;
	for "_i" from 1 to 2 do {
		for "_i" from 1 to 6 do {
			_opforGroup = createGroup [east, true];
			_anchor1a = [_qrfAnchor, 1, 50, 3, 0] call BIS_fnc_findSafePos;
			_opforTeam = [];

			for "_i" from 1 to 2 do {
				_unit = [] call RGGg_fnc_get_randomOpforClassname; 
				_unit1 = _opforGroup createUnit [_unit, _qrfAnchor, [], 0.1, "none"];
				tinmanModule addCuratorEditableObjects [[_unit1], true];
				bluforZeus addCuratorEditableObjects [[_unit1], true];
				_opforTeam pushBack _unit1;
			};

			sleep 0.7;

			// move orders 
			_ranDist = random 100;
			_ranDir = random 359;
			_unitDest = _objPos getPos [_ranDist, _ranDir];
			_opforTeam doMove _unitDest;
		};
	};
};

// deleteMarker "Point 1"; // untested

// defend point stage -------------------------------------------------------------------------------
_cycles = 0;

systemChat "RFCHECK2 starting";

RFCHECK2 = true; 

while {RFCHECK2} do {

	// --- ambient flybys --- // 
	// [_objPos] execVM "killchain\systems\ambientSystems\randomFlybys.sqf";

	// --- ambient flares --- //
	execVM "killchain\systems\ambientSystems\flares.sqf";

	// --- ambient mortars --- //
	[_objPos] execVM "killchain\systems\ambientSystems\mortars.sqf";
		
	// --- get total numbers --- // 
	_indi = independent countSide allUnits;
	_east = east countSide allUnits;

	// --- get overall numbers of troops in redzone --- //
	_unitsRedzone = allUnits inAreaArray "redzone";

	// --- get overall numbers of troops in obj core area --- //
	_unitsCore = allUnits inAreaArray "missionCore";

	// --- check indi and opfor numbers in redzone ---//
	_redzoneIndi = 0;
	_redzoneOpfor = 0; 
	{
		switch ((side _x)) do
		{
			case EAST: {_redzoneOpfor = _redzoneOpfor + 1};
			case INDEPENDENT: {_redzoneIndi = _redzoneIndi + 1};
		};
	} forEach _unitsRedzone;

	// --- check indi and opfpr numbers in core --- // 
	_coreIndi = 0;
	_coreOpfor = 0;
	{
		switch ((side _x)) do
		{
			case EAST: {_coreOpfor = _coreOpfor + 1};
			case INDEPENDENT: {_coreIndi = _coreIndi + 1};
		};
	} forEach _unitsCore;

	// --- debug stats --- //
	systemChat "RFCHECK2";
	systemChat format ["TOTAL INDI: %1", _indi];
	systemChat format ["TOTAL OPFOR: %1", _east];
	systemChat ".....";
	systemChat format ["REDZONE INDI: %1", _redzoneIndi];
	systemChat format ["REDZONE OPFR: %1", _redzoneOpfor];
	systemChat ".....";
	systemChat format ["CORE INDI:    %1", _coreIndi];
	systemChat format ["CORE OPFR:    %1", _coreOpfor];
	format ["INDI Units in AO: %1", _redzoneIndi] remoteExec ["systemChat", 0];

	// --- progression check --- //
	if ((_cycles >= 5) && (_coreIndi > 3) && (_redzoneOpfor < 5) && (_east < 20)) then {
		// progress mission based mainly on cycles but also needs indi on point and low numbers of opfor in redzone 
		RFCHECK2 = false;
		systemChat "(_cycles >= 5) && (_coreIndi > 3) && (_redzoneOpfor < 5)";
		systemChat "auto-cycle-push";
	} else {
		_cycles = _cycles + 1;
		systemChat format ["Defence Cycles: %1", _cycles];

		// // ORDER RF HERE IF NEEDED 
		// if ((_redzoneIndi <= 8) && (_indi < 20)) then {
		// 	systemChat "note _redzoneIndi <= 5 - RF ordered while in defend state ";
			
		// 	[_initStartPos, _objPos] execVM "killChain\systems\spawnerSystems\createIndiforRFUnits.sqf";
		// 	// _smoke = createVehicle ["G_40mm_smokeYELLOW", _initStartPos, [], 0, "none"]; // drop this from up high 
		// 	// removing, as this is also done in a different script - but here it will always be at the last taken patrol (origin) point  
		// 	// so might be popping yellow even if RF are coming from point one further back 

		// 	// voice broadcasts
		// 	// execVM "media\sounds\thisIsCommand.sqf";
		// 	// sleep 3;
		// 	// execVM "media\sounds\rfInbound.sqf";
		// };

		// OPFOR to push forward as a group if they took back control of point and there is no indifor on it 
		if ((_coreIndi < 1) && (_redzoneOpfor > 25) && (_coreOpfor > 20)) then {
			// hint "THEY ARE RUSHING! PREPARE YOUR DEFENSES!!";
			"ENEMY FORCES HAVE WON BACK THE PATROL POINT AND ARE NOW ADVANCING ONTO THE PREVIOUS POINT- YOU NEED TO STOP THEM NOW!" remoteExec ["hint", 0, true];	
			{
				_randomDir = selectRandom [270, 310, 00, 50, 90];
				_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
				_endPoint1 = _initStartPos getPos [_randomDist,_randomDir];
				sleep 2;
				_x setBehaviour "COMBAT";
				_x doMove _endPoint1;
			} forEach _unitsRedzone;
		};
		// this system is a proof of concept for a bigger more push/pull scenario 

		// STAGE WIN LOGIC 
		if ((_coreOpfor < 1) && (_coreIndi >=7) && (_redzoneOpfor < 10) && (_east < 10) && (RGG_sideMissionCompleted)) then {
			systemChat "(_coreOpfor < 1) && (_coreIndi >=7) && (_redzoneOpfor < 10) && (_east < 10)";
			systemChat "defence successful - take a breather... get heals and ammo, and get ready for next assault";
			// regroup, healup and get prizes
			RFCHECK2 = false;
		};
	};

	// --- insurance move order while in attack mode --- //
	systemChat "LOGIC - initiate indifor insurance move order";
	[_objPos] spawn RGGo_fnc_order_insuranceMoveIndifor;
	systemChat "LOGIC - initiate opfor insurance move order";
	[_objPos] spawn RGGo_fnc_order_insuranceMoveOpfor;
	sleep 60;
};


// --- prizes and healing --- // 


// --- voice broadcast to formalise success --- //
if (!BESILENT) then { 
	execVM "media\sounds\thisIsCommand.sqf";
	sleep 2;
	execVM "media\sounds\success.sqf";		
};


// --- delete existing camp --- //
[] spawn RGGd_fnc_delete_campItems; 





// BASE REWARDS HERE :)

// create medic tent 
_buildLocation = _objPos findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"]; 
_flrObj = "F_20mm_Red" createvehicle _buildLocation;
sleep 5;
// _baseBuilding1 = createVehicle ["Land_vn_tent_mash_02_04", _buildLocation, [], 30, "none"]; 
// marker for tent 
// _objective1 = createMarker ["_buildLocation", _buildLocation];
// _objective1 setMarkerShape "ELLIPSE";
// _objective1 setMarkerColor "ColorRed";
// _objective1 setMarkerSize [5, 5];
// sleep 1;

// // create ammo box 
// _fobPos = _buildLocation findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"]; 
// _flrObj = "F_20mm_Red" createvehicle _fobPos;
// sleep 5;
// _fobPos1 = createVehicle ["vn_o_ammobox_full_08 (ammo1)", _fobPos]; 
// [ "AmmoboxInit", [_fobPos1, true, {true}] ] call BIS_fnc_arsenal;
// // marker for ammo 
// _objective1 = createMarker ["_fobPos", _fobPos];
// _objective1 setMarkerShape "ELLIPSE";
// _objective1 setMarkerColor "ColorRed";
// _objective1 setMarkerSize [5, 5];
// sleep 1;

// // create repair container 
// _repairPos = _buildLocation findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"]; 
// _flrObj = "F_20mm_Red" createvehicle _repairPos;
// sleep 5;
// _repairPos1 = createVehicle ["B_Slingload_01_Repair_F", _repairPos]; //vehicle repair 
// // marker for repair 
// _objective1 = createMarker ["_repairPos", _repairPos];
// _objective1 setMarkerShape "ELLIPSE";
// _objective1 setMarkerColor "ColorRed";
// _objective1 setMarkerSize [10, 10];
// _objective1 setMarkerAlpha 0.2;
// sleep 0.6;

// create vics and vic rewards 
// _vicLocation = _buildLocation findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
// _quaddy = createVehicle ["I_G_Quadbike_01_F", _vicLocation]; // quad
// sleep 1;
// _vic = selectRandom [
// 	"I_G_Offroad_01_armed_F", 
// 	"I_C_Offroad_02_LMG_F", 
// 	"I_C_Offroad_02_LMG_F", 
// 	"B_LSV_01_armed_F"
// ];
// _rewardSpawn = createVehicle [_vic, _vicLocation]; // reward vic 

// _vicLocation = _buildLocation findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
// ["vn_b_wheeled_m151_mg_03", _vicLocation] call RGGv_fnc_vehicle_quickTransport;
// sleep 1;
// ["vn_b_wheeled_m151_mg_03", _vicLocation] call RGGv_fnc_vehicle_quickTransport;
// // marker for vics 
// _objective1 = createMarker ["_vicLocation", _vicLocation];
// _objective1 setMarkerShape "ELLIPSE";
// _objective1 setMarkerColor "ColorRed";
// _objective1 setMarkerSize [5, 5];


/*
NOTE - the above should be replaced with better spawn fnc for vics 
*/

// to do - choose better patrol vics 

// ------------------------------------------------------------------------------------------------------------------

// create win marker 
_float = diag_tickTime;
_stampToString = str _float;

_tempBase = createMarker [_stampToString, _objPos];
_tempBase setMarkerShape "ELLIPSE";
_tempBase setMarkerSize [30, 30];
_tempBase setMarkerAlpha 0.8;
_tempBase setMarkerColor "colorBlue";

/*
start of spawn removal 
*/
// // create respawn points 
// _bluforSpawn = _fobPos1 getPos [2,0];
// _indiSpawn = _objPos getPos [40,270];
// RGG_respawnStore pushBack [_bluforSpawn, _indiSpawn]; // sending to global array to enable deleting of older respawns 

// // define right name for spawn point  
// private ["_spawnPointName"];
// switch (patrolPointsTaken) do {
// 	case 0: { _spawnPointName = "ALPHA" };
// 	case 1: { _spawnPointName = "BRAVO" };
// 	case 2: { _spawnPointName = "CHARLIE" };
// 	case 3: { _spawnPointName = "DELTA" };
// 	case 4: { _spawnPointName = "ECHO" };
// 	case 5: { _spawnPointName = "FOXTROT" };
// 	default { systemChat "error: Patrol Point switch" };
// };
// [west, _bluforSpawn, _spawnPointName] call BIS_fnc_addRespawnPosition; // create blu resapwn
// // [independent, _indiSpawn, "GENERIC INDI RESPAWN POINT"] call BIS_fnc_addRespawnPosition; // create ind resapwn
/*
end of spawn removal 
*/

// _cnt = count RGG_respawnStore; // check if more than one, i.e. don't process this is we only have one (1st) point 
// if (_cnt >1) then {
// 	_removeSpawns = RGG_respawnStore select 0;
// 	_removeBluSpawn = _removeSpawns select 0;
// 	_removeIndSpawn = _removeSpawns select 1;
// 	[west, _removeBluSpawn] callBIS_fnc_removeRespawnPosition
// 	[independent, _removeIndSpawn] callBIS_fnc_removeRespawnPosition
// 	RGG_respawnStore deleteAt 0;
// };

// NEW - adding checker for players 
"You have two minutes to get 50m of the Patrol Point in order to hold progression..." remoteExec ["systemChat", 0, true];
["REGROUP AT THE CP"] remoteExec ["RGGi_fnc_information_lowerRight", 0]; 
sleep 120;

// PROXIMITY REGROUP SYSTEM 
_pos1 = createMarker ["REGROUP", _objPos];
_pos1 setMarkerShape "ELLIPSE";
_pos1 setMarkerAlpha 0.3;
_pos1 setMarkerSize [100, 100];

_activateCheck = true;
_anchorPos = getMarkerPos 'REGROUP';

"progression / hold activated" remoteExec ["systemChat", 0, true];
while {_activateCheck} do {
	sleep 10; // cycle frequency
	_dataStore = [];
	{
		_playerPos = getPos _x;
		_dist = _anchorPos distance _playerPos;

		if (_dist < 100) then {
			_dataStore pushback _x;
		};
	} forEach allPlayers;
	_cnt = count _dataStore;
	format ["Players near basecamp: %1", _cnt] remoteExec ["systemChat", 0];
	if (_cnt == 0) then {
		deleteMarker "REGROUP";
		_activateCheck = false;
		// "progression / hold completed" remoteExec ["systemChat", 0, true];
		["PATROL IS MOVING"] remoteExec ["RGGi_fnc_information_lowerRight", 0]; 
		execVM "media\sounds\success.sqf";	
		// format ["Debug - NOTE: _cnt == 0", _cnt] remoteExec ["systemChat", 0];
	};
};



// NOW, PROGRESS PATROL 

// resume here ...
patrolPointsTaken = patrolPointsTaken +1;

// set up next obj 
_anchor = _objPos; // switcheroo 
// private ["_mainAnchor"]; // may not need this..?

// this switch repurposes the _objPos value with the next obj position 
switch (patrolPointsTaken) do {
	case 1: {
		_objPos = RGG_PatrolPoints select 1;
		systemChat "RUNNING PHASE 2";	
	};
	case 2: {
		_objPos = RGG_PatrolPoints select 2;
		systemChat "RUNNING PHASE 3";	
	};
	case 3: {
		_objPos = RGG_PatrolPoints select 3;
		systemChat "RUNNING PHASE 4";	
	};
	case 4: {
		_objPos = RGG_PatrolPoints select 4;
		systemChat "RUNNING PHASE 5";	
	};
	case 5: {
		_objPos = RGG_PatrolPoints select 5;
		systemChat "RUNNING PHASE 6";	
	};
	case 6: {
		_objPos = RGG_PatrolPoints select 6;
		systemChat "RUNNING ENDGAME";	
	};
	default {
		systemChat "error: Patrol Point switch";
	};
};

// blanket move order here 
_units = allUnits inAreaArray "redzone";
_indi = [];
{
	if ((side _x) == INDEPENDENT) then {_indi pushBack _x}
} forEach _units;

// add check for all indifor units - are they in turret? if so, leave turret 
{
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_endPoint1 = _objPos getPos [_randomDist,_randomDir];
	sleep 1;
	_x setBehaviour "COMBAT";
	_x doMove _endPoint1;
} forEach _indi;

// _onStatics = allUnits select {
// 	side _x == independent && vehicle _x isKindOf "StaticWeapon";
// };

// {
// 	doGetOut _x;
// } forEach _onStatics;

/*
_dude leaveVehicle _veh;
doGetOut _dude;
allunits select {side _x == resistance && vehicle _x isKindOf "StaticWeapon" }
*/


{
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_endPoint1 = _objPos getPos [_randomDist,_randomDir];
	sleep 1;
	_x setBehaviour "COMBAT";
	_x doMove _endPoint1;
} forEach _indi;

// catchall opfor move at end of cycle - might lead to pincer attacks unexpectedly ;)
_opfor = [];
{
	if ((side _x) == EAST) then {_opfor pushBack _x};
} forEach allUnits;

{
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_endPoint1 = _objPos getPos [_randomDist,_randomDir];
	sleep 2;
	_x setBehaviour "COMBAT";
	_x doMove _endPoint1;
} forEach _opfor;

// cleanup
{ deleteVehicle _x } forEach allDead;
systemChat "RUNNING CLEANUP - check works from Cycle Script ";

// determine whether another camp obj or final obj 
// if (patrolPointsTaken <= 5) then {
if (patrolPointsTaken <= 6) then {
	[_anchor, _objPos] spawn RGGp_fnc_patrol_mainCycle;
} else {
	[_anchor, _objPos] execVM "killChain\mission\patrolFinal.sqf";	
};
// here I am changing the points needed from 6 to 4





