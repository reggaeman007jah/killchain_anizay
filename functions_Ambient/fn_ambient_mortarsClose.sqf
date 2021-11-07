// --- generate close explosions without killing any players --- //

/*
This function runs a cycle of checks, and delivers explosions near players, but hopefully not 
too near - this is ambient only 

Only run when mission is live 

*/

// ord choices 
_boom = [
	"ammo_Bomb_SDB",
	"BombCluster_02_Ammo_F",
	"ammo_Missile_HARM",
	"R_80mm_HE"
];

sleep 30;

while {KILLCHAINISLIVE} do {
	
	_cycles = selectRandom [3,4,5,6,7];

	// here we try to simulate periods of attack and periods of non-attack 
	for "_i" from 1 to _cycles do {

		// debug 
		// systemChat format ["DEBUG - SAFE ARTY ITERATION %1 OF %2 RUNNING", _i, _cycles];

		// get all players 
		_data = [];
		{
			_data pushback _x;
		} forEach allPlayers;

		_cnt = count _data;

		if (_cnt > 0) then {
		
			// choose one at random 
			_randomPlayer = selectRandom _data;

			// debug 
			// systemChat format ["random player for safeMortars: %1", _randomPlayer];

			// getPos anchor for calcs 
			_randPlayerPos = getPos _randomPlayer;

			// progresses based on player being in red zone 
			if (_randomPlayer inArea "redzone") then { 
				
				// init sleep - might not need this 
				// sleep 30;

				// decide if GBU (1) or grouping/cluster (2) 
				// _rnd = selectRandom [1,2]; // prod line 
				_rnd = selectRandom [2]; // debug line for testing exitWith in spread 

				// GBU selected 
				if (_rnd == 1) then {
					// i dont want to lose any cycles being implemented due to presence of units
					// need a way to re-run the iteration until I get a free space to explode ord 
					// so use a local bool to manage any re-runs 
					
					_hasFired = false;
					while {!_hasFired} do {

						// systemChat "DEBUG - FIRE LOOP RUNNING - GBU";

						// GBU  
						_dir = random 359;
						_impact = _randPlayerPos getPos [60, _dir];
						_safeZone = createMarker ["safeZone", _impact];
						_safeZone setMarkerShape "ELLIPSE";
						_safeZone setMarkerSize [40, 40];
						_safeZone setMarkerAlpha 0.1;
						sleep 2;

						_unitsSafeZone = allUnits inAreaArray "safeZone";
						// systemChat format ["_unitsSafeZone: %1", _unitsSafeZone];
						_cnt = count _unitsSafeZone;
						systemChat format ["_cnt: %1", _cnt];

						if (_cnt == 0) then {
							// safe to deploy 
							_exp = "Bo_GBU12_LGB" createVehicle _impact;
							_hasFired = true;
							deleteMarker "safeZone";
						} else {
							if (_cnt > 0) exitWith {
								// systemChat "need to re-run GBU calcs";
								deleteMarker "safeZone";
								sleep 5; // this is the re-run delay 
							};
						};
					};

				} else {
					// i dont want to lose any cycles being implemented due to presence of units
					// need a way to re-run the iteration until I get a free space to explode ord 
					// so use a local bool to manage any re-runs 

					_hasFired = false;
					while {!_hasFired} do {

						// systemChat "DEBUG - FIRE LOOP RUNNING - SPREAD";

						// Grouping 
						_dist = selectRandom [180,250];
						_dir = random 359;
						_impact = _randPlayerPos getPos [_dist, _dir];

						_safeZone = createMarker ["safeZone", _impact];
						_safeZone setMarkerShape "ELLIPSE";
						_safeZone setMarkerSize [100, 100];
						_safeZone setMarkerAlpha 0.1;
						sleep 2;

						_unitsSafeZone = allUnits inAreaArray "safeZone";
						// systemChat format ["_unitsSafeZone: %1", _unitsSafeZone];
						_cnt = count _unitsSafeZone;
						// systemChat format ["_cnt: %1", _cnt];

						if (_cnt == 0) then {
							// safe to deploy 
							// systemChat "DEBUG - FIRE IN EFFECT";
							_hits = selectRandom [3,4,5,6,7,8];
							_ord = selectRandom _boom;
							// systemChat format ["_ord: %1", _ord];
							_space = selectRandom [1,2,3,4];
							for "_i" from 1 to _hits do {
								_dir = random 359;
								_dist = selectRandom [0,10,20,40,50,60,70];
								_impact = _impact getPos [_dist,_dir];
								_exp = _ord createVehicle _impact;
								_extraRan = selectRandom [0.2,0.5,0.8];
								_wait = _space + _extraRan;
								sleep _wait; 
							};
							_hasFired = true;
						} else {
							if (_cnt > 0) exitWith {
								// systemChat "re-running spread calcs";
								deleteMarker "safeZone";
								sleep 5; // this is the re-run delay 
							};
						};
					};
				};

				deleteMarker "safeZone";

			} else {
				systemChat "random player selected is NOT in redzone";
			};

		};

		sleep 10; // space between each attack  
	};

	// quiet period where this does not run - less of a break when defending a point  
	// if (RFCHECK2 == true) then {
	// 	sleep 120;
	// } else {
	// 	_quiet = selectRandom [180,300,600];
	// 	sleep _quiet;
	// };
	// _quiet = selectRandom [90, 180, 270, 360];
	_quiet = selectRandom [600, 900];
	sleep _quiet;
};

/*
Note: I am aware that the fire bool runs in both the 1 and 2 (GBU/Spread) outcomes .. 
This may be avoidable, but I couldn't see an easy way to do this, as the bool relates to the safety check, and the 
safety check is done separately, and not universally before the 1 or 2 is decided 
Might try to improve this, but for now it will have to do 