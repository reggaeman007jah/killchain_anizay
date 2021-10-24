/*
This will deliver key messages as RSC Text - lower right area 
*/

_messageText = _this select 0;
_messageVar = _this select 1;

disableSerialization;
// 599 cutRsc ["WELCOME_IMAGE", "PLAIN"];
701 cutRsc ["GENERAL_MESSAGE_LL", "PLAIN"];

// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "GENERAL_MESSAGE_LL")};
// ["<img image='media\images\flag1.jpg' />",[0.2,200],[0.2,200],10,1,0,9459] spawn bis_fnc_dynamicText;

// _displayOBJUNITS = uiNameSpace getVariable "WELCOME_IMAGE";
// _setText = _displayOBJUNITS displayCtrl 999501;
// _setText ctrlSetStructuredText (parseText "
// <img image='media\images\bigLogo.jpg' /><br /><br /><br />
// ");
// _setText ctrlSetBackgroundColor [0,0,0,0];

// sleep 12;

// <img image='media\images\bigLogo.jpg' />

_displayOBJUNITS = uiNameSpace getVariable "GENERAL_MESSAGE_LL";
_setText = _displayOBJUNITS displayCtrl 999503;
_setText ctrlSetStructuredText (parseText format [_messageText, _messageVar]);
// _setText ctrlSetStructuredText (parseText _text);
// _setText ctrlSetStructuredText (parseText "BLUFOR IS AT LZ ZEUS - PATROL IS NOW ACTIVE");
_setText ctrlSetBackgroundColor [0,0,0,0.5];

// "BLUFOR IS AT LZ ZEUS - PATROL IS NOW ACTIVE"