/*
ensures only leaders get this message
*/

// 22 Oct idea - use ranks to send messages when someone is in charge - they may not know it as leader is dead 
// so, FNC to get ranking officer for each squad maybe?

_messageText = _this select 0;
_messageVar = _this select 1;

_group = [];
{
	_playerRole = roleDescription _x;
	switch (_playerRole) do {
		case "Viking 1:1 - Platoon Leader@Viking 1":		{ _group pushBack _x };
		case "Viking 1:2 - Platoon 2IC / Padre@Viking 1":	{ _group pushBack _x };
		// case "Viking 1:3 - Platoon Sniper@Viking 1":		{ _group pushBack _x };

		case "Viking 2:1 - Squad Leader@Viking 2":			{ _group pushBack _x };
		case "Viking 3:1 - Squad Leader@Viking 3":			{ _group pushBack _x };

		case "Raptor 1 - Squadron Leader@Raptor":			{ _group pushBack _x; };
		case "Raptor 2 - Squadron 2IC@Raptor":				{ _group pushBack _x; };

		default { systemChat "ERROR - Leadership role error" };
	};
} forEach allPlayers;

{
	[_messageText, _messageVar] remoteExec ["RGGi_fnc_information_lowerLeft", _x]; 
} forEach _group;
