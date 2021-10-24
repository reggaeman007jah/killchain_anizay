// --- smoke on prox / execVM version --- // 

/*
experiment to see if the trigger will work when execVM from a running function 
*/

_pos = _this select 0;
systemChat format ["DEBUG / EXECVM PROX TRIGGER - running smoke on prox at %1", _pos];
// _smoke = createVehicle ['G_40mm_smokeYELLOW', _pos, [], 0, 'none']

sleep 2;

systemChat "DEBUG / EXECVM PROX TRIGGER - running trigger code";

_smokeCheck = true;
_smokeCheckActivate = false;

RGG_CRATEPOS = _pos;

_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [400, 400, 0, false, 400];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", false];
// _trg setTriggerStatements ["this", "_smokeCheckActivate = true; systemChat 'smokecheckactivate now true'", "systemChat 'DEBUG / PROX DETECT - no player near'"];
_trg setTriggerStatements ["this", "[RGG_CRATEPOS] execVM 'killchain\systems\FNC_Links\createSmoke.sqf'", "systemChat 'DEBUG / PROX DETECT - no player near'"];
// _trg setTriggerStatements ["this", "systemChat 'DEBUG / PROX DETECT - created trigger activator'; _smoke = createVehicle ['G_40mm_smokeYELLOW', _pos, [], 0, 'none'];", "systemChat 'DEBUG / PROX DETECT - no player near'"];

// _trgSmk = createTrigger ["EmptyDetector", _missionPos];
// _trgSmk setTriggerArea [2000, 2000, 0, false];
// _trgSmk setTriggerActivation ["ANYPLAYER", "PRESENT", true];
// _trgSmk setTriggerStatements ["this", "SMOKEOUT = true", "systemChat 'no player near'"];

// while {_smokeCheck == true} do {
// 	if (_smokeCheckActivate == true) then {
// 		_smoke = createVehicle ['G_40mm_smokeYELLOW', _pos, [], 0, 'none'];
// 		systemChat "SMOKE NOW";
// 		_smokeCheck = false;
// 	};

// 	systemChat "smoketest checking checking";
// 	systemchat format ["_smokeCheckActivate bool: %1", _smokeCheckActivate];
// 	sleep 1; // should be much higher if works 
// };