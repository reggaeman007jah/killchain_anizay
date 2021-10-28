// one off order infor on numbers in AO - mayby other stuff later 

// FALLBACKREMAIN = false; // in case was running 

// get overall numbers of troops in redzone 
_unitsRedzone = allUnits inAreaArray "redzone";
	
// Redzone stats 
_redzoneIndi = 0;
{
	switch ((side _x)) do
	{
		case INDEPENDENT: {_redzoneIndi = _redzoneIndi + 1};
	};
} forEach _unitsRedzone;

if (_redzoneIndi > 0) then {
	format ["Pesh Units in AO: %1", _redzoneIndi] remoteExec ["systemChat", -2];
	"Bravo 3 out" remoteExec ["systemChat", 0, true];
} else {
	"No Response from Pesh" remoteExec ["systemChat", -2, true];
};

// use -2 here?
// do better display of information 
_allGrps = allGroups select { side _x isEqualTo independent };
_commPos = [] call RGGg_fnc_get_tinmanPos;
_objPos = getMarkerPos 'REDZONE';


_data = [];
{
	_leader = leader _x;
	_leaderPos = getPos leader _x;
	_units = units _x;
	_cnt = count _units;
	_distPL = _leaderPos distance _commPos;
	_distObj = _leaderPos distance _objPos;
	_injured = [];
	{
		_dam = damage _x;
		if (_dam > 0.8) then {
			_injured pushBack _x;	
		};
	} forEach _units;
	_cntInj = count _injured;

	_inRed = _leaderPos inArea "redzone";
	if (_inRed) then {
		_data pushBack [_x, _leader, _leaderPos, _cnt, _cntInj, _distPL, _distObj];
	};
	/*
	Group Name: 
	Group Leader Name:
	Group Leader Position:
	Units in Group:
	Number of badly injured:
	Distance of group from PL:
	Distance of group from Obj:
	Ammo count: TBC 
	Send - [_x]
	*/
} forEach _allGrps;

// send _data to display function 
[_data] call RGGi_fnc_information_sitrep;

// _inRed = _commPos inArea "redzone";