/*
This should be run from initPlayerLocal, i.e. each player has this locally, but the effects are global 
This is triggered from a CBA keyPress, and takes no params 

Notes:
Currently this simply places a marker on player position - this needs to be more relevant to the action, i.e. it should link to 
room or house clearance and not just have a marker created anywhere 
Also this should be validated somehow, to ensure multiple markers are not instantiated, or duplicated 
Also, it would be nice to have the markers relate to the zoom level of the map 
Note the position of the building itself is not reliable as an anchor position, it could be, say, in a far corner and not in middle of floorplan 

Untested - I am now combining the building pos as a name element, and player pos as the pos element 
If works, this will mean that if a player spams the function there will only ever be one marker on the map 
I have also added distance validation, so if used 20+m away from a building, nothing happens 

*/

// systemChat "DEBUG - Clearance Marker Init";

_anchor = getPos player;
_data = nearestObjects [_anchor, ["house"], 20];

_chk = count _data;
if (_chk > 0) then {
	_pos = _data select 1;
	_posStr = str _pos;
	deleteMarker _posStr;
	_posStr = createMarker [_posStr, _anchor];
	_posStr setMarkerType "hd_objective";
	_posStr setMarkerColor "ColorGreen";
	_posStr setMarkerSize [0.5,0.5];
	// systemChat "DEBUG - Clearance Marker Created";
	[120, _posStr] spawn RGGd_fnc_delete_marker;
} else {
	// systemChat "DEBUG - No Clearance Marker Created - You are not near a building";
};




// _dstChk = _anchor distance _pos;

// if (_dskChk > ) then {
	
// } else {
	
// };







// old cuttings below 

// _anchor = getPos player;

// _data = nearestObjects [_anchor, ["house"], 20];




// // _name = str (_data select 0);
// _name = str _anchor;
// // _name2 = str (_data select 1);
// _pos = _data select 1;
// _name = createMarker [_name, _anchor];
// _name setMarkerType "hd_objective";
// _name setMarkerColor "ColorGreen";
// // _name setMarkerShape "ellipse";
// // _name setMarkerColor "green";
// _name setMarkerSize [1,1];

// systemChat format ["_data: %1", _data];
// _posData = [];
// _it = 1;
// {
// 	_subData = [];
// 	_pos = getPos _x;
// 	_subData pushBack _it;
// 	_subData pushBack _pos;
// 	_posData pushBack _subData;
// 	_it = _it + 1;
// } forEach _data;

// _test = _data select 0;
// systemChat format ["_test: %1", _test];


// _name2 = createMarker [_name2, _pos];
// // _marker = createMarker ["mIfestiona", _townpos];
// _name2 setMarkerType "hd_objective";
// _name2 setMarkerColor "ColorGreen";
// // _marker setMarkerText " Hefaistiona";
// _name2 setMarkerSize [0.5,0.5];
// _name2 setMarkerText _name;

// sleep 10;

// deleteMarker _name2;







