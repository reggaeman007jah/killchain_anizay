params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
addCamShake [1, 2, 100];
// --- load saved loadout --- // 
[player, [missionNamespace, "inventory_var"]] call BIS_fnc_loadInventory;

// --- manage pickup messages --- //
_respawningDesc = roleDescription _newUnit; // gets role of new unit 


_playerRole = roleDescription player;
// [_playerRole, _interfaceSize] call RGGr_fnc_roles_welcomeText;

switch (_playerRole) do {
	case "Viking 1:1 - Platoon Leader@Viking 1": {
		// object addAction [title, script, arguments, priority, showWindow, hideOnUse, shortcut, condition, radius, unconscious, selection, memoryPoint]
		player addAction ["Page Viking 2 SL", { 
			{
				_role = roleDescription _x;
				if (_role == "Viking 2:1 - Squad Leader@Viking 2") then {
					["CONTACT PLATOON LEADER"] remoteExec ["RGGi_fnc_information_lowerRight", _x];
				};
			} forEach allPlayers;
		}];
		player addAction ["Page Viking 3 SL", { 
			{
				_role = roleDescription _x;
				if (_role == "Viking 2:1 - Squad Leader@Viking 2") then {
					["CONTACT PLATOON LEADER"] remoteExec ["RGGi_fnc_information_lowerRight", _x];
				};
			} forEach allPlayers;
		}];
		player addAction ["Mission Stats", { 
			[] remoteExec ["RGGi_fnc_information_showStats", player];

		}];
		player addAction ["DEBUG - Check assigned player vics", { 
			// _vics = [];
			{
				_assignedVic = assignedVehicle _x;
				// _vics pushBack _assignedVic;
				format ["%1 is assigned to %2", _x, _assignedVic] remoteExec ["systemChat", 0]; 
			} forEach allPlayers;
			// [_vics, player] remoteExec ["RGGu_fnc_utilities_checkAssigned", player];
		}];
		player addAction ["DEBUG - manually unassign all players", { 
			// _vics = [];
			{
				_x assignAsCargo Workaround;
				// unassignVehicle _x;
			} forEach allPlayers;
			// [_vics, player] remoteExec ["RGGu_fnc_utilities_checkAssigned", player];
		}];
		player addAction ["TINMAN - On", { 
			BLUMAN = true;
			publicVariable "BLUMAN";
		}];
		player addAction ["TINMAN - Off", { 
			BLUMAN = false;
			publicVariable "BLUMAN";
		}];
		vamp = false;
		systemChat "you have use of FNC-based voice activated systems";
		[] spawn RGGv_fnc_voice_VAHCO_init;
	};
	default { systemChat "" };
};


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


