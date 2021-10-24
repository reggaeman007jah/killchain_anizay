params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

// --- load saved loadout --- // 
[player, [missionNamespace, "inventory_var"]] call BIS_fnc_loadInventory;

// --- manage pickup messages --- //
_respawningDesc = roleDescription _newUnit; // gets role of new unit 

// first, determine if any raptors in game 
_raptors = false;
{
	_playerRole = roleDescription _x;

	if ( (_playerRole == "Raptor 1 - Squadron Leader@Raptor") or (_playerRole == "Raptor 2 - Squadron 2IC@Raptor") ) then {
		_raptors = true;
	};
} forEach allPlayers;

// ignore any raptors and only send message to non-raptors, and then send a message dependent on whether there are actually raptors in-game 
if ((_respawningDesc == "Raptor 1 - Squadron Leader@Raptor") or (_respawningDesc == "Raptor 2 - Squadron 2IC@Raptor")) then {
	systemChat "placeholder for Raptor killed message - maybe Padre?";
} else {
	{
		_playerRole = roleDescription _x;

		if ( (_playerRole == "Raptor 1 - Squadron Leader@Raptor") or (_playerRole == "Raptor 2 - Squadron 2IC@Raptor") ) then {
			["SOULS AT PATHFINDER!"] remoteExec ["RGGi_fnc_information_lowerRight", _x];
		} else {
			if (_raptors) then {
				["RAPTORS HAVE BEEN ALERTED!"] remoteExec ["RGGi_fnc_information_lowerRight", _newUnit];
			} else {
				["NO RAPTORS AVAILABLE"] remoteExec ["RGGi_fnc_information_lowerRight", _newUnit];
			};
		};
	} forEach allPlayers;
};


