_heli = _this select 0;

_pos = getPos _heli;
// deleteMarker "_medivac";
_objective1 = createMarker ["_medivac", _pos];
_objective1 setMarkerShape "ELLIPSE";
_objective1 setMarkerColor "ColorBlue";
_objective1 setMarkerAlpha 0.5;
_objective1 setMarkerSize [100, 100];

_units = allUnits inAreaArray "_medivac";
systemChat format ["allunits: %1", _units];

_injured = [];
{
	if ((side _x) == CIVILIAN) then {
		_injured pushBack _x;
		systemChat format ["DEBUG / CIV_GET_IN - _injured unit found: %1", _injured];
	};
} forEach _units;

_cnt = count _injured;
systemChat format ["DEBUG / CIV_GET_IN - Number of injured civilians in blue zone: %1", _cnt];

{
	_damage = damage _x;
	if (_damage < 0.5) then {
		_x enableAI "move";
		_x assignAsCargo MEDIVAC;
		systemChat format ["%1 assigned as cargo as damage was %2", _x, _damage];
		// _injured orderGetIn true;
		systemChat format ["%1 ordered to get in", _injured];
		_cargo = assignedVehicleRole _x;
		systemChat format ["%1 assigned to cargo %2", _injured, _cargo];
	} else {
		systemChat format ["%1 is too sick to fly, as damage was %2", _x, _damage];
	};
	sleep 1;
} forEach _injured;	
_injured orderGetIn true;

/* 
idea - scrap the EH completely 
when you have injured civilians in an array, check every 10 seconds for the health of each of those civvies 
if any health goes ok, then allocate to heli and remove that civvie from that array BUT ...
In order to orderGetIn the civvie needs to be in an array - so you need a second BOARDING ARRAY 
use this to make them board then delete them from said array 















// {
// 	_x doMove _pos;
// } forEach _units;

// // clear all first 
// { 
// 	unassignVehicle _x; 
// } forEach crew MEDIVAC;

// // _units = allUnits inAreaArray "extract";
// (crew MEDIVAC) orderGetIn false;