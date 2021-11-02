/*
takes a group and formation reference 
*/

// _grp = _this select 0;
// _form = _this select 1;
params ["_grp", "_form"];

switch (_form) do {
	case 1 : { _grp setFormation "LINE" };
	case 2 : { _grp setFormation "STAG COLUMN" };
	case 3 : { _grp setFormation "WEDGE" };
	case 4 : { _grp setFormation "ECH LEFT" };
	case 5 : { _grp setFormation "ECH RIGHT" };
	case 6 : { _grp setFormation "VEE" };
	case 7 : { _grp setFormation "FILE" };
	case 8 : { _grp setFormation "DIAMOND" };
	default { systemChat "ERROR - formation switch" };
};

