// this will spawn night-ops vc and send into Tinman 
// requires spawn pos and a target 
_spawnPos = _this select 0;
_targetPos = _this select 1;

// classes 
_specOps = [
	"LOP_BH_Infantry_TL",
	"LOP_BH_Infantry_AR",
	"LOP_BH_Infantry_AT",
	"LOP_BH_Infantry_GL"
];

_opGroup = createGroup [east, true];
{
	_dist = random 5;
	_dir = random 359;
	_pos = _spawnPos getPos [_dist, _dir];
	_unit = _opGroup createUnit [_x, _pos, [], 0.1, "none"]; 
	_unit setCombatMode "GREEN";
	sleep 0.2;
} forEach _specOps;

_opGroup move _targetPos;
