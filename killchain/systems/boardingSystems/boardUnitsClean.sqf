
_freeCargoPositions = _this select 0;
_heli = _this select 1;

_spawn = [8478.22,6580.77]; // specific mission-based spawn point;
_float = diag_tickTime;
_stampToString = str _float;
_stampToString = createGroup [independent, true];
_stampToString setFormation "DIAMOND";

_classes = [
	"LOP_PESH_IND_Infantry_SL",
	"LOP_PESH_IND_Infantry_TL",
	"LOP_PESH_IND_Infantry_Corpsman",
	// etc 
],

_cargo = [];

for "_i" from 1 to _freeCargoPositions do {
	_class = selectRandom _classes;
	_unit = _stampToString createUnit [_class, _spawn, [], 0.1, "none"]; 
	// tinmanModule addCuratorEditableObjects [[_unit], true];
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
	};
	sleep 5;
};

CANBOARD = true;
[_heli, _cargo] execVM "killchain\systems\boardingSystems\checkDeploy.sqf";



