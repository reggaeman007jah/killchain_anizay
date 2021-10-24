// --- Order Get In Cargo --- // 

/*
Trying to manage civilian getIn orders 

This is duplicate of FNC version .. I suspect that re-running a FNC before it has completed affects 
somehow the orders .. so I am testing here whether running separate execVMs of the code would 
stop the issues from happening 

Takes:
	unit 
	heli to get into 

*/

systemChat "DEBUG / GET_IN_FNC - Running FNC";
// _unit = _this select 0;
// _heli = _this select 1;
// _cargoSpace = _this select 2;

// _unit enableAI "move";
// _unit setUnitPos "up";
// _unit setDamage 0; // prevents additional heals at medivac?

// _heliPos = getPos _heli;
// _unit doMove _heliPos;

// // now for pos check 

// // delete marker 
// _markerName = str _unit;
// deleteMarker _markerName;


// sleep 2;
// systemChat "now to board";

// _unit assignAsCargoIndex [_heli, _cargoSpace];
// [_unit] orderGetIn true;
// systemChat format ["DEBUG / GET_IN_FNC - double check ... %1 assigned to cargo space: %2", _unit, _cargoSpace];
// // systemChat "DEBUG / GET_IN_FNC - this should iterate upwards";

// _freeCargoPositions = _heli emptyPositions "cargo";
// systemChat format ["DEBUG / GET_IN_FNC - %1 empty cargo slots: %2", _heli, _freeCargoPositions];


// ripppe version start:
params ["_unit", "_heli", "_cargoSpace"];
_unit setDamage 0; // prevents additional heals at medivac I believe
private _heliPos = getPos _heli;
// private _civGroup = group _unit;
// _unit assignAsCargo _heli;
_unit assignAsCargoIndex [_heli, _cargoSpace];
// _civGroup addVehicle _heli;
[_unit] orderGetIn true;
// [_civGroup, _heliPos, 0, "GETIN"] call CBA_fnc_addWaypoint;
// ripppe version end:


// now check pos to manage marker deletion 
_pos1 = getPos _unit;
sleep 15; // just enough to get them moving 
_pos2 = getPos _unit;
_dist = _pos1 distance _pos2;

if (_dist < 2) then {
	systemChat format ["DEBUG / GET_IN_FNC - stuck unit: %1", _unit];
	systemChat "DEBUG / GET_IN_FNC - Need to teleport or kill - TO DO";
	_mrk = str _unit;
	_mrk setMarkerColor "ColorRed";
	[_unit, 1, 0.2] spawn RGGe_fnc_effects_bleedOut;
	// test can you move them at all now?
	// _dir = random 359;
	// _pos = _pos1 getPos [20,_dir];
	// _unit doMove _pos;
} else {
	systemChat format ["DEBUG / GET_IN_FNC - unit should be en-route: %1", _unit];
	_mrk = str _unit; // delete marker 
	deleteMarker _mrk;
};

