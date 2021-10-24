// --- this deletes all left behind civilian objects and markers, keeping mission tidy --- // 

/*
this is triggered just after creation, and is essentially the timer system 
25 minutes are allocated for extract of civilians before mission is deleted 
on deletion, any civilians and all markers are deleted 
*/

_anchor = _this select 0; // anchor pos 
_markers = this select 1; // marker data array 

// sleep 1500;
sleep 300; // 5 minute test 

_toProcess = allUnits inAreaArray "Extract";

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

// // trigger new mission  

// // --- one-off init / generate investigation side mission --- // 
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