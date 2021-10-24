// --- Check Destroy --- // 

/*
Checks if vic is uncrewed, and sets damage to 0.9 if so 
Uses global array to iterate through every so often 
*/

while {KILLCHAINISLIVE} do {
	// systemChat "DEBUG / CHECKDESTROY - cycle - checking for empties to destroy";
	// systemChat format ["DEBUG / CHECKDESTROY - RGG_checkDestroy currently contains: %1", RGG_checkDestroy];

	sleep 5;

	_cnt = count RGG_checkDestroy;

	if (_cnt > 0) then {
	systemChat format ["DEBUG / CHECKDESTROY - %1 vics in play held in RGG_checkDestroy", _cnt];
	systemChat str RGG_checkDestroy;
		{
			systemChat format ["DEBUG / CHECKDESTROY - iteration %1 of %2", _x, _cnt];
			_car = _x select 0;
			// systemChat format ["DEBUG / CHECKDESTROY - _car = _x select 0: %1", _car];
			_cargo = _x select 1;
			// systemChat format ["DEBUG / CHECKDESTROY - _cargo = ((_x select 0) select 1): %1", _cargo];
			_cargo1 = (_cargo select 0);
			// systemChat format ["DEBUG / CHECKDESTROY - _cargo1 = (_cargo select 0): %1", _cargo1];
			if (!alive _cargo1) then {
				// systemChat "DEBUG / CHECKDESTROY - _cargo1 is dead";
				systemChat "DEBUG / CHECKDESTROY - _car setDamage 1 ... ?";
				systemChat format ["DEBUG / CHECKDESTROY - car %1 is due for destruction", _car];
				_car setDamage 1;
				RGG_checkDestroy = [];
				publicVariable "RGG_checkDestroy";
				systemChat "RGG_checkDestroy now cleared:";
				systemChat str RGG_checkDestroy;
			};	
		} forEach RGG_checkDestroy;
	} else {
		systemChat "DEBUG / CHECKDESTROY - no opfor vics exist yet";
	};

	sleep 10;
};