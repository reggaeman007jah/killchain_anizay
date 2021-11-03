/*
This function listens to keypresses, and pushes relevant values to specific arrays (these arrays inform the requested actions, 
e.g. grid locations, or formations)
*/

if (VAHCO2_numericalInputbool) then {

	rgg_vahco_cnl = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 181) then {
		systemChat 'VAHCO2 SYSTEM ABORTED';
		[] call RGGv2_fnc_voice2_VAHCO_clearKeyDowns; 
		_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown', rgg_vahco_cnl];
		VAHCO2_numericalInputbool = false;
	}"];

	rgg_vahco_kd0 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 82) then {	
		systemChat 'VAHCO - 0';
		if (VAHCO2_gridSelectBool) then {
			VAHCO2_gridSelect pushback 0;
		};
		if (VAHCO2_distanceSelectBool) then {
			VAHCO2_distanceSelect pushback 0;
		};
	}"];

	rgg_vahco_kd1 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 79) then {
		systemChat 'VAHCO - 1';
		if (VAHCO2_orderSelectBool) then {
			VAHCO2_orderSelect pushback 1;
		};
		if (VAHCO2_groupSelectBool) then {
			VAHCO2_groupSelect pushback 1;
		};
		if (VAHCO2_gridSelectBool) then {
			VAHCO2_gridSelect pushback 1;
		};
		if (VAHCO2_directionSelectBool) then {
			VAHCO2_directionSelect pushback 1;
		};
		if (VAHCO2_distanceSelectBool) then {
			VAHCO2_distanceSelect pushback 1;
		};
		if (VAHCO2_formationSelectBool) then {
			VAHCO2_formationSelect pushback 1;
		};
		if (VAHCO2_confirmBool) then {
			VAHCO2_confirm pushback 1;
		};
	}"];

	rgg_vahco_kd2 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 80) then {
		systemChat 'VAHCO - 2';
		if (VAHCO2_orderSelectBool) then {
			VAHCO2_orderSelect pushback 2;
		};
		if (VAHCO2_groupSelectBool) then {
			VAHCO2_groupSelect pushback 2;
		};
		if (VAHCO2_gridSelectBool) then {
			VAHCO2_gridSelect pushback 2;
		};
		if (VAHCO2_directionSelectBool) then {
			VAHCO2_directionSelect pushback 2;
		};
		if (VAHCO2_distanceSelectBool) then {
			VAHCO2_distanceSelect pushback 2;
		};
		if (VAHCO2_formationSelectBool) then {
			VAHCO2_formationSelect pushback 2;
		};
		if (VAHCO2_confirmBool) then {
			VAHCO2_confirm pushback 2;
		};
	}"];

	rgg_vahco_kd3 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 81) then {	
		systemChat 'VAHCO - 3';
		if (VAHCO2_orderSelectBool) then {
			VAHCO2_orderSelect pushback 3;
		};
		if (VAHCO2_groupSelectBool) then {
			VAHCO2_groupSelect pushback 3;
		};
		if (VAHCO2_gridSelectBool) then {
			VAHCO2_gridSelect pushback 3;
		};
		if (VAHCO2_directionSelectBool) then {
			VAHCO2_directionSelect pushback 3;
		};
		if (VAHCO2_distanceSelectBool) then {
			VAHCO2_distanceSelect pushback 3;
		};
		if (VAHCO2_formationSelectBool) then {
			VAHCO2_formationSelect pushback 3;
		};
	}"];

	rgg_vahco_kd4 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 75) then {
		systemChat 'VAHCO - 4';
		if (VAHCO2_groupSelectBool) then {
			VAHCO2_groupSelect pushback 4;
		};
		if (VAHCO2_gridSelectBool) then {
			VAHCO2_gridSelect pushback 4;
		};
		if (VAHCO2_directionSelectBool) then {
			VAHCO2_directionSelect pushback 4;
		};
		if (VAHCO2_distanceSelectBool) then {
			VAHCO2_distanceSelect pushback 4;
		};
		if (VAHCO2_formationSelectBool) then {
			VAHCO2_formationSelect pushback 4;
		};
	}"];

	rgg_vahco_kd5 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 76) then {	
		systemChat 'VAHCO - 5';
		if (VAHCO2_groupSelectBool) then {
			VAHCO2_groupSelect pushback 5;
		};
		if (VAHCO2_gridSelectBool) then {
			VAHCO2_gridSelect pushback 5;
		};
		if (VAHCO2_directionSelectBool) then {
			VAHCO2_directionSelect pushback 5;
		};
		if (VAHCO2_distanceSelectBool) then {
			VAHCO2_distanceSelect pushback 5;
		};
		if (VAHCO2_formationSelectBool) then {
			VAHCO2_formationSelect pushback 5;
		};
	}"];

	rgg_vahco_kd6 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 77) then {
		systemChat 'VAHCO - 6';
		if (VAHCO2_groupSelectBool) then {
			VAHCO2_groupSelect pushback 6;
		};
		if (VAHCO2_gridSelectBool) then {
			VAHCO2_gridSelect pushback 6;
		};
		if (VAHCO2_directionSelectBool) then {
			VAHCO2_directionSelect pushback 6;
		};
		if (VAHCO2_distanceSelectBool) then {
			VAHCO2_distanceSelect pushback 6;
		};
		if (VAHCO2_formationSelectBool) then {
			VAHCO2_formationSelect pushback 6;
		};
	}"];

	rgg_vahco_kd7 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 71) then {
		systemChat 'VAHCO - 7';
		if (VAHCO2_groupSelectBool) then {
			VAHCO2_groupSelect pushback 7;
		};
		if (VAHCO2_gridSelectBool) then {
			VAHCO2_gridSelect pushback 7;
		};
		if (VAHCO2_directionSelectBool) then {
			VAHCO2_directionSelect pushback 7;
		};
		if (VAHCO2_distanceSelectBool) then {
			VAHCO2_distanceSelect pushback 7;
		};
		if (VAHCO2_formationSelectBool) then {
			VAHCO2_formationSelect pushback 7;
		};
	}"];

	rgg_vahco_kd8 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 72) then {	
		systemChat 'VAHCO - 8';
		if (VAHCO2_groupSelectBool) then {
			VAHCO2_groupSelect pushback 8;
		};
		if (VAHCO2_gridSelectBool) then {
			VAHCO2_gridSelect pushback 8;
		};
		if (VAHCO2_directionSelectBool) then {
			VAHCO2_directionSelect pushback 8;
		};
		if (VAHCO2_distanceSelectBool) then {
			VAHCO2_distanceSelect pushback 8;
		};
		if (VAHCO2_formationSelectBool) then {
			VAHCO2_formationSelect pushback 8;
		};
	}"];

	rgg_vahco_kd9 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 73) then {
		systemChat 'VAHCO - 9';
		if (VAHCO2_gridSelectBool) then {
			VAHCO2_gridSelect pushback 9;
		};
		if (VAHCO2_distanceSelectBool) then {
			VAHCO2_distanceSelect pushback 9;
		};
	}"];
};
		
/*
Old notes 
from:		
to:			

purpose:
listens to numpad keypresses, and sends respective values (numpad nums) into arrays 
the array the data is pushed into is dependent on the current state (bool) - this is managed by the monitor 

notes:
need to add a cancel to this! 
*/
