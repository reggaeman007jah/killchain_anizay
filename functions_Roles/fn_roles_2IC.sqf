// sleep 3;

// hint "You are the Viking Platoon 2nd in command, your callsign is Padre 1:2";

// sleep 6;

// hint "Viking Platoon is made up of four elements, you form part of 1:1, which is the command element";

// sleep 6;

// hint "Viking 1 actual (1:1) is the Platoon Commander, you as 1:2 support him/her in mission delivery";

// sleep 6;

// hint "Apart from acting as Platoon Commander when 1:1 is off station, your other primary responsibility is to manage all long-range communication with Raptor Squadron";

// sleep 6;

// hint "Viking Platton has two main fighting units available, Viking 2 and Viking 3. Each squad is made up of 7 units across multiple disciplines";

// sleep 6;

// hint "The forth fighting element is Raptor - this is your airborne branch, made up of two pilots";

// sleep 6;

// hint "Good luck!";
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
// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "WELCOME_TEXT")};

// workshop display stats
_displayOBJUNITS = uiNameSpace getVariable "WELCOME_TEXT";
_setText = _displayOBJUNITS displayCtrl 999500;
// _setText ctrlSetStructuredText (parseText format ["WORKSHOP FOB <br />FOOD %1  <br />AMMO %2  <br />FUEL %3  <br />SENTRIES %4",RGG_Workshop_Food, RGG_Workshop_Ammo, RGG_Workshop_Fuel, RGG_Workshop_Sentries]);
_setText ctrlSetStructuredText (parseText format ["
<t size='%1'>
	Welcome to Operation Killchain<br /><br /><br />
	You are the Viking Platoon 2IC, your designation is Viking 1:2, callsign Padre<br /><br />
	Viking Platoon is made up of four elements, you form part of Viking 1, which is the command element of the Platoon<br /><br />
	The Platoon has two main fighting squads: Viking 2 and Viking 3. Each squad is made up of 7 units across multiple disciplines.
	The fourth Platoon element is Raptor - airborne ops<br /><br />
	Apart from acting as Platoon Commander when 1:1 is off station, your other primary responsibility is to manage all long-range communication with Raptor Squadron<br /><br />
	Good luck out there Padre!<br /><br />
		</t>
", _fontSize]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

sleep 30;

[_interfaceSize] spawn RGGr_fnc_roles_frequencies;