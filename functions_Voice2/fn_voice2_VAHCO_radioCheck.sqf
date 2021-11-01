
vamp = true;
_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown', rgg_vahco2_Activate];
systemChat 'VAHC2 ACTIVATED';
// systemChat 'Bravo Copies .. what do you need?';
{_player say2D "squelch";} remoteExec ["call", 0];
// {playSound "commandOut"} remoteExec ["call",0];
systemChat 'OPTIONS:';
systemChat '1 - Select a Group for move order';
systemChat '2 - Merge Order TBC';
systemChat '2 - Extract Order TBC';
VAHCO2_numericalInputbool = true; 
VAHCO2_orderSelectBool = true;

[] call RGGv2_fnc_voice2_VAHCO_keyDowns;
[] spawn RGGv2_fnc_voice2_VAHCO_keyDownMonitor;


// eventually we want to prevent this from being done while not in red and while no indifor around - but for testing we skip this and go straight in 
// remove the line below to restore old code
/*
_dataStore = [];

{
	_playerRole = roleDescription _x;
	if (_playerRole == "Viking 1:1 - Platoon Leader@Viking 1") then { _dataStore pushback _x }
} forEach allPlayers;

_player = _dataStore select 0;
_playerPos = getPos _player;
_inRed = _playerPos inArea "redzone";

// check that there are units in redzone to command 
// get overall numbers of troops in redzone 
_unitsRedzone = allUnits inAreaArray "redzone";

// check indi and opfor numbers in redzone 
_redzoneIndi = 0;
{
	switch ((side _x)) do
	{
		case INDEPENDENT: {_redzoneIndi = _redzoneIndi + 1};
	};
} forEach ;

if ((_inRed) && (_redzoneIndi > 0)) then {
	vamp = true;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown', rgg_vahco2_Activate];
	systemChat 'VAHC2 ACTIVATED';
	// systemChat 'Bravo Copies .. what do you need?';
	{_player say2D "squelch";} remoteExec ["call", 0];
	// {playSound "commandOut"} remoteExec ["call",0];
	systemChat 'OPTIONS:';
	systemChat '1 - Select a Group for move order';
	systemChat '2 - TBC - nothing here yet';
	VAHCO2_numericalInputbool = true; 
	VAHCO2_orderSelectBool = true;

	[] call RGGv_fnc_voice2_VAHCO_keyDowns;
	[] spawn RGGv_fnc_voice2_VAHCO_keyDownMonitor; 
} else {
	systemChat "You are too far away from the AO - get closer to issue orders!";
	vamp = false;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_vahco2_Activate];
	// execVM "voiceactivatedhighcommand\VAHCO_init.sqf";
	[] spawn RGGv_fnc_voice2_VAHCO_init;
};



// systemChat format ["_unitsRedZone: %1", _unitsRedzone];
// systemChat format ["_redzoneIndi: %1", _redzoneIndi];
// systemChat format ["_inRed: %1", _inRed];
// systemChat format ["KILLCHAINISLIVE: %1", KILLCHAINISLIVE];

// // test 

// 	vamp = true;
// 	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_vahco_Activate];
// 	systemChat 'VAHC ACTIVATED';
// 	systemChat 'Bravo Copies .. what do you need?';
	
// 	// {playSound "commandOut"} remoteExec ["call",0];
// 	systemChat 'OPTIONS:';
// 	systemChat '1 fall back (or move to) on my position - send them to player location';
// 	systemChat '2 fall back and (or move to) remain on my position - send them to player and always have them follow player';
// 	systemChat '3 move to attack objective';
// 	systemChat '4 confirm strength (numbers)';
// 	systemChat '5 Hold your position';
// 	// systemChat '5 confirm position (we need to get all units into one group here)';
// 	VAHCO_numericalInputbool = true; 
// 	VAHCO_orderSelectBool = true;
// 	execVM 'voiceactivatedhighcommand\VAHCO_keyDowns.sqf'; 
// 	execVM 'voiceactivatedhighcommand\VAHCO_keyDownMonitor.sqf'; 



