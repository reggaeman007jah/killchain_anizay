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
_displayOBJUNITS = uiNameSpace getVariable "WELCOME_TEXT";
_setText = _displayOBJUNITS displayCtrl 999500;
_setText ctrlSetStructuredText (parseText format ["
<t size='%1'>
	FREQUENCIES:<br /><br /><br />
	SHORTRANGE 50<br />General channel for platoon-level communication<br /><br />
	SHORTRANGE 51<br />Used by Viking 1 and Squad Leaders<br /><br />
	SHORTRANGE 52<br />Used by Viking 2 Squad<br /><br />
	SHORTRANGE 53<br />Used by Viking 3 Squad<br /><br />
	...<br /><br />
	SHORTRANGE 54 / LONGRANGE 54<br />Used by Padre / Raptor<br /><br />
		</t>
", _fontSize]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];