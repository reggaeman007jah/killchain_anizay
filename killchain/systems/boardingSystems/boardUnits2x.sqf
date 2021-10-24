// spawn blufor machine-gunner units for roofs and other small-scale deployments

_freeCargoPositions = _this select 0;
_heli = _this select 1;

_spawn = [8485.88,6754.15,0.0807266];
_float = diag_tickTime;
_stampToString = str _float;
_stampToString = createGroup [west, true];

_classes = [
	"rhsusf_army_ocp_machinegunner"
],

_cargo = [];

for "_i" from 1 to 2 do {
	_class = selectRandom _classes;
	_unit = _stampToString createUnit [_class, _spawn, [], 0.1, "none"]; 
	tinmanModule addCuratorEditableObjects [[_unit], true];
	bluforZeus addCuratorEditableObjects [[_unit], true];
	_unit assignAsCargo _heli;
	[_unit] orderGetIn true;
	_cargo pushBack _unit;
	sleep 1;
};

_checkCanRedeploy = true;
while {_checkCanRedeploy} do {
	_heliPos = getPos _heli;
	_distance = _heliPos distance [8485,6754];
	if (_distance > 30) then {
		_checkCanRedeploy = false;
	};
	sleep 10;
};

CANBOARD = true;

// [_heli, _cargo] execVM "killchain\systems\boardingSystems\checkDeploy.sqf";




