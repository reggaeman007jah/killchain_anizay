// --- smoke on prox --- // 

/*
Creates scripted trigger area that spawns smoke when player is near - used currently to inform players on loot crate 

Takes:
	pos as anchor 

Note:
	is not repeatable 
*/

_anchor = _this select 0;

_trg = createTrigger ["proxDetect", _anchor];
_trg setTriggerArea [400, 400, 0, false];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerStatements [
	"this", 
	"systemChat 'DEBUG / PROX DETECT - created trigger activator'; _smoke = createVehicle ['G_40mm_smokeYELLOW', _pos, [], 0, 'none'];", 
	"systemChat 'no player near'"
];