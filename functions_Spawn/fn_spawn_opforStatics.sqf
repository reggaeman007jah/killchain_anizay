// --- create statics and mortars --- //
_objPos = _this select 0;
_enemyDir = _this select 1;

// action - is there a sandbag mortar ?
// action - point guns towards init point 

// --- statics --- //
_random = selectRandom [2,3,4,5];
for "_i" from 1 to _random do {

	_grp = createGroup [east, true];
	_manned = [] call RGGg_fnc_get_randomOpforClassname; 
	_class = [] call RGGg_fnc_get_randomOpforStaticClassname; 
	_pos = [_objPos, 0, 50] call BIS_fnc_findSafePos;
	_unit = _grp createUnit [_manned, _pos, [], 1, "none"];
	_unit addMPEventHandler ["MPKilled", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		if (isPlayer _killer) then {
			RGG_bluforKills = RGG_bluforKills + 1;
			publicVariable "RGG_bluforKills";
		} else {
			RGG_indiforKills = RGG_indiforKills + 1;
			publicVariable "RGG_indiforKills";
		};	
	}];
	_static = _class createVehicle _pos;
	_unit moveInGunner _static;
	_unit setBehaviour "COMBAT";
	// setDir ??
	// tinmanModule addCuratorEditableObjects [[_static, _unit], true];
	bluforZeus addCuratorEditableObjects [[_static, _unit], true]; 								
};

// --- mortars --- //
_random = selectRandom [0,1,2,3];
for "_i" from 1 to _random do {

	_grp = createGroup [east, true];
	_manned = [] call RGGg_fnc_get_randomOpforClassname; 
	_classes = [
		"O_G_Mortar_01_F"
		// "vn_o_nva_65_static_mortar_type53",
		// "vn_o_nva_65_static_mortar_type63"
	];
	_class = selectRandom _classes;
	_startPos = _this select 0;
	_pos = [_startPos, 0, 100] call BIS_fnc_findSafePos;
	_unit = _grp createUnit [_manned, _pos, [], 1, "none"];
	_unit addMPEventHandler ["MPKilled", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		if (isPlayer _killer) then {
			RGG_bluforKills = RGG_bluforKills + 1;
			publicVariable "RGG_bluforKills";
		} else {
			RGG_indiforKills = RGG_indiforKills + 1;
			publicVariable "RGG_indiforKills";
		};	
	}];
	_static = _class createVehicle _pos;
	_unit moveInGunner _static;
	_unit setBehaviour "COMBAT";

	// tinmanModule addCuratorEditableObjects [[_static, _unit], true];
	bluforZeus addCuratorEditableObjects [[_static, _unit], true];								
};



// if (patrolPointsTaken > 1) then {
// 	_random = selectRandom [2,3];
// 	for "_i" from 1 to _random do {
// 		[_objPos] execVM "killchain\systems\spawnerSystems\spawnEnemyStatics.sqf";  								
// 	};
// };

// if (patrolPointsTaken > 2) then {
// 	_random = selectRandom [2,3];
// 	for "_i" from 1 to _random do {
// 		[_objPos] execVM "killchain\systems\spawnerSystems\spawnEnemyMortars.sqf";  								
// 	};
// };