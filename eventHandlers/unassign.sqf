// this EH will run on each disembark 
// ideally to solve the unassign players issue from freecargoslots 
// this needs to be more intelligent - with no naming of assets - but for now, to test, we use this basic method

Roofy addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];

	if (isPlayer _unit) then {
		systemChat "A player got out";
		unassignVehicle _unit;
	};
}];

Medivac addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];

	if (isPlayer _unit) then {
		systemChat "A player got out";
		unassignVehicle _unit;
	};
}];

Hawk1 addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];

	if (isPlayer _unit) then {
		systemChat "A player got out";
		unassignVehicle _unit;
	};
}];

Hawk2 addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];

	if (isPlayer _unit) then {
		systemChat "A player got out";
		unassignVehicle _unit;
	};
}];

Bird1 addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];

	if (isPlayer _unit) then {
		systemChat "A player got out";
		unassignVehicle _unit;
	};
}];


