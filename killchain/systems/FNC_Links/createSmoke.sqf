_pos = _this select 0;

systemChat format ["DEBUG / EXECVM CREATE SMOKE - _pos: %1", _pos];

_smoke = createVehicle ['G_40mm_smokeYELLOW', _pos, [], 0, 'none'];

// action - next, find local opfor fighters to go check out the smoke also .. maybe 