
MEDIVAC addEventHandler ["Engine", {
	params ["_vehicle", "_engineState"];

	if (_engineState == true) then {
		systemChat "engine is on";
		deleteMarker "_medivac";
	} else {
		systemChat "engine is off";
		// send get in order to any local civvies 

		_basePos = getPos medicalLZ;
		_heliPos = getPos MEDIVAC;
		_dist = _heliPos distance _basePos;

		// this manages unloading when back at base 
		if (_dist < 40) then {
			systemChat "you are near your medical base";
			
			_unloaded = [];
			
			{ 
				unassignVehicle _x; 
				_unloaded pushBack _x;
			} forEach crew MEDIVAC;

			// _units = allUnits inAreaArray "extract";
			(crew MEDIVAC) orderGetIn false;

			{
				_x setUnitPos "up";
				_x doMove [8336.46,7121.02,0.0807266];
			} forEach _unloaded;

			// [] spawn RGGd_delete_processInjured;
			execVM "killchain\systems\deSpawnerSystems\processInjured.sqf";
			// sends them to med bay, deletes them and converts to points 

		} else {
			// sends this to a non-FNC, and from there calls the FNC 
			[MEDIVAC] execVM "killchain\systems\EH_Links\medivacEngineOff.sqf";
			systemChat "running killchain\systems\EH_Links\medivacEngineOff.sqf";
		}; 
	};
}];

