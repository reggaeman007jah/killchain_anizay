// --- testing near entities --- // 

sleep 30; // enable startup ok 

while {KILLCHAINISLIVE} do {
	
	// count vehicle entities in redzone 
	// has to be triggered once after redzone exists 
	// get all vics 
	// split into faction arrays 

	// count opfor vics, specifically techs from classlist 
	// if none, create and send 
	// if 1+ send to rand player in redzone on ground 

	// count blufor vics 
	// if none, create in PF and send close to random player 
	// if 1+ moce close to rand player pos 

	// position nearEntities [type, radius]

	// anchor pos  
	_anchor = getMarkerPos "redzone";

	_cars = _anchor nearEntities ["car", 2000];
	systemChat format ["DEBUG / TEST - cars in redzone: %1", _cars];

	_opforVics = [];
	_bluforVics = [];
	{
		if (side _x == east) then {
			_opforVics pushback _x;
		};
		if (side _x == west) then {
			_bluforVics pushback _x;
		};
	} forEach _cars;

	_cntOp = count _opforVics;
	_cntBl = count _bluforVics;
	systemChat format ["DEBUG / TEST - no. of Opf cars in redzone: %1", _cntOp];
	// systemChat format ["DEBUG / TEST - no. of Blf cars in redzone: %1", _cntBl];

	if (_cntOp == 0) then {
		RGG_checkDestroy = [];
		publicVariable "RGG_checkDestroy";
		systemChat "DEBUG / TEST - RGG_checkDestroy now cleared as vic count is 0:";
		systemChat str RGG_checkDestroy;
		sleep 1;
		// make one and send in 
		[_anchor] spawn RGGs_fnc_spawn_opforTechnicals; 
		systemChat "DEBUG / TEST - Technical Created";
	} else {
		// send all to a player 
		systemChat format ["DEBUG / TEST - %1 existing technicals being sent to a player", _cntOp];
		_targetPlayer = call RGGg_fnc_get_randomPlayerOnGround;

		/*
			19 OCTOBER - ACTION - WHEN OBJNULL IS TESTED OK, REPLACE THIS CODE WITH FNC 
		*/


		if (isNull _targetPlayer) then {
			systemChat "there are no players on the ground";
		} else {
			systemChat "there is a player on ground";
			_target = getPos _targetPlayer;
			// _opforVic doMove _target;
			{
				_dir = random 359;
				_dist = random 100;
				_dest = _target getPos [_dist, _dir];
				_x domove _dest;
				// systemChat "DEBUG / TEST - Technical Moving to player";
				systemChat format ["DEBUG / TEST - %1 Technical Moving to player %2 at position %3", _x, _targetPlayer, _target];
			} forEach _opforVics;
		};
	};

	if (_cntBl == 0) then {
		RGG_checkDestroyBlufor = [];
		publicVariable "RGG_checkDestroyBlufor";
		systemChat "DEBUG / TEST - RGG_checkDestroyBlufor now cleared as vic count is 0:";
		systemChat str RGG_checkDestroyBlufor;
		sleep 1;
		// make one and send in 
		_target = getMarkerPos "redzone";
		[] spawn RGGs_fnc_spawn_bluforTechnicals; 
		systemChat "DEBUG / TEST - Blufor Technical Created";
	} else {
		{
			_randomMovePos = [["redzone"]] call BIS_fnc_randomPos;
			_x move _randomMovePos;
		} forEach _bluforVics;
		sleep 300;
	};

	sleep 600;
};

/*
notes 
we are testing:
does the blufor technicals idea work without issue? Will it spawn fine, and wait in hanger, and then 
move to random points every 300?

can we see opfor defenders in zeus?
