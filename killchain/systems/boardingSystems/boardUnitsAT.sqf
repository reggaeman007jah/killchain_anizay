// spawn units

systemChat "starting boardUnits.sqf";

_freeCargoPositions = _this select 0;
_heli = _this select 1;

// RGG_availableIndifor = 30;
// publicVariable "RGG_availableIndifor";

// initial check of units 
if (RGG_availableIndifor > 0) then {
	// there is at least one unit available 

	_spawn = [8478.15,6752.45,0];
	_float = diag_tickTime;
	_stampToString = str _float;
	_stampToString = createGroup [independent, true];
	_stampToString setFormation "DIAMOND";

	_classes = [
		"LOP_PESH_IND_Infantry_AT",
		"LOP_PESH_IND_Infantry_Rifleman_2"
	],
 
	_cargo = [];

	for "_i" from 1 to 4 do {

		if (RGG_availableIndifor == 0) exitWith {
			"There are no more Peshmerga Fighters available - Rescue more civilians to generate more fighters" remoteExec ["systemChat", 0, true];
		};

		if (RGG_availableIndifor > 0) then {
			RGG_availableIndifor = RGG_availableIndifor - 1;
			_class = selectRandom _classes;
			// _class = [] call RGGg_fnc_get_randomIndiforClassname; 
			_unit = _stampToString createUnit [_class, _spawn, [], 0.1, "none"]; 
			// tinmanModule addCuratorEditableObjects [[_unit], true];
			bluforZeus addCuratorEditableObjects [[_unit], true];
			_unit assignAsCargo _heli;
			[_unit] orderGetIn true;
			systemChat format ["unit getting in:@ %1", _unit];
			_cargo pushBack _unit;
			// _sleep = selectRandom [2.1, 2,3, 2.5];
			// sleep _sleep;
			sleep 3;
			// sleep 5;
		};
		// "Peshmerga Fighters have boarded the Transport Heli" remoteExec ["systemChat", 0, true];
		// format ["Peshmerga Fighters have boarded the Transport Heli - There are %1 units left at base ready for deployment", RGG_availableIndifor] remoteExec ["systemChat", 0];

	};

	systemChat format ["cargo array: %1", _cargo];

	_checkCanRedeploy = true;

	while {_checkCanRedeploy} do {
		_heliPos = getPos _heli;
		_distance = _heliPos distance [8529.09,6579.64,0];
		if (_distance > 30) then {
			_checkCanRedeploy = false;
		};
		sleep 5;
	};

	CANBOARD = true;
	format ["Peshmerga Fighters have been ordered into the Transport Heli - There are now %1 units left at base ready for deployment", RGG_availableIndifor] remoteExec ["systemChat", 0];

	[_heli, _cargo] execVM "killchain\systems\boardingSystems\checkDeploy.sqf";

} else {
	// no units available - better go rescue some civvies first 
	"There are no Peshmerga Fighters available currently - Rescue more civilians to generate more fighters" remoteExec ["systemChat", 0, true];
};


