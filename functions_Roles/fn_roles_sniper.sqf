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
	You are the Viking Platoon Sniper, your designation is Viking 1:3<br /><br />
	Viking Platoon is made up of four elements, you form part of Viking 1, which is the command element of the Platoon<br /><br />
	The Platoon has two main fighting squads: Viking 2 and Viking 3. Each squad is made up of 7 units across multiple disciplines.
	The forth Platoon element is Raptor - airborne ops<br /><br />
	Your deployment will vary, you will need to embed with Viking 1, 2 and 3 as the situation dictates - additionally, as part of the command element, you will be requrired to take on Platoon Lead or Padre Radio Duties as instructed<br /><br />
	Stay sharp shooter!<br /><br />
		</t>
", _fontSize]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

sleep 30;

[_interfaceSize] spawn RGGr_fnc_roles_frequencies;