
_targetMarker = getMarkerPos "redzone";
_dir = random 359;
_dist = selectRandom [50,75,100];
_target = _targetMarker getPos [_dist, _dir];

// private ["_num", "_delay"]; 
// _num = 0;
// _delay = 0;
 
systemChat "DEBUG / SPAWN - blufor technical spawning";
_pos = [8476.1,6761.28,0]; // hanger at basse 
_class = "LOP_PESH_M1025_W_M2";
_bluforVic = [_pos, 180, _class, west] call BIS_fnc_spawnVehicle;

_techCargo = _bluforVic select 1;
{
	bluforZeus addCuratorEditableObjects [[_x], true];
	tinmanModule addCuratorEditableObjects [[_x], true];
} forEach _techCargo;

_randomMovePos = [["redzone"]] call BIS_fnc_randomPos;
_bluforVic doMove _randomMovePos; 

// _bluforVic doMove _target;
// systemChat format ["DEBUG / SPAWN - single blufor tech moved to redzone target: %1", _target];

RGG_checkDestroyBlufor pushBack _bluforVic;
publicVariable "RGG_checkDestroyBlufor";


