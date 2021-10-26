// this EH will run on each disembark 
// ideally to solve the unassign players issue from freecargoslots 
// this needs to be more intelligent - with no naming of assets - but for now, to test, we use this basic method
// also, can I forEach the helis into one array and apply EH on each?

Roofy addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	if (isPlayer _unit) then {
		[_unit] remoteExec ["RGGu_fnc_utilities_unassign", _unit];
	};
}];

Medivac addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	if (isPlayer _unit) then {
		[_unit] remoteExec ["RGGu_fnc_utilities_unassign", _unit];
	};
}];

Hawk1 addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	if (isPlayer _unit) then {
		[_unit] remoteExec ["RGGu_fnc_utilities_unassign", _unit];
	};
}];

Hawk2 addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	if (isPlayer _unit) then {
		[_unit] remoteExec ["RGGu_fnc_utilities_unassign", _unit];
	};
}];

Bird1 addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	if (isPlayer _unit) then {
		[_unit] remoteExec ["RGGu_fnc_utilities_unassign", _unit];
	};
}];


