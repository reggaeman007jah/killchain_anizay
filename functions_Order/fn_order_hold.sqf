// one off order - stop moving 

FALLBACKREMAIN = false; // in case was running 
// systemChat "ARVN Units are holding position";
"ARVN Units are holding position" remoteExec ["systemChat", -2, true];
// {playSound "hold"} remoteExec ["call",-2];

_units = allUnits inAreaArray "Redzone";

_indi = [];
{
	if ((side _x) == INDEPENDENT) then {_indi pushBack _x};
} forEach _units;

{
	_pos = getPos _x;
	_x doMove _pos;
	sleep 0.1;
} forEach _indi;

// new 
// one off move order - all indiRed hold position  

"INDI Groups are holding position" remoteExec ["systemChat", -2];
// {playSound "attack"} remoteExec ["call",-2];
// {playSound "commandOut"} remoteExec ["call",0];
// systemChat "played sound";
FALLBACKREMAIN = false; // in case was running 

_selection = allGroups select {side _x isEqualTo independent};
{
	_movePos = getPos leader _x;
	_x move _movePos;
	systemChat format ["DEBUG - MOVE ORDER / Group %1 is holding at %2", _x, _movePos];
} forEach _selection;

// think about finding the closest unit to target then making then leader (set leader) then using that pos as hold pos 