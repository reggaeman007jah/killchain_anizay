
_youAre = _this select 0;
_interfaceSize = _this select 1;

_squad = "";
if (_youAre == "You are Viking 2:6 / Viking 2 Combat Engineer") then {
	_squad = "2";
} else {
	_squad = "3";
};

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
<t size='%3'>
	Welcome to Operation Killchain<br /><br /><br />
	%1<br /><br />
	Viking Platoon is made up of four elements - Viking 1 is the command element, Viking 2 and 3 are the main combat squads, Raptor is the fourth airborne branch<br /><br />
	You are a Combat Engineer within Viking %2 Squad<br /><br />
	As a the Squad Engineer, you are responsible a combination of repair and demolition duties - ensure you have a suitable range of explosives including wall-breaching charges and more substantial packs for larger demo orders<br /><br />
	Stay cool, stay sharp and make sure you always cut the right wire!<br /><br />
		</t>
", _youAre, _squad, _fontSize]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

sleep 30;

[_interfaceSize] spawn RGGr_fnc_roles_frequencies;

RGG_itemsAA = []; // to manage AA items 
RGG_trucks = []; // to manage trucks 