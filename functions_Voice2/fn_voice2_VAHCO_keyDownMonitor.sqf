/*
from:		voiceactivatedhighcommand\initialiseVAHCO.sqf 
to:			voiceactivatedhighcommand\VAHCO_OscarMike.sqf

purpose:
loop-listener that validates user input, and changes state at correct times 

notes:
I use RGG_Grp_Num in my display - do I need this var in the display? If so, can I remove the global?

order type 1 = general move order --- needs stop, fall back and move to me in this bunch 
order type 2 = objective-based order 
order type 3 = order multiple units at the same time --- essentially a group order to be executed simultaneously
order type 4 = route order

03 Sept:
I think I need new arrays to hold instructions for objective-based movement 
I can do it with just one array, so if 'any' content, then we know obj-based task is being given, the content 
itself determines the actual type of instruction 
1 = secure obj1, 2 = approach obj1, 3 = secure obj2, 4 = approach obj2, 5 = move to staging area 1, 6 = move to staging area 2

Added new section for order type 2 = objectives - now both lead to oscarMike.sqf 


*/

// this will get all indifor groups that are in the red AO and also are on the ground (i.e. are not in transit)
_redzoneGroups = [];
_allGroupsData = allGroups select { side _x isEqualTo independent };
systemChat format ["_allGroups: %1", _allGroupsData];
_allGroups = [];

{
	// remove any with only 1 unit 
	_cnt = count units _x;
	if (_cnt > 1) then {
		_allGroups pushBack _x;
	};
} forEach _allGroupsData;

// {
// 	_pos = leader _x;
// 	_inRed = _pos inArea "redzone";
// 	_posATL = _pos select 2;
// 	if ((_inRed) && (_posATL < 3)) then {
// 		_redzoneGroups pushBack _x;
// 	};
// } forEach allGroups;

// if ((count _allGroups) == 0) exitWith {
// 	systemChat "no groups to control";
// };

_chosenGroup = [];
_cnt = count _allGroups;

while {VAHCO2_numericalInputbool} do {

	VAHCO2_Validate_Orders = count VAHCO2_orderSelect; // should contain 1 value 
	VAHCO2_Validate_Group = count VAHCO2_groupSelect; // should contain 1 value 
	VAHCO2_Validate_Grids = count VAHCO2_gridSelect; // should be 8 
	VAHCO2_Validate_Confirm = count VAHCO2_confirm; // should be 1 

	if (VAHCO2_orderSelectBool) then {
		if (VAHCO2_Validate_Orders == 1) then { 
			_orderType = VAHCO2_orderSelect select 0;
			systemChat "test";
			if (_orderType == 1) then {
				systemChat "you have selected group move order system - now select group to move:";
				// here you are choosing a group, from 1-8 - we cannot have more than 8 groups in-play in this system, so need to think abuot merging or limiting AI indi groups somehow 
				// so we need to associate the number here with the group - so the player must be able to see the group, and the number 

				_iteration = 1;
				for "_i" from 1 to _cnt do {
					_grp = _allGroups select (_iteration - 1);
					_size = count units _grp;
					systemChat format ["Press %1: %2 (size: %3 units)", _iteration, _grp, _size];
					_iteration = _iteration + 1;
				};
				VAHCO2_orderSelectBool = false;
				VAHCO2_groupSelectBool = true;
			};
			// if (_orderType == 2) then {
			// 	// merge?
			// };
			// if (_orderType == 3) then {
			// 	// unmerge injured for extract?
			// };
		};
	};

	if (VAHCO2_groupSelectBool) then {
		if (VAHCO2_Validate_Group == 1) then {
			// so here, you've chosen a group 
			_group = VAHCO2_groupSelect select 0;
			
			switch (_group) do {
				case 1: { systemChat format ["You have chosen: %1", _allGroups select 0]; _chosenGroup pushBack (_allGroups select 0) };
				case 2: { systemChat format ["You have chosen: %1", _allGroups select 1]; _chosenGroup pushBack (_allGroups select 1) };
				case 3: { systemChat format ["You have chosen: %1", _allGroups select 2]; _chosenGroup pushBack (_allGroups select 2) };
				case 4: { systemChat format ["You have chosen: %1", _allGroups select 3]; _chosenGroup pushBack (_allGroups select 3) };
				case 5: { systemChat format ["You have chosen: %1", _allGroups select 4]; _chosenGroup pushBack (_allGroups select 4) };
				case 6: { systemChat format ["You have chosen: %1", _allGroups select 5]; _chosenGroup pushBack (_allGroups select 5) };
				case 7: { systemChat format ["You have chosen: %1", _allGroups select 6]; _chosenGroup pushBack (_allGroups select 6) };
				case 8: { systemChat format ["You have chosen: %1", _allGroups select 7]; _chosenGroup pushBack (_allGroups select 7) };
				default { systemChat "switch error - group select" };
			};
			systemChat "Now issue an 8-grid destination";
			VAHCO2_groupSelectBool = false;
			VAHCO2_gridSelectBool = true;
		};
	};

	if (VAHCO2_gridSelectBool) then {
		if (VAHCO2_Validate_Grids == 8) then {
			// so here, you've entered an 8-grid  
			systemChat format ["Grid Entered: %1", VAHCO2_gridSelect];
			systemChat "Now confirm (1) or cancel (2)";
			VAHCO2_gridSelectBool = false;
			VAHCO2_confirmBool = true;
		};
	};

	if (VAHCO2_confirmBool) then {
		if (VAHCO2_Validate_Confirm == 1) then {
			// so here, you've confirmed or cancelled  
			systemChat format ["NOTE - VAHCO2_gridSelect: %1", VAHCO2_gridSelect];
			_res = VAHCO2_confirm select 0;
			switch (_res) do {
				case 1: {
					systemChat "order confirmed"; 
					// _num = VAHCO2_groupSelect select 0;
					_group = _chosenGroup select 0;
					_movePos = [];
					_lat = [];
					_lon = [];
					_lat pushBack (VAHCO2_gridSelect select 0);
					_lat pushBack (VAHCO2_gridSelect select 1);
					_lat pushBack (VAHCO2_gridSelect select 2);
					_lat pushBack (VAHCO2_gridSelect select 3);
					_lon pushBack (VAHCO2_gridSelect select 4);
					_lon pushBack (VAHCO2_gridSelect select 5);
					_lon pushBack (VAHCO2_gridSelect select 6);
					_lon pushBack (VAHCO2_gridSelect select 7);
					_movePos pushBack _lat;
					_movePos pushBack _lon;
					[_chosenGroup, _movePos] call RGGo_fnc_order_moveTo;
				};
				case 2: {
					systemchat "order cancelled"; 
				};
				default { systemChat "switch error - confirm order"; };
			};
			VAHCO2_confirmBool = false;
			[] call RGGv2_fnc_voice2_VAHCO_clearKeyDowns; 
		};
	};

	sleep 0.5;
};

