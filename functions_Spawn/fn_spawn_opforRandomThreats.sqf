/*
From: initServer.sqf 

this will not run always, rather be triggered during one or both of the stage loops 
it takes next available point as anchor point 
does not run during endGame 

The _anchor is the next patrol point .. to avoid a boring train of incoming from roughly the same dir, we need 
to spead out other anchors from the base anchor, far enough away while not spawning under players (hopefully)
To do this, we want a t-shape .. so get heading from _anchor to defend-point  
Then work out 90 and 270 relative to the defend-point  
Then get two more anchors ... this is the idea, to be done anotehr time 
For now, just pick a random dir and dist from _anchor .. good enough for now 

spawn random groups of 3 or 4, on outer reaches of battlezone, and send them in 
*/

/*
15 June 2021 
To-do: ensure that these only get spawned if the overall opfor cap has not been reached - set CAP !!
*/

// testing change - made this happen from point 0 
if (patrolPointsTaken >= 0 ) then {
	// this will avoid base spawning on mission start 

	_anchor = _this select 0;

	// get pos in battlezone outer edges 
	_randomEnemySpawnPos = [_anchor, 500, 600, 3, 0, 0, 0] call BIS_fnc_findSafePos; 

	// --- voice alerts --- // 
	// [_randomEnemySpawnPos] execVM "killchain\systems\alertSystems\roamerAlerts.sqf";
	// 05 march 2021 - removing the above alert for now 
	// systemChat format ["enemy roamers spawned: %1", _randomEnemySpawnPos]; 

	_opforGroup = createGroup [east, true];
	_opforTeam = [];
	_base = 10;
	_random = random 10;
	_size = _base + _random + patrolPointsTaken; 

	for "_i" from 1 to _size do {
		_className = [] call RGGg_fnc_get_randomOpforClassname; 
		_unit = _opforGroup createUnit [_className, _randomEnemySpawnPos, [], 0.1, "none"];
		_opforTeam pushBack _unit;
	};

	tinmanModule addCuratorEditableObjects [_opforTeam, true];
	bluforZeus addCuratorEditableObjects [_opforTeam, true];

	// --- random move orders --- //
	_roam = true;
	while {_roam} do {
		
		if (count (units _opforGroup) > 0) then { 
			_randomMovePos = [["redzone"]] call BIS_fnc_randomPos;
			_opforGroup move _randomMovePos;
		} else {
			_roam = false;
		};
		sleep 300
	};
};


// TODO - WORK OUT HOW TO MAKE DIAMOND FORMATION