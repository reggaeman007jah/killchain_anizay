// this checks for altitude, and if in mission AO, will deploy troops off heli onto ground 
// automatically when heli has landed 

_heli = _this select 0;
_cargo = _this select 1;

_redCheck = true; // used to check if the heli is in the mission AO (i.e. redzone)
_altCheck = false; // when confirmed as in AO (dropzone), this is used to track AGL 

while {_redCheck} do {
	systemChat "_redCheck - not in redzone";
	if (isEngineOn _heli) then {
		_pos = getPos _heli;  
		_inRed = _pos inArea "redzone";
		if (_inRed) then {
			_redCheck = false;
			_altCheck = true;
			systemChat "_redCheck - heli is in redzone - switching to alt-check";
		};
	} else {
		// this should shut everything down if the engine is turned off
		_redCheck = false;
	};
	sleep 10;
};

while {_altCheck} do {
	systemChat "_altCheck running as heli is in redzone";

	if (isEngineOn _heli) then {
		_atl1 = (getPosATL _heli) select 2;
		_atl1 = round _atl1;

		if ((_atl1) < 2.5) then {

			// we need to ensure heli is not only low, but also stationary before unloading 
			_speed = speed _heli;
			if (_speed < 1) then {
				systemChat "debug - speed is less than 1";
				systemChat format ["_cargo: %1", _cargo];
				sleep 1;
				if (_speed < 1) then {
					// second speed check is to ensure heli is not bouncing around 
					_markerName = str _heli; 
					systemChat format ["_markerName: %1", _markerName];
					_extractLocation = position _heli;
					_extractMarker = createMarker [_markerName, _extractLocation];
					_extractMarker setMarkerShape "ELLIPSE";
					_extractMarker setMarkerColor "ColorRed";
					_extractMarker setMarkerSize [20, 20];

					sleep 1;

					{
						unassignVehicle _x;
						systemChat format ["Unassigning unit: %1", _x];
						sleep 1;
					} forEach _cargo;

					_units = allUnits inAreaArray _markerName;
					_units orderGetIn false;

					_dataStore = [];
					{
						if ((side _x) == INDEPENDENT) then { _dataStore pushback _x }
					} forEach allPlayers;

					_cnt = count _dataStore;
					if (_cnt == 1) then {
						// there is an indifor player in game - move to player pos 
						_commander = _dataStore select 0;
						_commPos = getPos _commander;
						{
							_x setBehaviour "COMBAT";
							_x move _commPos;
						} forEach _units;
					} else {
						// no indifor player in game - move AI to obj pos 
						systemChat "confirmed - no indifor player in game";
						_movePos = getMarkerPos 'REDZONE';
						_units = allUnits inAreaArray _markerName;
						_cargoCount = count _cargo;
						systemChat format ["_cargoCount: %1", _cargoCount];

						for "_i" from 1 to 4 do {
							_freeCargoPositions = _heli emptyPositions "cargo";
							systemChat format ["Empty positions: %1", _freeCargoPositions];
							_cargoCount = count _cargo;
							if (_freeCargoPositions >= _cargoCount) then {
								systemChat "heli is empty";
							};
							sleep 5;
						};

						systemChat "check has finished";
						sleep 5;
						systemChat "move orders ...";
						{
							_x setBehaviour "COMBAT";
							_x doMove _movePos;
							systemChat format ["Unit %1 moving to %2", _x, _movePos];	
							sleep 1;
						} forEach _cargo;
					};
					_altCheck = false;
					deleteMarker _markerName;
				};
			};
		};
	} else {
		// this should shut everything down if the engine is turned off
		_altCheck = false;
	};
	sleep 2;
};

