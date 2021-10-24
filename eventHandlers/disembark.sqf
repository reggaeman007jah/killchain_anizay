// this EH will run on each disembark 
// ideally to solve the unassign players issue from freecargoslots 

this addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];

	if (_unit isPlayer) then {
		systemChat "A player got out";
		// if we can see this, we can explore the unassign player theory 
	} else {
		systemChat "AI got out";
	};
}];