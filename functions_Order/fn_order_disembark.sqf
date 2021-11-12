/*
Forces AI out of heli - used as a backup when things don't go to plan 
*/

params ["_player"];
// _player = _this select 0;

_vic = vehicle _player;
_cargo = fullCrew [_vic, "CARGO"];
// systemchat str _cargo;

{ unassignVehicle _x } forEach crew _vic;

// {
// 	unassignVehicle _x;
// } forEach _cargo;

_cargo orderGetIn false;