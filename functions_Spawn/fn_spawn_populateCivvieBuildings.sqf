// --- populate injured civvies in buildings --- // 

/*
runs on a loop and places opfor units inside buildings 
despawns assets when no more players are near 
*/

while {true} do {
	
	systemChat "DEBUG / POPULATECIVVIE - starting checkLoop";

	// get players on ground - choose one 
	// _chosenPlayer = call RGGg_get_randomPlayerOnGround;

	/*
		19 OCTOBER - ACTION - WHEN OBJNULL IS TESTED OK, REPLACE THIS CODE WITH FNC 
	*/
	_playersOnGround = [];

	{
		_pos = getPos _x;
		_alt = _pos select 2;
		if (_alt < 2) then {
			_playersOnGround pushBack _x;
		};
	} forEach allPlayers;
	_rndPlayerOnGround = selectRandom _playersOnGround;
	systemChat format ["DEBUG / POPULATEOPFOR - returning rand player on ground on ground: %1", _rndPlayerOnGround];
	
	// take position location
	_targetPos1 = getPos _rndPlayerOnGround;

	// are we far enough away from our safezone 
	_base = getMarkerPos "pathfinderBase";
	_safeZone = _base distance _targetPos1;

	if (_safeZone > 500) then {
	
		// wait  
		sleep 15;

		// take new position location
		_targetPos2 = getPos _rndPlayerOnGround;

		// calc direction of travel 
		_direction = _targetPos1 getDir _targetPos2;

		// create marker ahead of player 
		_spawnAnchor = _targetPos2 getPos [150, _direction];

		// debug marker 
		deleteMarker "populateOpfor"; // delete main debug marker - just in case ??
		_base = createMarker ["populateOpfor", _spawnAnchor];
		_base setMarkerShape "ELLIPSE";
		// _base setMarkerColor "ColorGreen";
		_base setMarkerSize [100, 100];
		_base setMarkerAlpha 0.1;

		// make sure no players are in the spawn area!
		_unitsSpawn = allUnits inAreaArray "populateOpfor";
		_nearPlayers = [];
		{
			if (_x == player) then {
				_nearPlayers pushBackUnique _x;
			};
		} forEach _unitsSpawn;

		_cnt1 = count _nearPlayers;

		if (_cnt1 == 0) then {
			// there are no players near, so can carry on 
			// populate some buildings --------------------

			// test 
			_list = _spawnAnchor nearObjects ["House", 100]; // get all houses within 100m of _building1Pos

			_buildingData = []; // init declaration of array 
			// here we cycle through all of the results found, putting them in this array ready for sending 
			{
				_buildingData pushBack _x;
			} forEach _list;

			_countBD = count _buildingData; // debug count building results 
			systemChat format ["DEBUG / POPULATEOPFOR - _buildingData contains %1 buildings", _countBD];

			if (_countBD > 0) then {
				
				_enemyClasses = [
					"LOP_BH_Infantry_AT",
					"LOP_BH_Infantry_GL",
					"LOP_BH_Infantry_AR",
					"LOP_BH_Infantry_SL",
					"LOP_BH_Infantry_TL",
					"LOP_BH_Infantry_AR_Asst",
					"LOP_BH_Infantry_Rifleman",
					"LOP_BH_Infantry_Corpsman",
					"LOP_BH_Infantry_Rifleman_lite",
					"LOP_BH_Infantry_Marksman"
				];

				_iteration = 0; // used for controlling the overall count 
				_spawnedInjured = 0; // used as a cutoff system, here we stop processing at 5 civilians 
				_markersToDelete = []; // used to manage cleanup of debug markers after extract 

				{
					_iteration = _iteration +1; 

					// exit if limit reached 
					if (_spawnedInjured == 7) exitWith { systemChat "DEBUG / INVESTIGATE 1 - spawn limit of 5 reached" };
					
					systemChat format ["DEBUG / POPULATE -  spawn iteration %1", _iteration];

					_pos = getPos _x; // get building pos of each iterated item in building data - used for markers 
					_positions = [_x] call BIS_fnc_buildingPositions; // get building positions of each iterated item in building data 
					
					_countPositions = count _positions;
					systemChat format ["DEBUG / POPULATE - this building has %1 available positions", _countPositions];

					if (_countPositions > 0) then {
						
						_randomPosition = selectRandom _positions; // one random pos from above array 
						systemChat format ["DEBUG / POPULATE - _randomPosition chosen: %1", _randomPosition];
						
						_civGroup = createGroup [east, true]; 
						_class = selectRandom _enemyClasses;
						_unit = _civGroup createUnit [_class, _randomPosition, [], 0.1, "none"]; 
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

						// tinmanModule addCuratorEditableObjects [[_unit], true];
						bluforZeus addCuratorEditableObjects [[_unit], true];

						_spawnedInjured = _spawnedInjured +1;
						_markerName = str _unit;
						_markersToDelete pushBack _markerName;

						_objective1 = createMarker [_markerName, _randomPosition];
						_objective1 setMarkerShape "ELLIPSE";
						// _objective1 setMarkerColor "ColorBlue";
						_objective1 setMarkerSize [10, 10];
						_objective1 setMarkerAlpha 0.1;

						systemChat format ["DEBUG / POPULATE - unit %1 created at position %2", _unit, _randomPosition];
						// _unit disableAI "move";
						_unit forceSpeed 0; // testing this 
						_stance = selectRandom [1,2,3];
						switch (_stance) do {
							case 1: { _unit setUnitPos "down" };
							case 2: { _unit setUnitPos "up" };
							case 3: { _unit setUnitPos "middle" };
							default { systemChat "error with injured stances" };
						};	
					};

					sleep 0.5;
				} forEach _buildingData;

				// populate some buildings -------------------- END

				// trigger player check - despawn when no more players are near 
				_checkPlayersNear = true;

				while {_checkPlayersNear} do {
					// are there players near to area? 
					// if no, then delete all 
					_data = [];
					{
						_pos = getPos _x;
						_dist = _pos distance _spawnAnchor;
						if (_dist < 300) then {
							_data pushBackUnique _x;
						};
					} forEach allPlayers; 

					_cnt = count _data;
					if (_cnt == 0) then {
						{
							deleteMarker _x; // delete opfor pos markers 
						} forEach _markersToDelete;
						_toProcess = allUnits inAreaArray "populateOpfor";
						{
							if ((side _x) == EAST) then {
								deleteVehicle _x;
							};
						} forEach _toProcess;
						{
							deleteVehicle _x;
						} forEach allDead;
						deleteMarker "populateOpfor"; // delete main debug marker
						_checkPlayersNear = false;

					};

					sleep 30; // make much longer 
				};
			};
		};
	} else {
		systemChat "DEBUG / POPULATEOPFOR - too close to base - no result";
	};
	sleep 30;
};

/*

to-do

make sure no players are in area for spawning - we dont want things spawning on top of players - DONE

make the opfor rotate direction - 
remove any positions that are not on roof to preserve immersion
then generate system to find buildings that have no opfor in, and have roof, then spawn below and get them to move to that position
run system to get each opfor to move to highest point in building 