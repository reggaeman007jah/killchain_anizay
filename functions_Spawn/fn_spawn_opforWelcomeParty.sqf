// --- welcome party --- //

_initStartPos = _this select 0; // move pos for opfor wlecome party  
_objPos = _this select 1; // anchor pos for spawning  

// diff modifier i.e. number of iterations 
_diffLevel = 2; 
// tbc add patrolPoint accelerator 

for "_i" from 1 to _diffLevel do {
	_grp = createGroup [east, true];
	_rndOp1 = selectRandom [5, 10, 15];
	systemchat format ["debug - welcome party numbers: %1", _rndOp1];

	for "_i" from 1 to _rndOp1 do {
		_pos = [_objPos, 0, 30] call BIS_fnc_findSafePos; 
		_rndtype = [] call RGGg_fnc_get_randomOpforClassname; 
		_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"]; 
		_unit setBehaviour "COMBAT";
		_unit doMove _initStartPos; 
		// spawnedOpforUnit = spawnedOpforUnit + 1;
		tinmanModule addCuratorEditableObjects [[_unit], true];
		bluforZeus addCuratorEditableObjects [[_unit], true];	
		sleep 2;						
	};
	sleep 5;
};
systemChat "debug - opfor welcome party done";
