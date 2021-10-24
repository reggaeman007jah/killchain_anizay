_anchor = _this select 0;
// _target = _this select 1;

// sleep 120;

_isOnGround = call RGGg_fnc_get_randomPlayerOnGround;
if (isNull _isOnGround) then {
// if (_isOnGround == "objNull") then {
	systemChat "DEBUG / SPAWN - technical not spawning - NO PLAYERS ON GROUND - USING NULLRESULT REAL THING";
} else {
	systemChat format ["DEBUG / SPAWN - RGGg_fnc_get_randomPlayerOnGround returns: %1", _isOnGround];
	_target = getPos _isOnGround;

	_classList = [
		"LOP_BH_Landrover_M2",
		"LOP_BH_Nissan_PKM",
		"LOP_BH_Offroad_M2",
		"LOP_AFR_OPF_Offroad_M2",
		"O_G_Offroad_01_armed_F"
	];

	systemChat "DEBUG / SPAWN - technical spawning";
	_pos = [_anchor, 0, 500] call BIS_fnc_findSafePos;
	_class = selectRandom _classList;
	_opforVic = [_pos, 180, _class, east] call BIS_fnc_spawnVehicle;

	_techCargo = _opforVic select 1;

	{
		bluforZeus addCuratorEditableObjects [[_x], true];
		systemChat format ["DEBUG / SPAWN - bluforZeus _x: %1", _x];
		sleep 1;
	} forEach _techCargo;

	sleep 5;
	{
		tinmanModule addCuratorEditableObjects [[_x], true];
		systemChat format ["DEBUG / SPAWN - tinmanZeus _x: %1", _x];
		sleep 1;
	} forEach _techCargo;

	_opforVic doMove _target;
	systemChat format ["DEBUG / SPAWN - single tech moved to target: %1", _target];

	RGG_checkDestroy pushBack _opforVic;
	publicVariable "RGG_checkDestroy";
};

/*
// _isOnGround = _data select 0;

// if (_isOnGround) then {
		
	// _targetPlayer = _data select 1;
	// _targetPlayer = call RGGg_fnc_get_randomPlayerOnGround;
	_target = getPos _isOnGround;

	// private ["_num", "_delay"]; 
	// _num = 0;
	// _delay = 0;
	
	_classList = [
		"LOP_BH_Landrover_M2",
		"LOP_BH_Nissan_PKM",
		"LOP_BH_Offroad_M2",
		"LOP_AFR_OPF_Offroad_M2",
		"O_G_Offroad_01_armed_F"
	];

	systemChat "DEBUG / SPAWN - technical spawning";
	_pos = [_anchor, 0, 500] call BIS_fnc_findSafePos;
	_class = selectRandom _classList;
	_opforVic = [_pos, 180, _class, east] call BIS_fnc_spawnVehicle;

	_techCargo = _opforVic select 1;

	// systemChat format ["DEBUG / SPAWN - _opforVic select 1: %1", _testVar];

	{
		bluforZeus addCuratorEditableObjects [[_x], true];
		systemChat format ["DEBUG / SPAWN - bluforZeus _x: %1", _x];
		sleep 1;
	} forEach _techCargo;


	sleep 5;
	{
		tinmanModule addCuratorEditableObjects [[_x], true];
		systemChat format ["DEBUG / SPAWN - tinmanZeus _x: %1", _x];
		sleep 1;
	} forEach _techCargo;

	_opforVic doMove _target;
	systemChat format ["DEBUG / SPAWN - single tech moved to target: %1", _target];

	RGG_checkDestroy pushBack _opforVic;
	publicVariable "RGG_checkDestroy";
// } else {
// 	systemChat "DEBUG / SPAWN - can't spawn opfor technical as no players are on the ground";
// };

// systemChat format ["DEBUG / SPAWN - RGG_checkDestroy: %1", RGG_checkDestroy];

	
// move order should be a separate func 

// we need to explode these if crew is dead 



// _checkingAlive = true;

// while {_checkingAlive} do {
// 	_isAlive = [_opforVic] call RGGg_fnc_get_aliveCheck;

// 	if (_isAlive) then {
// 		systemChat format ["%1 is alive", _opforVic];
// 	} else {
// 		systemChat format ["%1 is dead", _opforVic];
// 	};

// 	sleep 60;	
// };

// this needs to loop, so when not alive, another is spawned - then we can aply to tanks