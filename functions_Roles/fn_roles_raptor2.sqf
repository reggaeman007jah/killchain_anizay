_interfaceSize = _this select 0;

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
<t size='%1'>
	Welcome to Operation Killchain<br /><br /><br />
	You are Raptor Squadron 2IC - Raptor 2<br /><br />
	Viking Platoon is made up of four elements - Viking 1 is the command element, Viking 2 and 3 Squads are the main fighting elements<br /><br />
	Working under direct instruction of Raptor 1, your role is to ensure that all necessary airbourne tasks are carried out<br /><br />
	This is a varied role, made up of transportation, logistics and close air support - you will need to be proficient in the operation of a range of different helicopters and fixed wing aircraft<br /><br />
	In addition to this, you may also be called upon to carry out CSAR, extraction and medivac duties<br /><br />
	Fly well, Pilot, you are the lifeline for Viking Platoon<br /><br />
		</t>
", _fontSize]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

sleep 30;

[_interfaceSize] spawn RGGr_fnc_roles_frequencies;