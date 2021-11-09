/*
This manages the monitoring of players before main activities are triggered 
i.e. this watches for players near to LZ Zeus 
 */

 // here we keep checking whether the player is near the deployment target - LZ Zeus  
// we spawn everything first, opfor 
// we want to wait until player is near, but probably in the air, so when near-ish, we send qrf to Zeus 
// we want indifor inserted before indifor troops are created 
// [_initStartPos, _objPos] execVM "killChain\systems\spawnerSystems\createIndiforUnitsAlt.sqf";
// once player is on ground, qrf will be moving in, so important to get indifor units deployed ASAP 
// indifor units are limited - only can be 28 at any one time 
// rf will not move in automatically - but it is important that numbers are communicated regularly 
// rf will spawn only when numbers are low - a cycleCheck will take place, they will also spawn in batches of two, enabling two pilots to pick up at the same time 
// they will be lifted in groups of 4, allowing for smaller hueys 
// to-do - find out why players in heli messes up seat allocations 
// so cycleCheck is - if 22 or more, no units,  if 21 or less, spawn two batches of 4 and alert that this has happened maybe - or maybe send indi player message 
// also, limted batches of RF to 20 to start with, so 10 cycles of two batches each - once reached, no more, make do 
// so initially, there will need to be lots of lifts - one player will be busy - inital drop should be players of both factions into Genesis followed by (if one pilot) 8 lifts of 4 per heli 
// this btw is the init code for VA - 0 = ["AmmoboxInit",[this,true]] spawn BIS_fnc_arsenal;

// ID player on a loop, and progress when landed  
// _initStartPos = _this select 0; // starting point for any new mission

_objPos = _this select 0; // objective point for any new mission 

_lzPos = getMarkerPos 'LZ_Zeus';

_checkCycle = true;
while {_checkCycle} do {	
	{
		_playerPos = getPos _x;
		_chk = _lzPos distance _playerPos;
		if (_chk < 150) then {
			["BLUFOR IS NOW AT LZ ZEUS"] remoteExec ["RGGi_fnc_information_lowerRight", 0];  
			[] spawn RGGt_fnc_test_nearEntities;
			[] spawn RGGt_fnc_test_checkDestroy;
			[_lzPos, _objPos] spawn RGGp_fnc_patrol_mainCycle;
			_checkCycle = false;
		};
	} forEach allPlayers;

	sleep 10;
};