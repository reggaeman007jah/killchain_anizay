/*
Will check ammo count of each given unit and return whether unit is good, or if ammo is low 

define - what is considered low?
*/

// params ["_unit"];




while {TRUE} do {

	_groups = allGroups; // gets all known game groups 
	private _RGG_bluforGroups = []; // empty array to store opfor group IDs / names 
	private _RGG_opforGroups = []; // empty array to store opfor group IDs / names DEBUG ONLY 
	private _RGG_indiforGroups = []; // empty array to store opfor group IDs / names 

	// now extract only indifor groups and put into storage array 
	{
		switch ((side _x)) do {
			case INDEPENDENT: { _RGG_indiforGroups pushBackUnique _x };
			case WEST: { _RGG_bluforGroups pushBackUnique _x };
			case EAST: { _RGG_opforGroups pushBackUnique _x };
		};
	} forEach _groups;

	{
		{
			// if (someAmmo _x) then {
			// 	systemChat format ["%1 has ammo", _x];
			// } else {
			// 	systemChat format ["%1 is out of ammo", _x];
			// };
			_magClass = currentMagazine _x;//Example: "30Rnd_545x39_AK"
			_magData = [];
			_mags = magazines _x;
			{
				if (_x == _magClass) then {
					_magData pushBack _x;
				};
			} forEach _mags;
			_magCnt = count _magData;
			systemChat format ["%1 has %2 primary mags", _x, _magCnt];
		} forEach units _x;
	} forEach _RGG_indiforGroups;
	sleep 10;
};
