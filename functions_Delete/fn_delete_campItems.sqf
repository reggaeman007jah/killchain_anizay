// --- this will manage deletion of camp items when no players are near --- // 

_campItems = []; // declare local array for this phase of deletion and reset global afterwards

{
	_campItems pushBack _x;
} forEach RGG_CampItems;

RGG_CampItems = []; // reset global array for next event, and use local array for deletion when safe 

_anchor = _campItems select 0; // semi-random anchor pos for camp choosing the first item in the list 
_anchorPos = getPos _anchor;

// --- wait until no players near before deleting --- //

_playersAreNear = true;

while {_playersAreNear} do {
	_dataStore = [];
	{
		_playerPos = getPos _x;
		_dist = _anchorPos distance _playerPos;

		// for testing the dist param will be small, but this should be 500 minimum
		if (_dist < 50) then {
			_dataStore pushback _x;
		};
	} forEach allPlayers;

	_cnt = count _dataStore;

	if (_cnt == 0) then {
		_playersAreNear = false;
		systemChat "debug - players are not near - ok to delete items - you should check though ;)";
		{ deleteVehicle _x } forEach _campItems;
	};

	sleep 60; 
};
