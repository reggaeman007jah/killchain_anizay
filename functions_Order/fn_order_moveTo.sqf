/*
Will move given group to given 8-grid:
*/

params ["_grp", "_grids"];

systemChat "DATA ...";
systemChat format ["_grp: %1, _grids: %2", _grp, _grids];

_latData = _grids select 0;
_lonData = _grids select 1;
_group = _grp select 0;

_lat = format ["%1%2%3%4", (_latData select 0), (_latData select 1), (_latData select 2), (_latData select 3)]; 
_lon = format ["%1%2%3%4", (_lonData select 0), (_lonData select 1), (_lonData select 2), (_lonData select 3)]; 

systemChat format ["Lat: %1", _lat];
systemChat format ["Lon: %1", _lon];

_movePos = [];
/*
here is where we count the number of digits and insert zeros if too short 
*/
_parsedLat = parseNumber _lat;
_parsedLon = parseNumber _lon;

_movePos pushBack _parsedLat;
_movePos pushBack _parsedLon;

_cntLat = count _parsedLat;
_cntLon = count _parsedLon;

if (_cntLat != 4) then {
	systemChat format ["LAT DID NOT PASS VALIDATION - ONLY HAS %1 ELEMENTS", _cntLat];
	// add zeros here 
} else {
	systemChat "LAT PASSED VALIDATION";
};

if (_cntLon != 4) then {
	systemChat format ["LON DID NOT PASS VALIDATION - ONLY HAS %1 ELEMENTS", _cntLon];
	// add zeros here 
} else {
	systemChat "LON PASSED VALIDATION";
};

_group move _movePos;
systemChat format ["Group: %1 is moving to grid: %2", _group, _movePos];


/*
Notes:

e.g. 

Group 1 move to grid 1234 5678 
or 
Group 1, move 700m north west 

Proof of concept 

Player - Group 1 come in 

AI - Group 1 receives, what's the order? 

Player - Group 1, move some distance in some direction 

AI - Copy will move some distance in some direction 

Player - good copy, out (confirms) 



also 

Player - Group 1 come in 

AI - Go for Group 1 Actual 

Player - Group 1, pos rep 

AI - current pos: grid 
AI - currently x meters from objective

Player - Group 1 sitrep 

AI - we have 8 in the group, 2 are badly injured, ammo count is good 




*/

// systemchat str _lan;
// systemchat str _lon;

// _stringTestLan = [_lan] joinString "";
// // _countTestLan = count _stringTestLan;
// _stringTestLon	= [_lon] joinString "";
// // _countTestLon = count _stringTestLon;

// systemchat str _stringTestLan;
// systemchat str _stringTestLon;


// _parseData1	= _parsed_VAHCO_gridSelect2 joinString "";


// parsed_VAHCO_GroupSelect2 	= parseNumber _parsed_VAHCO_GroupSelect;
