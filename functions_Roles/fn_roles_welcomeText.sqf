/*
Will provide role-specific text to player on mission start 
*/

systemChat "DEBUG - ROLES SWITCH RUNNING";

_playerRole = _this select 0;
_interfaceSize = _this select 1;

switch (_playerRole) do {
	case "Viking 1:1 - Platoon Leader@Viking 1": 		{ [_interfaceSize] spawn RGGr_fnc_roles_platoonLead; };
	case "Viking 1:2 - Platoon 2IC / Padre@Viking 1": 	{ [_interfaceSize] spawn RGGr_fnc_roles_2IC; };
	// case "Viking 1:3 - Platoon Sniper@Viking 1": 		{ [_interfaceSize] spawn RGGr_fnc_roles_sniper; };

	case "Viking 2:1 - Squad Leader@Viking 2": 			{ ["You are Viking 2:1 / Viking 2 Actual / Squad Leader",_interfaceSize] spawn RGGr_fnc_roles_teamLead; };
	case "Viking 2:2 - Combat Medic@Viking 2": 			{ ["You are Viking 2:2 / Viking 2 Medic",_interfaceSize] spawn RGGr_fnc_roles_medic; };
	case "Viking 2:3 - LMG@Viking 2": 					{ ["You are Viking 2:3 / Viking 2 LMG",_interfaceSize] spawn RGGr_fnc_roles_LMG; };
	case "Viking 2:4 - AT Specialist@Viking 2":			{ ["You are Viking 2:4 / Viking 2 AT",_interfaceSize] spawn RGGr_fnc_roles_AT; };
	case "Viking 2:5 - GPMG@Viking 2":					{ ["You are Viking 2:5 / Viking 2 GPMG",_interfaceSize] spawn RGGr_fnc_roles_GPMG; };
	case "Viking 2:6 - Combat Engineer@Viking 2":		{ ["You are Viking 2:6 / Viking 2 Combat Engineer",_interfaceSize] spawn RGGr_fnc_roles_engineer; };
	case "Viking 2:7 - Grenadier@Viking 2":				{ ["You are Viking 2:7 / Viking 2 Grenadier",_interfaceSize] spawn RGGr_fnc_roles_grenadier; };
	case "Viking 2:8 - Sniper@Viking 2":				{ ["You are Viking 2:8 / Viking 2 Sniper",_interfaceSize] spawn RGGr_fnc_roles_sniper; };

	case "Viking 3:1 - Squad Leader@Viking 3": 			{ ["You are Viking 3:1 / Viking 3 Actual / Squad Leader",_interfaceSize] spawn RGGr_fnc_roles_teamLead; };
	case "Viking 3:2 - Combat Medic@Viking 3": 			{ ["You are Viking 3:2 / Viking 3 Medic",_interfaceSize] spawn RGGr_fnc_roles_medic; };
	case "Viking 3:3 - LMG@Viking 3": 					{ ["You are Viking 3:3 / Viking 3 LMG",_interfaceSize] spawn RGGr_fnc_roles_LMG; };
	case "Viking 3:4 - AT Specialist@Viking 3":			{ ["You are Viking 3:4 / Viking 3 AT",_interfaceSize] spawn RGGr_fnc_roles_AT; };
	case "Viking 3:5 - GPMG@Viking 3":					{ ["You are Viking 3:5 / Viking 3 GPMG",_interfaceSize] spawn RGGr_fnc_roles_GPMG; };
	case "Viking 3:6 - Combat Engineer@Viking 3":		{ ["You are Viking 3:6 / Viking 3 Combat Engineer",_interfaceSize] spawn RGGr_fnc_roles_engineer; };
	case "Viking 3:7 - Grenadier@Viking 3":				{ ["You are Viking 3:7 / Viking 3 Grenadier",_interfaceSize] spawn RGGr_fnc_roles_grenadier; };
	case "Viking 3:8 - Sniper@Viking 3":				{ ["You are Viking 3:8 / Viking 3 Sniper",_interfaceSize] spawn RGGr_fnc_roles_sniper; };

	case "Raptor 1 - Squadron Leader@Raptor": 			{ [_interfaceSize] spawn RGGr_fnc_roles_raptor1; };
	case "Raptor 2 - Squadron 2IC@Raptor": 				{ [_interfaceSize] spawn RGGr_fnc_roles_raptor2; };

	default { systemChat "ERROR - NO ROLE" };
};

 