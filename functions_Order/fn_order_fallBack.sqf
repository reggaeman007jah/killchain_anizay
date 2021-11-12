/*
Tinman Basic 
one off order - all groups move to player location 
*/

"INDI Groups are moving to Platoon Leader position" remoteExec ["systemChat", -2];
// {playSound "attack"} remoteExec ["call",-2];
// {playSound "commandOut"} remoteExec ["call",0];
// systemChat "played sound";

FALLBACKREMAIN = false; // in case was running 

// get PL position 
_commPos = [] call RGGg_fnc_get_tinmanPos;

// get indi groups / order move 
_selection = allGroups select {side _x isEqualTo independent};
{
	// loose circle but this time all around player, not in front 
	_randomDir = random 359;
	_randomDist = selectRandom [5, 10, 15, 25];
	_endPoint1 = _commPos getPos [_randomDist,_randomDir];
	_x move _commPos;
	systemChat format ["DEBUG - MOVE ORDER / Group %1 moving to %2", _x, _commPos];
} forEach _selection;


// // systemChat "debug - running fallback.sqf";
// // "ARVN Units are falling back to Tinman" remoteExec ["systemChat", -2, true];
// // {playSound "fallback"} remoteExec ["call",-2];

// FALLBACKREMAIN = false; // in case was running 

// _units = allUnits inAreaArray "Redzone";

// _indi = [];
// {
// 	if ((side _x) == INDEPENDENT) then {_indi pushBack _x};
// } forEach _units;

// // systemChat format ["_indi: %1", _indi];

// // get indi player
// // _dataStore = [];
// // {
// // 	if ((side _x) == INDEPENDENT) then { _dataStore pushback _x }
// // } forEach allPlayers;

// // get PL 
// _dataStore = [];
// {
// 	_playerRole = roleDescription _x;
// 	if (_playerRole == "Viking 1:1 - Platoon Leader@Viking 1") then { _dataStore pushback _x }
// } forEach allPlayers;

// _commander = _dataStore select 0;
// _commPos = getPos _commander;
// // systemChat format ["_commander: %1", _commander];
// // systemChat format ["_commPos: %1", _commPos];

// {
// 	// loose circle but this time all around player, not in front 
// 	_randomDir = random 359;
// 	_randomDist = selectRandom [5, 10, 15];

// 	_endPoint1 = _commPos getPos [_randomDist,_randomDir];
	
// 	_x setBehaviour "COMBAT";
// 	_x doMove _endPoint1;

// 	// systemChat format ["move order: %1", _endPoint1];

// 	sleep 0.7; // keeping the peel movement quick hopefully without killing perf
// } forEach _indi;


// new  
// one off move order - move to player location  





