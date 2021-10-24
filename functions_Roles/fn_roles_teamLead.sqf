_youAre = _this select 0;
_interfaceSize = _this select 1;

_fontSize = 2; // default for very small 

switch (_interfaceSize) do {
	case 0.47: 	{ _fontSize = 2 };
	case 0.55: 	{ _fontSize = 1.67 };
	case 0.7: 	{ _fontSize = 1.19 };
	case 0.85: 	{ _fontSize = 0.7 }; // a guess 
	case 1: 	{ _fontSize = 0.3 }; // a guess
	default 	{ _fontSize = 2 };
};
disableSerialization;
600 cutRsc ["WELCOME_TEXT", "PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "WELCOME_TEXT")};

_displayOBJUNITS = uiNameSpace getVariable "WELCOME_TEXT";
_setText = _displayOBJUNITS displayCtrl 999500;
_setText ctrlSetStructuredText (parseText format ["
<t size='%2'>
	Welcome to Operation Killchain<br /><br /><br />
	%1<br /><br />
	Viking Platoon is made up of four elements, Viking 1 Command, Viking 2 and 3 Combat Squads, and Raptor Airbourne Squadron<br /><br />
	As a Viking Squad Leader, you are responsible for using the resouces at your disposal to deliver the objecties designated by Viking 1 Command<br /><br />
	You will have command autonomy within the mission framework designated by Viking 1:1 (or acting) - you will either operate as one squad or break into smaller teams, and the mission dictates<br /><br />
	Fight aggressively but intelligently - good luck Sergeant!<br /><br />
		</t>
", _youAre, _fontSize]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

sleep 30;

[_interfaceSize] spawn RGGr_fnc_roles_frequencies;

