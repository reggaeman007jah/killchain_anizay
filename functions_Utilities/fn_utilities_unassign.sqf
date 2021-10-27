_player = _this select 0;
_vehicle = _this select 1;
_appliedTo = _this select 2; // string indicating where this is applied (remoteExec on player or server)

systemChat "DEBUG unassign FNC running";
format ["Using: %1 %2 %3", _player, _vehicle, _appliedTo] remoteExec ["systemChat", 0]; 

// { unassignVehicle _x } forEach crew _vehicle;
// unassignVehicle _player; // didnt work 
_player leaveVehicle _vehicle; // didnt work 


// _player assignAsCargo null;

// if (_appliedTo == "server") then {
// 	format ["%1 left %2, remoteExec of fn_utilities_unassign was executed on the Server", _player, _vehicle] remoteExec ["systemChat", 0]; 
// } else {
// 	format ["%1 left %2, remoteExec of fn_utilities_unassign was executed on the Player", _player, _vehicle] remoteExec ["systemChat", 0]; 
// };

