/*
from:		voiceMarkerSystem\1_vmsInit.sqf
to:			voiceMarkerSystem\
to:			voiceMarkerSystem\ 
to: 		voiceMarkerSystem\

purpose:
loop-listener that validates user input, and changes state at correct times 

notes:

issues:

*/

if (RGG_VMS_NumInputBool) then {

	rgg_cnl = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 181) then {
		systemChat 'VMS Aborted';
		execVM 'killchain\systems\voiceSystems\voiceMarkerSystem\clearKeyDowns.sqf'; 
		_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_cnl];
		RGG_VMS_NumInputBool = false;
		execVM 'killchain\systems\voiceSystems\voiceMarkerSystem\1_vmsInit.sqf';
	}"];

	rgg_kd0 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 82) then {
		systemChat '0';
		if (RGG_VMS_DistanceBool) then {
			RGG_VMS_Distance pushback 10;
		};
	}"];

	rgg_kd1 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 79) then {
		systemChat '1';
		if (RGG_VMS_CategoryBool) then {
			RGG_VMS_Category pushback 1;
		};
		if (RGG_VMS_TypeBool) then {
			RGG_VMS_Type pushback 1;
		};
		if (RGG_VMS_DistanceBool) then {
			RGG_VMS_Distance pushback 1;
		};
		if (RGG_VMS_ConfirmBool) then {
			RGG_VMS_Confirm pushback 1;
		};
	}"];

	rgg_kd2 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 80) then {
		systemChat '2';
		if (RGG_VMS_CategoryBool) then {
			RGG_VMS_Category pushback 2;
		};
		if (RGG_VMS_TypeBool) then {
			RGG_VMS_Type pushback 2;
		};
		if (RGG_VMS_DistanceBool) then {
			RGG_VMS_Distance pushback 2;
		};
		if (RGG_VMS_ConfirmBool) then {
			RGG_VMS_Confirm pushback 2;
		};
	}"];

	rgg_kd3 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 81) then {
		systemChat '3';
		if (RGG_VMS_CategoryBool) then {
			RGG_VMS_Category pushback 3;
		};
		if (RGG_VMS_TypeBool) then {
			RGG_VMS_Type pushback 3;
		};
		if (RGG_VMS_DistanceBool) then {
			RGG_VMS_Distance pushback 3;
		};
	}"];

	rgg_kd4 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 75) then {
		systemChat '4';
		if (RGG_VMS_CategoryBool) then {
			RGG_VMS_Category pushback 4;
		};
		if (RGG_VMS_TypeBool) then {
			RGG_VMS_Type pushback 4;
		};
		if (RGG_VMS_DistanceBool) then {
			RGG_VMS_Distance pushback 4;
		};
	}"];

	rgg_kd5 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 76) then {
		systemChat '5';
		if (RGG_VMS_CategoryBool) then {
			RGG_VMS_Category pushback 5;
		};
		if (RGG_VMS_TypeBool) then {
			RGG_VMS_Type pushback 5;
		};
		if (RGG_VMS_DistanceBool) then {
			RGG_VMS_Distance pushback 5;
		};
	}"];

	rgg_kd6 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 77) then {
		systemChat '6';
		if (RGG_VMS_DistanceBool) then {
			RGG_VMS_Distance pushback 6;
		};
	}"];

	rgg_kd7 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 71) then {
		systemChat '7';
		if (RGG_VMS_DistanceBool) then {
			RGG_VMS_Distance pushback 7;
		};
	}"];

	rgg_kd8 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 72) then {
		systemChat '8';
		if (RGG_VMS_DistanceBool) then {
			RGG_VMS_Distance pushback 8;
		};
	}"];

	rgg_kd9 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 73) then {
		systemChat '9';
		if (RGG_VMS_DistanceBool) then {
			RGG_VMS_Distance pushback 9;
		};
	}"];
};
		

