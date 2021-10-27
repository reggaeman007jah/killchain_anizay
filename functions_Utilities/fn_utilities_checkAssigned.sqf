/*
runs check for all players, to see which vics they are assigned to 
takes array of vics and a target to display to 
simply displays this as a systemChat 
*/

_data = _this select 0;
_target = _this select 1;

format ["Assigned vics for all players: %1", _data] remoteExec ["systemChat", _target];

