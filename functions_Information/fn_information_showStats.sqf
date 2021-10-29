/*
shows PL status of indifor troops 
*/

// _dataArray = _this select 0; // array of data elements 

disableSerialization;
600 cutRsc ["FULLSCREEN", "PLAIN"];
// 601 cutRsc ["COL1", "PLAIN"];
// 602 cutRsc ["COL2", "PLAIN"];
// 603 cutRsc ["COL3", "PLAIN"];
// 604 cutRsc ["COL4", "PLAIN"];
// 605 cutRsc ["COL5", "PLAIN"];
// 606 cutRsc ["COL6", "PLAIN"];
// 607 cutRsc ["COL7", "PLAIN"];
// 608 cutRsc ["COL8", "PLAIN"];
// 609 cutRsc ["COL9", "PLAIN"];
// 6010 cutRsc ["COL10", "PLAIN"];
// 6011 cutRsc ["COL11", "PLAIN"];
// 6012 cutRsc ["COL12", "PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "FULLSCREEN")};

_displayOBJUNITS2 = uiNameSpace getVariable "FULLSCREEN";
_setText = _displayOBJUNITS2 displayCtrl 999505;
_setText ctrlSetStructuredText (parseText format ["
	<t>
		MISSION DATA<br /><br /><br />
		<br /><br />
		CIVILIANS KILLED BY OUR ACTIONS: %1<br /><br />
	</t>
", RGG_civviesKilled]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];


// <t size='%3'>

	// _setText ctrlSetStructuredText (parseText format ["
	// <t size='%3'>
	// 	Welcome to Operation Killchain<br /><br /><br />
	// 	%1<br /><br />
	// 	Viking Platoon is made up of four elements - Viking 1 is the command element, Viking 2 and 3 are the main combat squads, Raptor is the fourth airborne branch<br /><br />
	// 	You are a Combat Engineer within Viking %2 Squad<br /><br />
	// 	As a the Squad Engineer, you are responsible a combination of repair and demolition duties - ensure you have a suitable range of explosives including wall-breaching charges and more substantial packs for larger demo orders<br /><br />
	// 	Stay cool, stay sharp and make sure you always cut the right wire!<br /><br />
	// 		</t>
	// ", _youAre, _squad, _fontSize]);


	// systemChat str _data;


// _youAre = _this select 0;
// _interfaceSize = _this select 1;
/*
_data pushBack [_x, _leader, _leaderPos, _cnt, _cntInj, _distPL, _distObj];
*/

// _fontSize = 2; // default for very small 

// switch (_interfaceSize) do {
// 	case 0.47: 	{ _fontSize = 2 };
// 	case 0.55: 	{ _fontSize = 1.67 };
// 	case 0.7: 	{ _fontSize = 1.19 };
// 	case 0.85: 	{ _fontSize = 0.7 }; // a guess 
// 	case 1: 	{ _fontSize = 0.3 }; // a guess
// 	default 	{ _fontSize = 2 };
// };