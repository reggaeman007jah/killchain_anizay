// --- opfor base defenders --- //

_objPos = _this select 0; // anchor pos for spawning  

_rndOp1 = selectRandom [20]; // consider variation of this .. maybe linked to points taken?
_grp = createGroup [east, true];
systemchat format ["debug - opfor numbers for camp defence: %1", _rndOp1]; // debug 

for "_i" from 1 to _rndOp1 do {
	_rndtype = [] call RGGg_fnc_get_randomOpforClassname; 
	_pos = [_objPos, 0, 40] call BIS_fnc_findSafePos;
	_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
	// tinmanModule addCuratorEditableObjects [[_unit], true];
	bluforZeus addCuratorEditableObjects [[_unit], true];
	_randomDir = selectRandom [270, 290, 01, 30, 90];
	_randomDist = selectRandom [5, 25, 50, 75]; 
	_endPoint = _objPos getPos [_randomDist, _randomDir];
	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint;
	// spawnedOpforUnit = spawnedOpforUnit +1;
 	sleep 1;									
};

systemChat "debug - defenders created";


