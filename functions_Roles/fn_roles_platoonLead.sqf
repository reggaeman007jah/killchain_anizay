/*
this role will be able to create enemy ahead of their position in buildings using key presses - eventually 
for now this just spawns opfor and civs randomly near to player role 

if this works then it will prove that things originating from initplayerlocal will remain local to the player 
even if you find yourself several functions in (one calling another etc)
*/

// sleep 3;

// hint "You are the platoon leader - Viking 1:1";

// sleep 6;

// hint "Viking Platoon is made up of four elements, all under your command";

// sleep 6;

// hint "Viking 1 is the command element, made up of you and two others: 1:2 is your 2nd in command, callsign Padre. 1:3 is your Platoon Sniper";

// sleep 6;

// hint "You have two fighting units available, Viking 2 and Viking 3. Each squad is made up of 7 units across multiple disciplines";

// sleep 6;

// hint "The forth fighting element is Raptor - this is your airborne branch, made up of two pilots";

// sleep 6;

// hint "Lead your platoon well LT - good luck!";

/*
Manages GUI text 

*/

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
// 599 cutRsc ["WELCOME_IMAGE", "PLAIN"];
600 cutRsc ["WELCOME_TEXT", "PLAIN"];

// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "WELCOME_TEXT")};
// ["<img image='media\images\flag1.jpg' />",[0.2,200],[0.2,200],10,1,0,9459] spawn bis_fnc_dynamicText;

// _displayOBJUNITS = uiNameSpace getVariable "WELCOME_IMAGE";
// _setText = _displayOBJUNITS displayCtrl 999501;
// _setText ctrlSetStructuredText (parseText "
// <img image='media\images\bigLogo.jpg' /><br /><br /><br />
// ");
// _setText ctrlSetBackgroundColor [0,0,0,0];

// sleep 12;

// <img image='media\images\bigLogo.jpg' />

_displayOBJUNITS = uiNameSpace getVariable "WELCOME_TEXT";
_setText = _displayOBJUNITS displayCtrl 999500;
// _setText ctrlSetStructuredText (parseText format ["WORKSHOP FOB <br />FOOD %1  <br />AMMO %2  <br />FUEL %3  <br />SENTRIES %4",RGG_Workshop_Food, RGG_Workshop_Ammo, RGG_Workshop_Fuel, RGG_Workshop_Sentries]);
_setText ctrlSetStructuredText (parseText format ["
<t size='%1'>
	Welcome to Operation Killchain<br /><br /><br />
	You are the platoon leader - Viking 1:1<br /><br />
	Viking Platoon is made up of four elements, all under your command<br /><br />
	Viking 1 is the command element, made up of you and two others: 1:2 is your 2nd in command, callsign Padre. 1:3 is your Platoon Sniper<br /><br />
	You have two fighting units available, Viking 2 and Viking 3. Each squad is made up of 7 units across multiple disciplines<br /><br />
	The forth fighting element is Raptor - this is your airborne branch, made up of two pilots<br /><br />
	...<br /><br />
	Lead your platoon well LT - good luck!<br /><br />
		</t>
", _fontSize]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

sleep 30;

[_interfaceSize] spawn RGGr_fnc_roles_frequencies;



