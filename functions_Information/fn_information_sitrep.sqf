/*
shows PL status of indifor troops 
*/

_dataArray = _this select 0; // array of data elements 

disableSerialization;
// 600 cutRsc ["FULLSCREEN", "PLAIN"];
601 cutRsc ["COL1", "PLAIN"];
602 cutRsc ["COL2", "PLAIN"];
603 cutRsc ["COL3", "PLAIN"];
604 cutRsc ["COL4", "PLAIN"];
605 cutRsc ["COL5", "PLAIN"];
606 cutRsc ["COL6", "PLAIN"];
607 cutRsc ["COL7", "PLAIN"];
608 cutRsc ["COL8", "PLAIN"];
// 609 cutRsc ["COL9", "PLAIN"];
// 6010 cutRsc ["COL10", "PLAIN"];
// 6011 cutRsc ["COL11", "PLAIN"];
// 6012 cutRsc ["COL12", "PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "COL1")};


_cnt = count _dataArray; // to determine how many groups to display 
systemChat format ["THERE ARE %1 GROUPS TO DISPLAY", _cnt];
_display = [];
switch (_cnt) do {
	case 1: 	{ _display = [1,0,0,0,0,0,0,0,0,0,0,0] };
	case 2: 	{ _display = [1,1,0,0,0,0,0,0,0,0,0,0] };
	case 3: 	{ _display = [1,1,1,0,0,0,0,0,0,0,0,0] };
	case 4: 	{ _display = [1,1,1,1,0,0,0,0,0,0,0,0] };
	case 5: 	{ _display = [1,1,1,1,1,0,0,0,0,0,0,0] };
	case 6: 	{ _display = [1,1,1,1,1,1,0,0,0,0,0,0] };
	case 7: 	{ _display = [1,1,1,1,1,1,1,0,0,0,0,0] };
	case 8: 	{ _display = [1,1,1,1,1,1,1,1,0,0,0,0] };
	case 9: 	{ _display = [1,1,1,1,1,1,1,1,1,0,0,0] };
	case 10: 	{ _display = [1,1,1,1,1,1,1,1,1,1,0,0] };
	case 11: 	{ _display = [1,1,1,1,1,1,1,1,1,1,1,0] };
	case 12: 	{ _display = [1,1,1,1,1,1,1,1,1,1,1,1] };
	// case 1: 	{ _display pushBack 100000000000 };
	// case 2: 	{ _display pushBack 110000000000 };
	// case 3: 	{ _display pushBack 111000000000 };
	// case 4: 	{ _display pushBack 111100000000 };
	// case 5: 	{ _display pushBack 111110000000 };
	// case 6: 	{ _display pushBack 111111000000 };
	// case 7: 	{ _display pushBack 111111100000 };
	// case 8: 	{ _display pushBack 111111110000 };
	// case 9: 	{ _display pushBack 111111111000 };
	// case 10: 	{ _display pushBack 111111111100 };
	// case 11: 	{ _display pushBack 111111111110 };
	// case 12: 	{ _display pushBack 111111111111 };
	default { systemChat "SITREP ISSUE - NO GROUPS" };
};
// _display = [[1], [1], [1]];
// systemChat format ["AFTER SWITCH _DISPLAY IS %1", _display];
sleep 1;

// _displayOBJUNITS = uiNameSpace getVariable "FULLSCREEN";

if ((_display select 0 ) == 1) then {
	_displayOBJUNITS2 = uiNameSpace getVariable "COL1";
	_setText = _displayOBJUNITS2 displayCtrl 999506;
	_data = _dataArray select 0;
	_grp = _data select 0; 
	_cnt = _data select 3; 
	_leaderPos = _data select 2; 
	_lat = floor (_leaderPos select 0);
	_lon = floor (_leaderPos select 1);
	_cntInj = _data select 4;
	_distPL = _data select 5;
	_distObj = _data select 6;
	_setText ctrlSetStructuredText (parseText format ["
		<t>
			%1 SITREP<br /><br /><br />
			<br /><br />
			Size: %2<br /><br />
			Current Position: <br />
			LAT: %3<br />
			LON: %4<br /><br />
			Injured: %5<br /><br />
			Distance from you: %6<br /><br />
			Distance from Objective: %7<br /><br />
		</t>
	", _grp, _cnt, _lat, _lon, _cntInj, _distPL, _distObj]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];
} else {
	_displayOBJUNITS1 = uiNameSpace getVariable "COL1";
	_setText = _displayOBJUNITS1 displayCtrl 999506;
	_text = "NO GROUP DATA";
	_setText ctrlSetStructuredText (parseText format ["
		<t>
			%1
		</t>
	", _text]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];
};

if ((_display select 1 ) == 1) then {
	_displayOBJUNITS2 = uiNameSpace getVariable "COL2";
	_setText = _displayOBJUNITS2 displayCtrl 999507;
	_data = _dataArray select 1;
	_grp = _data select 0; 
	_cnt = _data select 3; 
	_leaderPos = _data select 2; 
	_lat = floor (_leaderPos select 0);
	_lon = floor (_leaderPos select 1);
	_cntInj = _data select 4;
	_distPL = _data select 5;
	_distObj = _data select 6;
	_setText ctrlSetStructuredText (parseText format ["
		<t>
			%1 SITREP<br /><br /><br />
			<br /><br />
			Size: %2<br /><br />
			Current Position: <br />
			LAT: %3<br />
			LON: %4<br /><br />
			Injured: %5<br /><br />
			Distance from you: %6<br /><br />
			Distance from Objective: %7<br /><br />
		</t>
	", _grp, _cnt, _lat, _lon, _cntInj, _distPL, _distObj]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];
} else {
	_displayOBJUNITS1 = uiNameSpace getVariable "COL2";
	_setText = _displayOBJUNITS1 displayCtrl 999507;
	_text = "NO GROUP DATA";
	_setText ctrlSetStructuredText (parseText format ["
		<t>
			%1
		</t>
	", _text]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];
};

if ((_display select 2 ) == 1) then {
	_displayOBJUNITS2 = uiNameSpace getVariable "COL3";
	_setText = _displayOBJUNITS2 displayCtrl 999508;
	_data = _dataArray select 2;
	_grp = _data select 0; 
	_cnt = _data select 3; 
	_leaderPos = _data select 2; 
	_lat = floor (_leaderPos select 0);
	_lon = floor (_leaderPos select 1);
	_cntInj = _data select 4;
	_distPL = _data select 5;
	_distObj = _data select 6;
	_setText ctrlSetStructuredText (parseText format ["
		<t>
			%1 SITREP<br /><br /><br />
			<br /><br />
			Size: %2<br /><br />
			Current Position: <br />
			LAT: %3<br />
			LON: %4<br /><br />
			Injured: %5<br /><br />
			Distance from you: %6<br /><br />
			Distance from Objective: %7<br /><br />
		</t>
	", _grp, _cnt, _lat, _lon, _cntInj, _distPL, _distObj]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];
} else {
	_displayOBJUNITS1 = uiNameSpace getVariable "COL3";
	_setText = _displayOBJUNITS1 displayCtrl 999508;
	_text = "NO GROUP DATA";
	_setText ctrlSetStructuredText (parseText format ["
		<t>
			%1
		</t>
	", _text]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];
};


if ((_display select 3 ) == 1) then {
	_displayOBJUNITS2 = uiNameSpace getVariable "COL4";
	_setText = _displayOBJUNITS2 displayCtrl 999509;
	_data = _dataArray select 3;
	_grp = _data select 0; 
	_cnt = _data select 3; 
	_leaderPos = _data select 2; 
	_lat = floor (_leaderPos select 0);
	_lon = floor (_leaderPos select 1);
	_cntInj = _data select 4;
	_distPL = _data select 5;
	_distObj = _data select 6;
	_setText ctrlSetStructuredText (parseText format ["
		<t>
			%1 SITREP<br /><br /><br />
			<br /><br />
			Size: %2<br /><br />
			Current Position: <br />
			LAT: %3<br />
			LON: %4<br /><br />
			Injured: %5<br /><br />
			Distance from you: %6<br /><br />
			Distance from Objective: %7<br /><br />
		</t>
	", _grp, _cnt, _lat, _lon, _cntInj, _distPL, _distObj]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];
} else {
	_displayOBJUNITS1 = uiNameSpace getVariable "COL4";
	_setText = _displayOBJUNITS1 displayCtrl 999509;
	_text = "NO GROUP DATA";
	_setText ctrlSetStructuredText (parseText format ["
		<t>
			%1
		</t>
	", _text]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];
};
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