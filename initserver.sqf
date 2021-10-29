
// setTimeMultiplier 23;
// remoteExec ["RGGa_fnc_ambient_timeManager", 2];  // execute only on server 
remoteExec ["RGGa_fnc_ambient_timeManager_v2", 2];  // execute only on server 

KILLCHAINISLIVE = false;

["Initialize", [true]] call BIS_fnc_dynamicGroups;

// load images 
saveLoadoutPoster setObjectTextureGlobal [0,"media\images\saveLoadout2.jpg"];
// dontForget setObjectTextureGlobal [0, "media\images\reloadImage.jpg"];
dontForget setObjectTextureGlobal [0, "media\images\vnMap4.jpg"];
fobPathfinder setObjectTextureGlobal [0, "media\images\pathfinderImage.jpg"];
// shootingRange setObjectTextureGlobal [0, "media\images\caution.jpg"];
// customFlag setObjectTextureGlobal [0, "media\images\flag1.jpg"];
customFlag2 setObjectTextureGlobal [0, "media\images\flag1.jpg"];
// whiteBoard setObjectTextureGlobal [0, "media\images\whiteBoard2.jpg"];
// customFlag setObjectTexture [0,"media\images\flag1.jpg"]; // BROKEN
customFlag2 setObjectTexture [0,"media\images\flag1.jpg"];
// vnMapX setObjectTexture [0,"media\images\vnMap3.jpg"];
// vnMapX setObjectTexture [0,"media\images\reloadImage2.jpg"];

// this toggles PL Blufor Tinman Command 
BLUMAN = true; // default is on 
publicVariable "BLUMAN";

// blufor marker system 
// execVM "killchain\systems\markerSystems\bluforMarkers.sqf"; // will run even if Killchain does not run 

// Voice Activation Global Declaration - is this needed for jtac and voice markers?
VAA_Activate = true;

// this manages the start of the mission
KILLCHAINMISSIONSTART = false;
SIDEMISSIONSTART = false;
RAPTOROPS = false;

ROPEBREAK = false;

// initialise killchain 
execVM "killchain\mission\missionInit.sqf"; 
// execVM "killchain\sideMissions\sideMissionInit.sqf"; 
// execVM "killchain\sideMissions\raptorOpsInit.sqf"; 
sleep 0.5;

// slingload EH 
execVM "eventHandlers\slingLoadMonitor.sqf";

// event handlers 
execVM "eventHandlers\getInMonitor.sqf";
execVM "eventHandlers\engineOff.sqf";
execVM "eventHandlers\heal.sqf";
execVM "eventHandlers\getOut.sqf";
execVM "eventHandlers\unassign.sqf";

// enables HK Team as default 
HUNTERKILLER = true;
CPD = false;
publicVariable "HUNTERKILLER";
publicVariable "CPD";
// theory here is that a mod can also change this 
// this works!

// this ensures that only one batch of indifor units are spawned at FOB at any one time 
CANBOARD = true;

/*
Day/ night management uses a global bool 
*/
RGG_isDay = true;
publicVariable "RGG_isDay";

/*
this bool is used to clear out ammo from helis on respawn - this should be with the other param settings 
*/
// to avoid errors 
REARMONSPAWN = true; // switch this to false to turn off the 'no-ammo on respawn' system 

// ----- this holds any sentry units waiting to spawn in (but can't due to lack of base food) -----
RGG_sentryQueue = []; // holds sentry respawn data 
RGG_supplyQueue = []; // holds supply respawn data 
RESPAWNQUEUE = false; // this tracks whether the sentry respawn system is active 
// this holds all relevant enemy camps, by holding their position 
RGG_potentialEnemyCamps = [];
// this holds enemy camp positions = when 9, job is done 
RGG_destroyedEnemyCamps = [];
// Barracks
RGG_Barracks_Food = 0;
RGG_Barracks_Ammo = 0;
RGG_Barracks_Fuel = 0;
RGG_Barracks_Sentries = 0;
publicVariable "RGG_Barracks_Food";
publicVariable "RGG_Barracks_Ammo";
publicVariable "RGG_Barracks_Fuel";
publicVariable "RGG_Barracks_Sentries";

// spec ops mission bool for side mission 
DISRUPTEVADE = false;

// test position 
RGG_DynamicPatrolPosition = [15772.8,6874.21,0];
// is this needed?



// trigger compound missions  
[] spawn RGGm_fnc_mission_compounds;

// trigger slowbys for general ambient effects 
[] spawn RGGa_fnc_ambient_lowbys;

// global array to house vehicles, to destroy if left uncrewed 
RGG_checkDestroy = [];
publicVariable "RGG_checkDestroy";

RGG_checkDestroyBlufor = [];
publicVariable "RGG_checkDestroyBlufor";

RGG_civviesSaved = 0;
publicVariable "RGG_civviesSaved";

RGG_civviesKilled = 0;
publicVariable "RGG_civviesKilled";

RGG_availableIndifor = 30;
publicVariable "RGG_availableIndifor";

RGG_indiforCreated = 0;
publicVariable "RGG_indiforCreated";

RGG_destroyedAA = 0;
publicVariable "RGG_destroyedAA";

RGG_indiforKills = 0;
publicVariable "RGG_indiforKills";

RGG_bluforKills = 0;
publicVariable "RGG_bluforKills";

RGG_bldBlacklist = [[0,0,0]]; // needs a base data entry to avoid errors 
publicVariable "RGG_bldBlacklist";

// main box 
// [[8372.2,7081.13,0]] execVM "killchain\systems\spawnerSystems\createAnizayBox.sqf"; 
// sleep 1;

// // pathfinder supplies 
// [[8403.87,7146.49,0]] execVM "killchain\systems\spawnerSystems\createAnizayBox.sqf";
// sleep 1;
// [[8404.33,7157.15,0]] execVM "killchain\systems\spawnerSystems\createAnizayBox.sqf";
// sleep 1;
// [[8403.53,7166.68,0]] execVM "killchain\systems\spawnerSystems\createAnizayBox.sqf";
// sleep 1;
// [[8416.57,7145.04,0]] execVM "killchain\systems\spawnerSystems\createAnizayBox.sqf";
// sleep 1;
// [[8417.55,7155.82,0]] execVM "killchain\systems\spawnerSystems\createAnizayBox.sqf";
// sleep 1;
// [[8416.1,7164.51,0]] execVM "killchain\systems\spawnerSystems\createAnizayBox.sqf";