// --- patrol markers are done here --- //

_objPos = _this select 0; // starting point for any new patrol
_initStartPos = _this select 1; // obj point for any new patrol

// OBJ - patrol stage objective 
deleteMarker "Redzone"; 
_objective1 = createMarker ["Redzone", _objPos];
_objective1 setMarkerShape "ELLIPSE";
_objective1 setMarkerColor "ColorRed";
_objective1 setMarkerSize [100, 100];
_objective1 setMarkerAlpha 0.2;
sleep 0.1;
_objective1 setMarkerSize [120, 120];
_objective1 setMarkerAlpha 0.3;
sleep 0.1;
_objective1 setMarkerSize [130, 130];
_objective1 setMarkerAlpha 0.4;
sleep 0.1;
_objective1 setMarkerSize [140, 140];
_objective1 setMarkerAlpha 0.5;
sleep 0.1;
_objective1 setMarkerSize [150, 150];
_objective1 setMarkerAlpha 0.6;
sleep 0.1;
_objective1 setMarkerSize [550, 550];
sleep 0.1;
_objective1 setMarkerSize [1850, 1850];
sleep 3;

// Patrol Stage Core 
deleteMarker "missionCore";  
_base = createMarker ["missionCore", _objPos];
_base setMarkerShape "ELLIPSE";
_base setMarkerColor "ColorRed";
_base setMarkerSize [10, 10];
_base setMarkerAlpha 0.3;
sleep 0.1;
_base setMarkerSize [20, 20];
_base setMarkerAlpha 0.4;
sleep 0.1;
_base setMarkerSize [30, 30];
_base setMarkerAlpha 0.5;
sleep 0.1;
_base setMarkerSize [40, 40];
_base setMarkerAlpha 0.6;
sleep 0.1;
_base setMarkerSize [60, 60];
_base setMarkerAlpha 0.7;

// add icon 
deleteMarker "attackPoint";  
_tempMarker = createMarker ["attackPoint", _objPos];
_tempMarker setMarkerType "hd_objective";
_tempMarker setMarkerColor "ColorRed";
_tempMarker setMarkerAlpha 0.3;
sleep 0.1;
_tempMarker setMarkerAlpha 0.4;
sleep 0.1;
_tempMarker setMarkerAlpha 0.5;
sleep 0.1;
_tempMarker setMarkerAlpha 0.6;
sleep 0.1;
_tempMarker setMarkerAlpha 0.7;
sleep 1;
_tempMarker setMarkerAlpha 0.1;
sleep 1;
_tempMarker setMarkerAlpha 0.7;
sleep 1;
_tempMarker setMarkerAlpha 0.1;
sleep 1;
_tempMarker setMarkerAlpha 0.7;
sleep 1;
_tempMarker setMarkerAlpha 0.1;
sleep 1;
_tempMarker setMarkerAlpha 0.7;


// --- generate path marker/lines between marker points --- //

// generate random number and make into string 
_float = diag_tickTime;
_float2 = random 10000;
_uniqueStamp = [_float, _float2];
_stampToString = str _uniqueStamp;

// calculate line data 
_reldirX = _initStartPos getDir _objPos;
_relDir = floor _relDirX;
_distX = _initStartPos distance _objPos;
_dist = floor _distX;
_dist2 = _dist / 2;
_testPos = _initStartPos getPos [_dist2, _relDirX];

// create line map element 
_lineTest = createMarker [_stampToString, _testPos];
_lineTest setMarkerShape "RECTANGLE";
_lineTest setMarkerColor "ColorBlack";
_lineTest setMarkerDir _reldirX;
_lineTest setMarkerSize [2, _dist2];
// to enable a colour change when the chain breaks, these lines need to be pushed back into an array 

