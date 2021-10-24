_data = _this select 0; // = player data from thisList (from mission trigger)
_player = _data select 0;
[_player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;

["Loadout Saved"] remoteExec ["RGGi_fnc_information_lowerRight", _player]; 


// _loadout = getUnitLoadout [_plr, true];
// _loadout = getUnitLoadout _plr;
// hint str _loadout;

// sleep 3;

// {
// 	// hint str _x;
// 	_loadout = getUnitLoadout _x;
// 	hint str _loadout;
// } forEach allPlayers;


