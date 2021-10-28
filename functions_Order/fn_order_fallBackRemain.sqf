// loop order, fall back and follow player pos 

// systemChat "ARVN Units are falling back to protect TINMAN";
"PESH Units are falling back to protect TINMAN" remoteExec ["systemChat", -2, true];
// {playSound "fallbackremain"} remoteExec ["call",-2];
// _initStartPos = _this select 0; // origin point 
// _objPos = _this select 1; // obj point 

FALLBACKREMAIN = true;

while {FALLBACKREMAIN} do {
	
	// get PL position 
	_commPos = [] call RGGg_fnc_get_tinmanPos;
	_inRed = _commPos inArea "redzone";

	if (_inRed) then {
		systemchat "debug - FBR cycle";
		// get indi groups / order move 
		_selection = allGroups select {side _x isEqualTo independent};
		{
			// loose circle but this time all around player, not in front - to do 
			_dist = _commPos distance (getPos leader _x);
			if (_dist > 21) then {
				_randomDir = random 359;
				_randomDist = selectRandom [15, 20, 25];
				_endPoint1 = _commPos getPos [_randomDist,_randomDir];
				_x move _commPos;
				systemChat format ["DEBUG - MOVE ORDER / Group %1 moving to %2", _x, _commPos];
			};
		} forEach _selection;
	} else {
		FALLBACKREMAIN = false;
	};
	// to do - add an else to retreat units if tinman is not near 
	// } else {
	// 	// player is out of the zone, retreat indi 
	// 	{
	// 		_randomDir = selectRandom [270, 310, 00, 50, 90];
	// 		_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	// 		_endPoint1 = _initStartPos getPos [_randomDist,_randomDir];					
	// 		_x setBehaviour "COMBAT";
	// 		_x doMove _initStartPos;
	// 	} forEach _selection;
	// }
	sleep 20;
};





// USE   




// get PL position 
_dataStore = [];
{
	_playerRole = roleDescription _x;
	if (_playerRole == "Viking 1:1 - Platoon Leader@Viking 1") then { _dataStore pushback _x }
} forEach allPlayers;
_commander = _dataStore select 0;
_commPos = getPos _commander;

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
