// triggered from engineOff EH for ROOFY heli asset 

// trying to stop them from jumping down when they take fire 

_cargo = _this select 0;
_vehicle = _this select 1;
_pos = getPos _vehicle;

{
	unassignVehicle _x;
} forEach _cargo;
_cargo orderGetIn false;

sleep 2;

{
	// _randomPos = _pos getPos [2, (random 359)];
	// _randomPos = _vehicle getRelPos [2, 270];
	// systemChat format ["moving unit %1 to pos %2", _x, _randomPos];
	// _x doMove _randomPos;
	_x setUnitPos "middle";
	// sleep 5;
	_x forceSpeed 0;
	_x disableAI "path";
} forEach _cargo;