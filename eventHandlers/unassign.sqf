// this EH will run on each disembark 
// ideally to solve the unassign players issue from freecargoslots 
// this needs to be more intelligent - with no naming of assets - but for now, to test, we use this basic method
// also, can I forEach the helis into one array and apply EH on each?

// Roofy addEventHandler ["GetOut", {
// 	params ["_vehicle", "_role", "_unit", "_turret"];
// 	if (isPlayer _unit) then {
// 		[_unit] remoteExec ["RGGu_fnc_utilities_unassign", 2];
// 	};
// }];

// Roofy addEventHandler ["GetOut", {
// 	params ["_vehicle", "_role", "_unit", "_turret"];
// 	if (isPlayer _unit) then {
// 		if (_role = "cargo") then {
// 			[_unit, Roofy] remoteExec ["RGGu_fnc_utilities_unassign", _unit];
// 		};
// 	};
// }];


// Medivac addEventHandler ["GetOut", {
// 	params ["_vehicle", "_role", "_unit", "_turret"];
// 	if (isPlayer _unit) then {
// 		[_unit] remoteExec ["RGGu_fnc_utilities_unassign", 2];
// 	};
// }];

// Hawk1 addEventHandler ["GetOut", {
// 	params ["_vehicle", "_role", "_unit", "_turret"];
// 	if (isPlayer _unit) then {
// 		[_unit] remoteExec ["RGGu_fnc_utilities_unassign", 2];
// 	};
// }];

// Hawk2 addEventHandler ["GetOut", {
// 	params ["_vehicle", "_role", "_unit", "_turret"];
// 	if (isPlayer _unit) then {
// 		[_unit] remoteExec ["RGGu_fnc_utilities_unassign", 2];
// 	};
// }];

// Bird1 addEventHandler ["GetOut", {
// 	params ["_vehicle", "_role", "_unit", "_turret"];
// 	if (isPlayer _unit) then {
// 		[_unit] remoteExec ["RGGu_fnc_utilities_unassign", 2];
// 	};
// }];

Hawk1 addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	if (isPlayer _unit) then {
		// if (_role == "cargo") then {
			_unit assignAsCargo Workaround;
			format ["%1 assigned to Workaround", _unit] remoteExec ["systemChat", 0]; 
			// [_unit, Hawk1, "unit"] remoteExec ["RGGu_fnc_utilities_unassign", _unit]; // on specific unit 
			// format ["%1 left %2", _unit, _vehicle] remoteExec ["systemChat", -2]; 
		// };
	};
}];

Hawk2 addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	if (isPlayer _unit) then {
		// if (_role == "cargo") then {
			_unit assignAsCargo Workaround;
			format ["%1 assigned to Workaround", _unit] remoteExec ["systemChat", 0]; 
			// [_unit, Hawk2, "server"] remoteExec ["RGGu_fnc_utilities_unassign", 2]; // only on server 
			// format ["%1 left %2", _unit, _vehicle] remoteExec ["systemChat", -2]; 
		};
	// };
}];

