// one off move order - all indiRed move in to attack objective 

// systemChat "ARVN Units are assaulting the objective";
"INDI Groups are assaulting the objective" remoteExec ["systemChat", -2, true];
// {playSound "attack"} remoteExec ["call",-2];
// {playSound "commandOut"} remoteExec ["call",0];
// systemChat "played sound";
FALLBACKREMAIN = false; // in case was running 

_movePos = getMarkerPos 'REDZONE'; // objective

// _units = allUnits inAreaArray "Redzone";

// _indi = [];
// {
// 	if ((side _x) == INDEPENDENT) then {_indi pushBack _x};
// } forEach _units;

// _indiGroups = [];
// {
// 	_indiGroups pushBack _x;
// } forEach allGroups "independent";

_selection = allGroups select {side _x isEqualTo independent};//returns all east groups

sleep 2;

{
	_x move _movePos;
} forEach _selection;

// // get indi player
// _dataStore = [];
// {
// 	if ((side _x) == INDEPENDENT) then { _dataStore pushback _x }
// } forEach allPlayers;
// _commander = _dataStore select 0;
// _commPos = getPos _commander; // ?
// {_commander say3D "attack";} remoteExec ["call",0];


// {
// 	switch ((side _x)) do
// 	{
// 		case INDEPENDENT: {
// 			_randomDir = selectRandom [270, 310, 00, 50, 90];
// 			_randomDist = selectRandom [5, 10, 15, 20, 25, 30];
// 			_endPoint1 = _movePos getPos [_randomDist,_randomDir];					
// 			_x setBehaviour "COMBAT";
// 			_x doMove _endPoint1;
// 			sleep 0.2;
// 		};
// 	};
// } forEach _indi;