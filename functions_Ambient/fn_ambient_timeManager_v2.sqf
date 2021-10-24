// --- Ambient Time FNC - fast day faster night --- //

/*
Note:
	Spawned from initServer
	Has 6 different speeds across 24 game-hours
		x23 speed for majority of the day 
		x15 / x7 for easing in or dawns and dusks 
		x60 for fasted possible night 
	For now always ensure you start the mission in the day!
	Previously used waitUntils, but I think this is better for performance 
	Given the speed, I've chosen a simple 'by hour' check
	Uses 4 time-states to make days fast (x15), nights very fast (x50), and dusk and dawn slightly fast (x2)
	Using _timeManager rather than TRUE enables possibility to break out of or pause fast time if needed 
Actions:
	Remove reliance on mission having to start in day, and instead run an intial check of time and apply bool to suit 
	Create a more gentle transition of time, as x2 to x60 is still harsh and very noticable 
*/


// local bools to manage time-flow 
setTimeMultiplier 23; 	// initial accelerator, runs once before loop (ideally mission is within daytime range)
_timeManager = true; 	// used for main loop 
_fastDay = true; 		// x23 for majority of daytime 
_quickEve = false; 		// x15 gentle easing into night (otherwise night falls too fast)
_quickerEve = false; 	// x7 gentle easing into night (otherwise night falls too fast)
_fastNight = false; 	// x60 fastest night speed 
_quickerMorn = false; 	// x7 gentle easing into day (otherwise day comes in too fast)
_quickMorn = false; 	// x15 gentle easing into day (otherwise day comes in too fast)

while { _timeManager } do {
	
	// setTimeMultiplier starts at 23

	// dusk x15 starts at 6pm 
	if (_fastDay) then {
		if ((date select 3) == 18) then {
			systemChat "DEBUG / TIME MANAGER - it is now 6pm, speed set to x15";
			setTimeMultiplier 15;
			_fastDay = false;
			_quickEve = true;
		};
	};

	// dusk x7 starts at 7pm 
	if (_quickEve) then {
		if ((date select 3) == 19) then {
			systemChat "DEBUG / TIME MANAGER - it is now 7pm, speed set to x7";
			setTimeMultiplier 7;
			_quickEve = false;
			_quickerEve = true;
		};
	};

	// night x60 starts at 7:30pm 
	if (_quickerEve) then {
		// if (((date select 3) == 19) && ((date select 4) == 30)) then {
		if ((date select 3) == 20) then {
			systemChat "DEBUG / TIME MANAGER - it is now 8pm, speed set to x60";
			setTimeMultiplier 60;
			_quickerEve = false;
			_fastNight = true;
		};
	};

	// dawn x7 starts at 5am
	if (_fastNight) then {
		if ((date select 3) == 5) then {
			systemChat "DEBUG / TIME MANAGER - it is 5am, speed set to x7";
			setTimeMultiplier 7;
			_fastNight = false;
			_quickerMorn = true;
		};
	};

	// dawn x15 starts at 5:30am
	if (_quickerMorn) then {
		if (((date select 3) == 6) && ((date select 4) == 30)) then {
			systemChat "DEBUG / TIME MANAGER - it is 6am, speed set to x15";
			setTimeMultiplier 15;
			_quickerMorn = false;
			_quickMorn = true;
		};
	};

	// dawn x15 starts at 5:30am
	if (_quickMorn) then {
		if ((date select 3) == 7) then {
			systemChat "DEBUG / TIME MANAGER - it is 7am, speed set to x23";
			setTimeMultiplier 23;
			_quickMorn = false;
			_fastDay = true;
		};
	};

	sleep 60;
};


// setTimeMultiplier 23; 	
// _timeManager = true; 	 
// _fastDay = true; 		
// _quickEve = false; 		
// _quickerEve = false; 	
// _fastNight = false; 	
// _quickerMorn = false; 	
// _quickMorn = false; 	

// while { _timeManager } do {
// 	if (_fastDay) then {
// 		if ((date select 3) == 18) then {
// 			setTimeMultiplier 15;
// 			_fastDay = false;
// 			_quickEve = true;
// 		};
// 	};
// 	if (_quickEve) then {
// 		if ((date select 3) == 19) then {
// 			setTimeMultiplier 7;
// 			_quickEve = false;
// 			_quickerEve = true;
// 		};
// 	};
// 	if (_quickerEve) then {
// 		if ((date select 3) == 20) then {
// 			setTimeMultiplier 60;
// 			_quickerEve = false;
// 			_fastNight = true;
// 		};
// 	};
// 	if (_fastNight) then {
// 		if ((date select 3) == 4) then {
// 			setTimeMultiplier 7;
// 			_fastNight = false;
// 			_quickerMorn = true;
// 		};
// 	};
// 	if (_quickerMorn) then {
// 		if ((date select 3) == 5 ) then {
// 			setTimeMultiplier 15;
// 			_quickerMorn = false;
// 			_quickMorn = true;
// 		};
// 	};
// 	if (_quickMorn) then {
// 		if ((date select 3) == 6) then {
// 			setTimeMultiplier 23;
// 			_quickMorn = false;
// 			_fastDay = true;
// 		};
// 	};
// 	sleep 60;
// };





































// trigger time for night
waitUntil { (date select 3) == 18 };
systemChat "DEBUG / TIME MANAGER - it is 6pm, time for near-real-time dusk speed";
setTimeMultiplier 15;

waitUntil { (date select 3) == 19 };
systemChat "DEBUG / TIME MANAGER - it is 7pm, time for near-real-time dusk speed";
setTimeMultiplier 2;

waitUntil { (date select 4) == 15 };
systemChat "DEBUG / TIME MANAGER - it is 7:30pm, time for fast night speed";
setTimeMultiplier 60;
RGG_isDay = false;
publicVariable "RGG_isDay";
// spawn RGGs_fnc_spawn_birdDog;
remoteExec ["RGGs_fnc_spawn_birdDog", 2];
execVM "killchain\systems\ambientSystems\flares.sqf";
// here we create the possibility of a VC night attack - this will always run, but won't always yeild enemies 

// get indi player
_dataStore = [];
{
	if ((side _x) == INDEPENDENT) then { _dataStore pushback _x }
} forEach allPlayers;
_cnt = count _dataStore;

if (_cnt > 0) then {
	// commander is considered alive
	systemChat "Tinman is alive";
	_commander = _dataStore select 0;
	_commPos = getPos _commander;
	_spawnPos = [_commPos, 400, 400, 10, 0, 1, 0, 400] call RGGf_fnc_find_locationNoPlayers;
	// [_spawnPos, _commPos] remoteExec ["RGGs_fnc_spawn_opforNightOps", 2];
	[_spawnPos, _commPos] spawn RGGs_fnc_spawn_opforNightOps;
};

// trigger time for day 
waitUntil { (date select 3) == 5 };
systemChat "DEBUG / TIME MANAGER - it is 5am, time for slow dawn-break";
setTimeMultiplier 2;

waitUntil { (date select 4) == 25 };
systemChat "DEBUG / TIME MANAGER - it is 5:30am, time for slow day speed";
setTimeMultiplier 23;
RGG_isDay = true;
publicVariable "RGG_isDay";

// 2:25 per hour at this speed 
// 14 hours at day speed 
// 34 mins per daylight cycle 

remoteExec ["RGGa_fnc_ambient_timeManager", 2]; // rerun this fnc on server only  


// while {true} do {
// 	_dawn = _sunriseSunsetTime select 0;
// 	_dusk = _sunriseSunsetTime select 1;
// 	_hour = date select 3;
// 	systemChat format ["dawn: %1", _dawn];
// 	systemChat format ["dusk: %1", _dusk];
// 	systemChat format ["hour: %1", _hour];
// 	if (_hour > _dawn) then {
// 		systemChat "is day";
// 		// systemChat format ["setTimeMultiplier: %1", setTimeMultiplier];
// 	} else {
// 		systemChat "is night";
// 		// systemChat format ["setTimeMultiplier: %1", setTimeMultiplier];
// 	};
// 	// systemChat format ["current time hour: %1", date select 3];
// 	sleep 10;
// };

