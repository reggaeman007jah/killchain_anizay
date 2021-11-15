/*
This function will be triggered from CBA keypress, and will show a temporary HUD display 
Designed to inform pilots who is who, while in the air .. it will order by distance, with pilot name, and will also show who is behind you 

Common usage: you will know who is nearest to you in front of you on voice command 

Notes:
Get heli of player 
nearestObjects?
Or create marker in front, and grab data from that marker?

But, could this also be a way for players on ground to find their closest teammates?

Maybe two presses - one to show me who is directly in front of me for say 100m maybe good for pilots 
and another wich is all around, and distance-based with NSEW style info?

Or maybe one output but is split between ground and air - looks only for players 



*/

_playersFront = [];
{
	if (_x != player) then {
		_dist = floor (_x distance player);
		_dir = floor (player getRelDir _x);
		if ((_dir > 320) or (_dir < 40)) then {
			_pos = getPosATL _x;
			_alt = _pos select 2;
			if (_alt < 2) then {
				_playersFront pushback [_dist, _x, _dir];
			};
		};
	};
} forEach allPlayers;

_playersFront sort true;

if (count _playersFront > 0) then {
	{
		systemChat format ["Player %1 - %2m away", _x select 1, _x select 0];
		sleep 1.5;
	} forEach _playersFront;
} else {
	systemChat "no players in front";
};
