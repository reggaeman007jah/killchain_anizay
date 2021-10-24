// --- this deletes all left behind civilian objects and markers, keeping mission tidy --- // 

/*
this is triggered just after creation, and is essentially the timer system 
25 minutes are allocated for extract of civilians before mission is deleted 
on deletion, any civilians and all markers are deleted 
*/
systemChat "running despawnCivMission";

// action - only run if no players are near!

_anchor = _this select 0; // anchor pos 
_markers = _this select 1; // marker data array 

// sleep 1500;
"Civilian Rescue Mission is now active - Extract civilians to boost number of Peshmerga fighters" remoteExec ["systemChat", 0, true];
systemChat "sleeping for 300 seconds";
sleep 300; // 5 minute test 
systemChat "60 second warning before deleting";
sleep 60;
	
// wait for players to not be near 
_activateCheck = true;
while {_activateCheck} do {

	_dataStore = [];
	{
		_playerPos = getPos _x;
		_dist = _anchor distance _playerPos;

		if (_dist < 1500) then {
			_dataStore pushback _x;
		};
	} forEach allPlayers;

	_cnt = count _dataStore;
	if (_cnt == 0) then {
		systemChat "no players are near - mission can be shut down";
		_activateCheck = false;
	} else {
		_activateCheck = true;
		systemChat "players are near - do not delete Misison";
	};
	sleep 60; // cycle frequency 
};

_toProcess = allUnits inAreaArray "Extract";

deleteMarker "_medivac";

{
	if ((side _x) == CIVILIAN) then {
		deleteVehicle _x;
		systemChat format ["deleting civilian %1", _x];
	};
} forEach _toProcess;

{
	deleteMarker _x;
	systemChat format ["deleting marker %1", _x];
} forEach _markers;

deleteMarker "Extract"; 

_objPos = selectRandom RGG_PatrolPoints;

// trigger new mission  

// --- one-off init / generate investigation side mission --- // 

_targetArea = _objPos getPos [1200, (random 359)]; // the general area 
_building1 = [_targetArea] call RGGg_fnc_get_randomHouse; // building 1
_building1Pos = getPos _building1;
systemChat format ["DEBUG / MAIN CYCLE - returned building 1 is: %1", _building1];
systemChat format ["DEBUG / MAIN CYCLE - returned building 1 pos is: %1", _building1Pos];
sleep 3;

// test 
_list = _building1Pos nearObjects ["House", 100]; // get all houses within 100m of _building1Pos

_buildingData = []; // init declaration of array 
// here we cycle through all of the results found, putting them in this array ready for sending 
{
	_buildingData pushBack _x;
} forEach _list;

// here we send the anchor and building data (array) to the investigate fnc (mission)
[_targetArea, _buildingData] spawn RGGm_fnc_mission_investigate; // generate investigate side mission 