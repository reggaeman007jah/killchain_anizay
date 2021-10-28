_dataStore = [];
{
	_playerRole = roleDescription _x;
	if (_playerRole == "Viking 1:1 - Platoon Leader@Viking 1") then { _dataStore pushback _x }
} forEach allPlayers;
_commander = _dataStore select 0;
_commPos = getPos _commander;
_commPos;