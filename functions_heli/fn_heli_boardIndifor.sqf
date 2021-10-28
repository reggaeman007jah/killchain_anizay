/*
Boarding system 
[_pilot, _heli] spawn RGGh_fnc_heli_boardIndifor; 
*/
_pilot = _this select 0;
_heli = _this select 1;
_freeCargoPositions = _heli emptyPositions "cargo";


// _passed = _this select 0; // from trigger 

// _pilot = _passed select 0;
// _freeCargoPositions = _this select 0;
// _heli = _this select 1;


// _heli = vehicle _pilot;
// _freeCargoPositions = _heli emptyPositions "cargo"; 
CANBOARD = false;

if (RGG_availableIndifor > 0) then {
	// ie there is at least one unit available 

	_spawn = [8478.22,6580.77,0];
	_float = diag_tickTime;
	_stampToString = str _float;
	_stampToString = createGroup [independent, true];
	_stampToString setFormation "DIAMOND";

	// TL class: "LOP_PESH_IND_Infantry_TL",
	_classes = [
		"LOP_PESH_IND_Infantry_SL",
		"LOP_PESH_IND_Infantry_Corpsman",
		"LOP_PESH_IND_Infantry_Marksman",
		"LOP_PESH_IND_Infantry_Rifleman",
		"LOP_PESH_IND_Infantry_Rifleman_3",
		"LOP_PESH_IND_Infantry_MG",
		"LOP_PESH_IND_Infantry_AT",
		"LOP_PESH_IND_Infantry_Rifleman_2",
		"LOP_PESH_IND_Infantry_GL"
	],

	_cargo = [];

	for "_i" from 1 to _freeCargoPositions do {
		RGG_indiforCreated = RGG_indiforCreated + 1;
		_class = selectRandom _classes;
		_unit = _stampToString createUnit [_class, _spawn, [], 0.1, "none"]; 
		bluforZeus addCuratorEditableObjects [[_unit], true];
		_unit assignAsCargo _heli;
		[_unit] orderGetIn true;
		_cargo pushBack _unit;
		sleep 0.3;
	};

	_checkCanRedeploy = true;
	while {_checkCanRedeploy} do {
		_heliPos = getPos _heli;
		_distance = _heliPos distance [8529.09,6579.64,0];
		if (_distance > 30) then {
			_checkCanRedeploy = false;
			CANBOARD = true;
		};
		sleep 5;
	};
	
	// format ["Peshmerga Fighters have been ordered into the Transport Heli - There are now %1 units left at base ready for deployment", RGG_availableIndifor] remoteExec ["systemChat", 0];
	format ["Total Indifor Fighters created: %1", RGG_indiforCreated] remoteExec ["systemChat", 0];
	// [_heli, _cargo] execVM "killchain\systems\boardingSystems\checkDeploy.sqf";
	[_heli, _cargo] spawn RGGh_fnc_heli_checkDeploy;

} else {
	// no units available - better go rescue some civvies first 
	"There are no Peshmerga Fighters available currently - Rescue more civilians to generate more fighters" remoteExec ["systemChat", 0, true];
};
