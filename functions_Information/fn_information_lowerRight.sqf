/*
This will deliver key messages as RSC Text - lower right area 
*/

_text = _this select 0;

disableSerialization;
// 599 cutRsc ["WELCOME_IMAGE", "PLAIN"];
700 cutRsc ["GENERAL_MESSAGE", "PLAIN"];

// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "GENERAL_MESSAGE")};
// ["<img image='media\images\flag1.jpg' />",[0.2,200],[0.2,200],10,1,0,9459] spawn bis_fnc_dynamicText;

// _displayOBJUNITS = uiNameSpace getVariable "WELCOME_IMAGE";
// _setText = _displayOBJUNITS displayCtrl 999501;
// _setText ctrlSetStructuredText (parseText "
// <img image='media\images\bigLogo.jpg' /><br /><br /><br />
// ");
// _setText ctrlSetBackgroundColor [0,0,0,0];

// sleep 12;

// <img image='media\images\bigLogo.jpg' />

_displayOBJUNITS = uiNameSpace getVariable "GENERAL_MESSAGE";
_setText = _displayOBJUNITS displayCtrl 999502;
// _setText ctrlSetStructuredText (parseText format ["WORKSHOP FOB <br />FOOD %1  <br />AMMO %2  <br />FUEL %3  <br />SENTRIES %4",RGG_Workshop_Food, RGG_Workshop_Ammo, RGG_Workshop_Fuel, RGG_Workshop_Sentries]);
_setText ctrlSetStructuredText (parseText _text);
// _setText ctrlSetStructuredText (parseText "BLUFOR IS AT LZ ZEUS - PATROL IS NOW ACTIVE");
_setText ctrlSetBackgroundColor [0,0,0,0.5];

// "BLUFOR IS AT LZ ZEUS - PATROL IS NOW ACTIVE"
