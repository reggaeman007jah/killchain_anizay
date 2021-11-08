

// test 
// "Test OK!" remoteExec ["hint", 0, true];	

// get all buildings in near radius 

// sleep 2;

_anchor = getPos player;

_data = nearestObjects [_anchor, ["house"], 20];
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



// _name = str (_data select 0);
_name = str _anchor;
// _name2 = str (_data select 1);
_pos = _data select 1;
_name = createMarker [_name, _anchor];
_name setMarkerType "hd_objective";
_name setMarkerColor "ColorGreen";
// _name setMarkerShape "ellipse";
// _name setMarkerColor "green";
_name setMarkerSize [1,1];

[120, _name] spawn RGGd_fnc_delete_marker;

// _name2 = createMarker [_name2, _pos];
// // _marker = createMarker ["mIfestiona", _townpos];
// _name2 setMarkerType "hd_objective";
// _name2 setMarkerColor "ColorGreen";
// // _marker setMarkerText " Hefaistiona";
// _name2 setMarkerSize [0.5,0.5];
// _name2 setMarkerText _name;

// sleep 10;

// deleteMarker _name2;







