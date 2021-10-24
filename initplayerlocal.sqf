
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

// remove shift map clicks 
// onMapSingleClick {_shift};

// remove stamina 
// player enableStamina FALSE;
// player addEventHandler ['Respawn',{ player enableStamina FALSE }];

// adjust sway 
player setCustomAimCoef 0.9;
player addEventHandler ['Respawn',{ player setCustomAimCoef 0.9 }];

sleep 5;

// untested !!
tinmanModule addCuratorEditableObjects [[player], true];

private _playerFaction = faction player;
// systemChat format ["you are %1 faction", _playerFaction];

if (_playerFaction == "I_ARVN") then {
	vamp = false;
	systemChat "you have use of voice activated systems";
	execVM "voiceactivatedhighcommand\VAHCO_init.sqf";
};

systemChat "DEBUG / EH - Init Player Local Heal EH Running";


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
[_playerRole,_interfaceSize] call RGGr_fnc_roles_welcomeText;




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