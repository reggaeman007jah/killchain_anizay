
["media\video\ident.ogv"] spawn BIS_fnc_playVideo;
sleep 11;
[1, "BLACK", 5] spawn BIS_fnc_fadeEffect;
// _video = ["media\video\ident.ogv"] call BIS_fnc_playVideo;

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

// remove shift map clicks 
// onMapSingleClick {_shift};

// remove stamina 
// player enableStamina FALSE;
// player addEventHandler ['Respawn',{ player enableStamina FALSE }];

// adjust sway 
player setCustomAimCoef 0.9;
player addEventHandler ['Respawn',{ player setCustomAimCoef 0.9 }];

sleep 1;

// untested !!
// tinmanModule addCuratorEditableObjects [[player], true];

// private _playerFaction = faction player;
// systemChat format ["you are %1 faction", _playerFaction];

// if (_playerFaction == "I_ARVN") then {
// 	vamp = false;
// 	systemChat "you have use of FNC-based voice activated systems";
// 	// execVM "voiceactivatedhighcommand\VAHCO_init.sqf";
// 	[] spawn RGGv_fnc_voice_VAHCO_init;
// };

// systemChat "DEBUG / EH - Init Player Local Heal EH Running"; // what is this????


// player addEventHandler ["HandleHeal", {
// 	params ["_unit", "_healer", "_isMedic"];

// 	if ((side _unit) == CIVILIAN) then {
// 		systemChat format ["------------- testing heal EH - %1 was healed", _unit];
// 	};
// }];

// this will enable role-specific scripts and systems to be run for certain players in leadership roles  

_res = getResolution;
_interfaceSize = _res select 5;

_playerRole = roleDescription player;
[_playerRole, _interfaceSize] call RGGr_fnc_roles_welcomeText;

switch (_playerRole) do {
	case "Viking 1:1 - Platoon Leader@Viking 1": {
		// object addAction [title, script, arguments, priority, showWindow, hideOnUse, shortcut, condition, radius, unconscious, selection, memoryPoint]
		player addAction ["Announce Rock Briefing", { 
			// params ["_target", "_caller", "_actionId", "_arguments"];
			["ROCK BRIEFING IN 1 MINUTE"] remoteExec ["RGGi_fnc_information_briefing", 0];	
			player removeAction 20;
		}, nil, 6, false, true];
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
		// player addAction ["START MISSION", { 
		// 	_vics = [];
		// 	{
		// 		_assignedVic = assignedVehicle _x;
		// 		_vics pushBack _assignedVic;
		// 	} forEach allPlayers;
		// 	[_vics, player] remoteExec ["RGGu_fnc_utilities_checkAssigned", player];
		// }];
		// [_interfaceSize] spawn RGGr_fnc_roles_platoonLead;
		// ["PATROL IS NOW LIVE"] remoteExec ["RGGi_fnc_information_lowerRight", 0]; 
		vamp = false;
		systemChat "you have use of FNC-based voice activated systems";
		// execVM "voiceactivatedhighcommand\VAHCO_init.sqf";
		[] spawn RGGv_fnc_voice_VAHCO_init;
	};
	// case "Viking 1:2 - Platoon 2IC / Padre@Viking 1": 	{ [_interfaceSize] spawn RGGr_fnc_roles_2IC; };
	// case "Viking 1:3 - Platoon Sniper@Viking 1": 		{ [_interfaceSize] spawn RGGr_fnc_roles_sniper; };

	// case "Viking 2:1 - Squad Leader@Viking 2": 			{ ["You are Viking 2:1 / Viking 2 Actual / Squad Leader",_interfaceSize] spawn RGGr_fnc_roles_teamLead; };
	// case "Viking 2:2 - Combat Medic@Viking 2": 			{ ["You are Viking 2:2 / Viking 2 Medic",_interfaceSize] spawn RGGr_fnc_roles_medic; };
	// case "Viking 2:3 - LMG@Viking 2": 					{ ["You are Viking 2:3 / Viking 2 LMG",_interfaceSize] spawn RGGr_fnc_roles_LMG; };
	// case "Viking 2:4 - AT Specialist@Viking 2":			{ ["You are Viking 2:4 / Viking 2 AT",_interfaceSize] spawn RGGr_fnc_roles_AT; };
	// case "Viking 2:5 - GPMG@Viking 2":					{ ["You are Viking 2:5 / Viking 2 GPMG",_interfaceSize] spawn RGGr_fnc_roles_GPMG; };
	// case "Viking 2:6 - Combat Engineer@Viking 2":		{ ["You are Viking 2:6 / Viking 2 Combat Engineer",_interfaceSize] spawn RGGr_fnc_roles_engineer; };
	// case "Viking 2:7 - Grenadier@Viking 2":				{ ["You are Viking 2:7 / Viking 2 Grenadier",_interfaceSize] spawn RGGr_fnc_roles_grenadier; };

	// case "Viking 3:1 - Squad Leader@Viking 3": 			{ ["You are Viking 3:1 / Viking 3 Actual / Squad Leader",_interfaceSize] spawn RGGr_fnc_roles_teamLead; };
	// case "Viking 3:2 - Combat Medic@Viking 3": 			{ ["You are Viking 3:2 / Viking 3 Medic",_interfaceSize] spawn RGGr_fnc_roles_medic; };
	// case "Viking 3:3 - LMG@Viking 3": 					{ ["You are Viking 3:3 / Viking 3 LMG",_interfaceSize] spawn RGGr_fnc_roles_LMG; };
	// case "Viking 3:4 - AT Specialist@Viking 3":			{ ["You are Viking 3:4 / Viking 3 AT",_interfaceSize] spawn RGGr_fnc_roles_AT; };
	// case "Viking 3:5 - GPMG@Viking 3":					{ ["You are Viking 3:5 / Viking 3 GPMG",_interfaceSize] spawn RGGr_fnc_roles_GPMG; };
	// case "Viking 3:6 - Combat Engineer@Viking 3":		{ ["You are Viking 3:6 / Viking 3 Combat Engineer",_interfaceSize] spawn RGGr_fnc_roles_engineer; };
	// case "Viking 3:7 - Grenadier@Viking 3":				{ ["You are Viking 3:7 / Viking 3 Grenadier",_interfaceSize] spawn RGGr_fnc_roles_grenadier; };

	// case "Raptor 1 - Squadron Leader@Raptor": 			{ [_interfaceSize] spawn RGGr_fnc_roles_raptor1; };
	// case "Raptor 2 - Squadron 2IC@Raptor": 				{ [_interfaceSize] spawn RGGr_fnc_roles_raptor2; };

	default { systemChat "" };
};


// // ----- Start GUI calcs -----
// execVM "dialogs\introText.sqf";
// ["<img image='media\images\Anizay2.jpg' />",0,0,10,1,0,9459] spawn bis_fnc_dynamicText;



/*
Ideas to try 

spawn vics and send them to AT specs 
spawn building opfor near to TL 
	here, if mission is running create on path to obj, if no mission running, create marker to inv 
enable Padre / Raptors to inform tasking system so everyone knows what's going on in the sky 
trigger a role briefing system using cutRSC for each player 
*/

[missionnamespace,"arsenalClosed", {
	[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;
	titletext ["LOADOUT SAVED", "PLAIN DOWN"];
}] call bis_fnc_addScriptedEventhandler;