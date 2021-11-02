/*
This function will listen for data changes, and issue bool changes at certain trigger points 
e.g. if an array needs 8 values (grids), this system will keep checking until all 8 values are present in the array, and when they are, will progress the state to the next logic state 

*/

// this will get all indifor groups that are in the red AO and also are on the ground (i.e. are not in transit)
_redzoneGroups = [];
_allGroupsData = allGroups select { side _x isEqualTo independent };
systemChat format ["_allGroups: %1", _allGroupsData];
_allGroups = []; // to hold all groups bigger than one unit, and are on ground 
// _singleGrous = []; // to hold groups with only one unit 

// this will remove any group with only 1 unit 
{
	_cnt = count units _x;
	if (_cnt > 1) then {
		_allGroups pushBack _x;
	};
} forEach _allGroupsData;
/*
NOTE - how do we manage this in future? What happens if there are say 3 groups with single units? 
should there be some sort of alert system to tell us of this?
I assume we'd want to enable the merging of single-unit groups into bigger groups when we build the merge functionality 
*/

// {
// 	_pos = leader _x;
// 	_inRed = _pos inArea "redzone";
// 	_posATL = _pos select 2;
// 	if ((_inRed) && (_posATL < 3)) then {
// 		_redzoneGroups pushBack _x;
// 	};
// } forEach allGroups;

/*
NOTE - we need to better manage what happens when there are no group to control - the below did not work as intened before, possibly
bc the desk person was seen as a group, and therefore we did not register zero groups - more testing needed 
don't forget to remove all active keyDown EHs and active bools including vamp 
*/
// if ((count _allGroups) == 0) exitWith {
// 	systemChat "no groups to control";
// };

_chosenGroup = [];
_cnt = count _allGroups; // currently excluding single-unit groups 

while {VAHCO2_numericalInputbool} do {

	// VAHCO2_Validate_Orders = count VAHCO2_orderSelect; // expect 1 
	_cntOrderSelect = count VAHCO2_orderSelect; // expect 1 
	// VAHCO2_Validate_Group = count VAHCO2_groupSelect; // expect 1 
	_cntGroupSelect = count VAHCO2_groupSelect; // expect 1 
	// VAHCO2_Validate_Grids = count VAHCO2_gridSelect; // expect 8 
	_cntGridSelect = count VAHCO2_gridSelect; // expect 8 
	// VAHCO2_Validate_Formation = count VAHCO2_formationSelect // expect 1
	_cntFormationSelect = count VAHCO2_formationSelect // expect 1
	// VAHCO2_Validate_Confirm = count VAHCO2_confirm; // expect 1 
	_cntConfirm = count VAHCO2_confirm; // expect 1 

	if (VAHCO2_orderSelectBool) then {
		if (_cntOrderSelect == 1) then { 
			// an order has been issued 
			_orderType = VAHCO2_orderSelect select 0; 
			switch (_orderType) do {
				case 1: { 
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
				case 2: { 
					systemChat "you have selected group formation order system - now select group to move:";
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
				default { systemChat "switch error - order select" };
			};
			// replaced if/thens with switches 
			// if (_orderType == 1) then {
			// 	systemChat "you have selected group move order system - now select group to move:";
			// 	// here you are choosing a group, from 1-8 - we cannot have more than 8 groups in-play in this system, so need to think abuot merging or limiting AI indi groups somehow 
			// 	// so we need to associate the number here with the group - so the player must be able to see the group, and the number 

			// 	_iteration = 1;
			// 	for "_i" from 1 to _cnt do {
			// 		_grp = _allGroups select (_iteration - 1);
			// 		_size = count units _grp;
			// 		systemChat format ["Press %1: %2 (size: %3 units)", _iteration, _grp, _size];
			// 		_iteration = _iteration + 1;
			// 	};
			// 	VAHCO2_orderSelectBool = false;
			// 	VAHCO2_groupSelectBool = true;
			// };

			// if (_orderType == 2) then {
			// 	systemChat "you have selected group formation order system - now select group to move:";

			// 	_iteration = 1;
			// 	for "_i" from 1 to _cnt do {
			// 		_grp = _allGroups select (_iteration - 1);
			// 		_size = count units _grp;
			// 		systemChat format ["Press %1: %2 (size: %3 units)", _iteration, _grp, _size];
			// 		_iteration = _iteration + 1;
			// 	};
			// 	VAHCO2_orderSelectBool = false;
			// 	VAHCO2_groupSelectBool = true;
			// };

			// if (_orderType == 2) then {
			// 	// merge?
			// };
			// if (_orderType == 3) then {
			// 	// unmerge injured for extract?
			// };
		};
	};

	if (VAHCO2_groupSelectBool) then {
		if (_cntGroupSelect == 1) then {
			// so here, you've chosen a group 
			_group = VAHCO2_groupSelect select 0;
			switch ( _group ) do {
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
			// here we switch the order type 
			_orderType = VAHCO2_orderSelect select 0;
			switch ( _orderType ) do {
				case 1: { 			
					systemChat "Now issue an 8-grid destination";
					VAHCO2_groupSelectBool = false;
					VAHCO2_gridSelectBool = true;
				};
				case 2: { 
					systemChat "Now confirm formation type";
					systemChat "1 - Line";
					systemChat "2 - Stag Col";
					systemChat "3 - Wedge";
					systemChat "4 - Ech Left";
					systemChat "5 - Ech Right";
					systemChat "6 - Vee";
					systemChat "7 - File";
					systemChat "8 - Diamond";
					VAHCO2_groupSelectBool = false;
					VAHCO2_formationSelectBool = true;
				};
				default { systemChat "ERROR - switch order type" };
			};
		};
	};

	if (VAHCO2_gridSelectBool) then {
		if (_cntGridSelect == 8) then {
			// so here, you've entered an 8-grid  
			systemChat format ["Grid Entered: %1", VAHCO2_gridSelect];
			systemChat "Now confirm (1) or cancel (2)";
			VAHCO2_gridSelectBool = false;
			VAHCO2_confirmBool = true;
		};
	};

	if (VAHCO2_formationSelectBool) then {
		if (_cntFormationSelect == 1) then {
			// so here, you've confirmed formation type  
			systemChat format ["Formation Code Selected: %1", VAHCO2_formationSelect];
			systemChat "Now confirm (1) or cancel (2)";
			VAHCO2_formationSelectBool = false;
			VAHCO2_confirmBool = true;
		};
	};

	if (VAHCO2_confirmBool) then {
		if (_cntConfirm == 1) then {

			// need to switch data entries and call different orders respectively 
			_orderType = VAHCO2_orderSelect select 0;
			switch (_orderType) do {

				case 1: { // grid move order 
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
							systemchat "move order cancelled"; 
						};
						default { systemChat "switch error - confirm order"; };
					};
					VAHCO2_confirmBool = false;
					[] call RGGv2_fnc_voice2_VAHCO_clearKeyDowns; 
				 };
				case 2: { // formation order 
					// so here, you've confirmed or cancelled  
					systemChat format ["NOTE - VAHCO2_formationSelect: %1", VAHCO2_formationSelect];
					_res = VAHCO2_confirm select 0;
					switch (_res) do {
						case 1: {
							systemChat "order confirmed"; 
							// _num = VAHCO2_groupSelect select 0;
							_group = _chosenGroup select 0;
							_formCode = VAHCO2_formationSelect select 0;
							[_chosenGroup, _formCode] call RGGo_fnc_order_formation;
						};
						case 2: {
							systemchat "formation order cancelled"; 
						};
						default { systemChat "switch error - confirm order"; };
					};
					VAHCO2_confirmBool = false;
					[] call RGGv2_fnc_voice2_VAHCO_clearKeyDowns; 
				};
				default { systemChat "ERROR - VAHCO2 confirm switch error" };
			};
		};
	};
	
	sleep 0.5;
};

// old 
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