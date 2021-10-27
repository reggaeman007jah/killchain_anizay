
// voice broadcast called only once at the beginning of the mission
execVM "media\sounds\thisIsCommand.sqf";
sleep 3;
execVM "media\sounds\missionLive.sqf"; 

// _initStartPos = getPos ammo1; // fixed asset anchor position 
_initStartPos = [17189.8,7195.49,0]; // new hanger spawn

// create marker around FOB Pathfinder 
_base = createMarker ["FOB Pathfinder", _initStartPos];
_base setMarkerShape "ELLIPSE";
_base setMarkerColor "ColorBlue";
_base setMarkerSize [70, 70];
_base setMarkerAlpha 0.1;
sleep 0.1;
_base setMarkerSize [80, 80];
_base setMarkerAlpha 0.2;
sleep 0.1;
_base setMarkerSize [90, 90];
_base setMarkerAlpha 0.3;
sleep 0.1;
_base setMarkerSize [100, 100];
_base setMarkerAlpha 0.4;
sleep 0.1;
_base setMarkerSize [110, 110];
_base setMarkerAlpha 0.5;

// get first objective 
_objPos = RGG_PatrolPoints select 0;

if (RGG_IndiPlayerSystem) then {
	// indiFor Player-Led System 
	// init Point 1 Obj  
	[_objPos] execVM "killChain\mission\patrolCycleHoldCheck.sqf";
	// execVM "killchain\systems\ambientSystems\flares.sqf"; // temp auto start for perma-flares
} else {
	// standard killchain 
	// init Point 1 Obj  
	// [_objPos] execVM "killChain\mission\patrolCycleHoldCheckBasic.sqf";
	[_objPos] spawn RGGp_fnc_patrol_initialProxCheck; // 27 Oct - check this works if so delete above 
	
	// sleep 2;
	// create initial batch of indifor and send out on patrol 
	// [_initStartPos, _objPos] execVM "killChain\systems\spawnerSystems\createIndiforUnits.sqf";
};


// --- init first investigation side mission --- // 
_targetArea = _objPos getPos [1200, (random 359)]; // the general area 
_building1 = [_targetArea] call RGGg_fnc_get_randomHouse; // building 1
_building1Pos = getPos _building1;
// systemChat format ["DEBUG / MAIN CYCLE - returned building 1 is: %1", _building1];
// systemChat format ["DEBUG / MAIN CYCLE - returned building 1 pos is: %1", _building1Pos];
sleep 3;

// test 
_list = _building1Pos nearObjects ["House", 100]; // get all houses within 100m of _building1Pos

_buildingData = []; // init declaration of array 
// here we cycle through all of the results found, putting them in this array ready for sending 
{
	_buildingData pushBack _x;
} forEach _list;

// here we send the anchor and building data (array) to the investigate fnc (mission)
[_targetArea, _buildingData] spawn RGGm_fnc_mission_investigate; // generate investigate side mission 

// testing opfor garrison function 
[] spawn RGGs_fnc_spawn_populateOpforBuildings;

// AT interests 
[] call RGGr_fnc_roles_huntAT;















// - OLD BELOW 
/*
From: initServer.sqf 

Purpose:
This file launches various threads / initiation scripts 


Flow:
	execVM "autoPatrolSystem\autoPatrolSystemParams.sqf";
	execVM "autoPatrolSystem\chainSecuritySystems\chainSec.sqf";
	execVM "autoPatrolSystem\randomThreatSystems\randomThreats.sqf";
	Issues player welcome info 
	Gets location of a mission-specific asset ("ammo1") and uses as anchor position: RGG_initStartPos
	Creates marker for main player FOB 
	Triggers mission phase 1
	Creates friendly units 
	Adds FOB base data to global blacklist array 

Receives:
TBC

Informs:
	mission-specific params file: 
	execVM "autoPatrolSystem\autoPatrolSystemParams.sqf";

	sapper system:
	execVM "autoPatrolSystem\chainSecuritySystems\chainSec.sqf";

	random roamers system:
	execVM "autoPatrolSystem\randomThreatSystems\randomThreats.sqf";

	Mission start:
	[RGG_initStartPos, RGG_initStartPos] execVM "autoPatrolSystem\phase1_createObj.sqf";

	Creates friendly units 
	[RGG_initStartPos] execVM "autoPatrolSystem\spawnerSystems\createFriendlyUnits.sqf";

Notes:
"ammo1" is a fixed 'named asset' in the mission itself - it is both the VA arsenal and also acts as a anchor point for the main Blufor base.
RGG_patrolPositionBlacklist is the global array for blacklist areas

Actions:
Remove old comments 
HP - make this trigger from activity, not from mission start 

Questions:
How many times does this file run? Confirm only runs once...
*/


// this launches the mission-specific params file 
// execVM "killChain\killchainSystemParams.sqf";

// this launches the random roamers system
// execVM "killChain\systems\randomThreatSystems\randomThreats.sqf";

// this file should run only once 
// sleep 2;
// systemchat "debug --- autoPatrolSystem.sqf running"; // debug 
// player information
// "---- Welcome to Operation Killchain" remoteExec ["systemChat", 0, true];
// "---- Support Independent forces as they patrol the badlands" remoteExec ["systemChat", 0, true];

// // voice broadcasts
// execVM "sounds\welcome\thisIsCommand.sqf";
// sleep 3;
// execVM "sounds\welcome\missionLive.sqf";
// // this ^^ is a one-off sound file called only once at the beginning of the mission 

/*
------- Base Setup ------- 
*/

// RGG_initStartPos is a location array (of the location of the mission-specific-asset "ammo1")
// "permaBase" acts as the one and only fixed blufor base area, can be used for RF/RE-UP/Medivac tasks (TBC)




// sleep 1;

// KICK OFF PATROL MISSION 
// this takes the permaBase location as the first anchor (subsequent progress-anchors will be different)
// to do / April 2020 / work out why you used the same arg twice here --------------------------------------------
// [RGG_initStartPos, RGG_initStartPos] execVM "killChain\phase1_createObj.sqf";
// systemchat "debug --- phase1_createObj ACTIVATED";
// "MP debug --- phase1_createObj ACTIVATED" remoteExec ["systemChat", 0, true];

// sleep 5;

// CREATE PATROL SQUADDIES
// this also takes the main blufor permaBase anchor location as the first spawn point for blufor troops
// [RGG_initStartPos] execVM "killChain\systems\spawnerSystems\createFriendlyUnits.sqf";
// systemchat "debug --- createFriendlyUnits.sqf running";
// "MP debug --- createFriendlyUnits.sqf running" remoteExec ["systemChat", 0, true];
// sleep 0.2;

// add base position to blacklist 
// _topleft = RGG_initStartPos getPos [800,315];
// _bottomRight = RGG_initStartPos getPos [800,135];
// RGG_patrolPositionBlacklist pushBack [_topLeft, _bottomRight];
// consider making this smaller 
