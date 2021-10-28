/*
shows PL status of indifor troops 
*/

_data = _this select 0; // array of data elements 

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

disableSerialization;
600 cutRsc ["FULLSCREEN", "PLAIN"];
601 cutRsc ["COL1", "PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "FULLSCREEN")};

_displayOBJUNITS = uiNameSpace getVariable "FULLSCREEN";

_displayOBJUNITS2 = uiNameSpace getVariable "COL1";
_setText = _displayOBJUNITS2 displayCtrl 999506;
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

_grp1 = _data select 0;
_grpName = _grp1 select 0;
_leaderName = _grp1 select 1;
_leaderPos = _grp1 select 2;
_cnt = _grp1 select 3;
_cntInj = _grp1 select 4;
_distPL = _grp1 select 5;
_distObj = _grp1 select 6;
_lat = floor (_leaderPos select 0);
_lon = floor (_leaderPos select 1);

_setText ctrlSetStructuredText (parseText format ["
	<t>
		PESH SITREP<br /><br /><br />
		%1<br /><br />
		Size: %4<br /><br />
		Current Position: <br />
		LAT: %8<br />
		LON: %9<br /><br />
		Injured: %5<br /><br />
		Distance from you: %6<br /><br />
		Distance from Objective: %7<br /><br />
	</t>
", _grpName, _leaderName, _leaderPos, _cnt, _cntInj, _distPL, _distObj, _lat, _lon]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

// <t size='%3'>