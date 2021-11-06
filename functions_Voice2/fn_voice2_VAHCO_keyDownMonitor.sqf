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
	if (_cnt > 0) then {
		_allGroups pushBack _x;
	};
} forEach _allGroupsData;
// note - removed indifor desk man, now easier to manage single unit groups .. so the above was altered to reflect this 

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

_chosenGroup = []; // anchor data for main group in question, in logic tree 
_mergeToGroup = []; // to hold a group that will take over a given group
_cnt = count _allGroups; // currently excluding single-unit groups 

while {VAHCO2_numericalInputbool} do {

	_cntOrderSelect = count VAHCO2_orderSelect; // expect 1 
	_cntGroupSelect = count VAHCO2_groupSelect; // expect 2 
	_cntGridSelect = count VAHCO2_gridSelect; // expect 8 
	_cntDirSelect = count VAHCO2_directionSelect; // expect 1 
	_cntDistSelect = count VAHCO2_distanceSelect; // expect 1 
	_cntFormationSelect = count VAHCO2_formationSelect; // expect 1
	_cntMergeSelect = count VAHCO2_mergeSelect; // expect 2

	_cntConfirm = count VAHCO2_confirm; // expect 1 

	if (VAHCO2_orderSelectBool) then {
		if (_cntOrderSelect == 1) then { 
			// an order has been issued 
			_orderType = VAHCO2_orderSelect select 0; 
			switch (_orderType) do {
				case 1: { 
					systemChat "Grid Move Order - Select Group:";
					// here you are choosing a group, from 1-8 - we cannot have more than 8 groups in-play in this system, so need to think abuot merging or limiting AI indi groups somehow 
					// so we need to associate the number here with the group - so the player must be able to see the group, and the number 
					_iteration = 1;
					for "_i" from 1 to _cnt do {
						_grp = _allGroups select (_iteration - 1);
						_size = count units _grp;
						systemChat format ["%1 (size: %2 units)", _grp, _size];
						_iteration = _iteration + 1;
					};
					VAHCO2_orderSelectBool = false;
					VAHCO2_groupSelectBool = true;
				};
				case 2: { 
					systemChat "Basic Move Order - Select Group:";
					_iteration = 1;
					for "_i" from 1 to _cnt do {
						_grp = _allGroups select (_iteration - 1);
						_size = count units _grp;
						systemChat format ["%1 (size: %2 units)", _grp, _size];
						_iteration = _iteration + 1;
					};
					VAHCO2_orderSelectBool = false;
					VAHCO2_groupSelectBool = true;
				};
				case 3: { 
					systemChat "Formation Order - Select Group:";
					_iteration = 1;
					for "_i" from 1 to _cnt do {
						_grp = _allGroups select (_iteration - 1);
						_size = count units _grp;
						systemChat format ["%1 (size: %2 units)", _grp, _size];
						_iteration = _iteration + 1;
					};
					VAHCO2_orderSelectBool = false;
					VAHCO2_groupSelectBool = true;
				};
				case 4: { 
					systemChat "Merge Order - Select Group:";
					_iteration = 1;
					for "_i" from 1 to _cnt do {
						_grp = _allGroups select (_iteration - 1);
						_size = count units _grp;
						systemChat format ["%1 (size: %2 units)", _grp, _size];
						_iteration = _iteration + 1;
					};
					// hang on - why not forEach the above ?? Maybe bc I was removing single unit groups? Dunno, but in fresh light this looks too complex for what it is trying to do 
					VAHCO2_orderSelectBool = false;
					VAHCO2_groupSelectBool = true;
				};
				default { systemChat "switch error - order select" };
			};
		};
	};

	if (VAHCO2_groupSelectBool) then {
		if (_cntGroupSelect == 2) then {
			// here, you've chosen a group by entering two numbers 
			// e.g. entering 3 and 1 should look for a group with the designation 3:1 
			_groupX = str (VAHCO2_groupSelect select 0); // first data 
			_groupY = str (VAHCO2_groupSelect select 1); // second data 
			systemChat format ["DEBUG STR: %1 - %2", _groupX, _groupY];
			{
				// first convert group name to string so you can validate specific characters 
				_name = str _x;
				_nameX = _name select [8,1];
				_nameY = _name select [10,1];
				// systemChat format ["_nameX: %1 /// _nameY: %2", _nameX, _nameY];
	
				if ((_nameX == _groupX) && (_nameY == _groupY)) then {
					systemChat format ["Group Selected: %1-%2", _nameX, _nameY];
					_chosenGroup pushBack _x;
				};
			} forEach _allGroups;

			// here we switch the order type 
			_orderType = VAHCO2_orderSelect select 0;
			switch ( _orderType ) do {
				case 1: { 			
					systemChat "Now issue a 10-grid destination:";
					VAHCO2_groupSelectBool = false;
					VAHCO2_gridSelectBool = true;
				};
				case 2: {
					systemChat "Now issue a general move direction:";
					systemChat "1 - Move North";
					systemChat "2 - Move North East";
					systemChat "3 - Move East";
					systemChat "4 - Move South East";
					systemChat "5 - Move South";
					systemChat "6 - Move South West";
					systemChat "7 - Move West";
					systemChat "8 - Move North West";
					VAHCO2_groupSelectBool = false;
					VAHCO2_directionSelectBool = true;
				};
				case 3: { 
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
				case 4: { 
					systemChat "Now confirm group to merge with";
					VAHCO2_groupSelectBool = false;
					VAHCO2_mergeSelectBool = true;
				};
				default { systemChat "ERROR - switch order type" };
			};
		};
	};


	if (VAHCO2_gridSelectBool) then {
		if (_cntGridSelect == 10) then {
			// so here, you've entered an 10-grid  
			systemChat format ["Grid Entered: %1", VAHCO2_gridSelect];
			systemChat "Now confirm (1) or cancel (2)";
			VAHCO2_gridSelectBool = false;
			VAHCO2_confirmBool = true;
		};
	};


	if (VAHCO2_directionSelectBool) then {
		if (_cntDirSelect == 1) then {
			// so here, you've entered a direction  
			systemChat format ["Direction Code Entered: %1", VAHCO2_directionSelect];
			systemChat "Now confirm distance:";
			systemChat "1 - 100m";
			systemChat "2 - 200m";
			systemChat "3 - 300m";
			systemChat "4 - 400m";
			systemChat "5 - 500m";
			systemChat "6 - 600m";
			systemChat "7 - 700m";
			systemChat "8 - 800m";
			systemChat "9 - 900m";
			systemChat "0 - 1000m";
			// systemChat "Now confirm (1) or cancel (2)";
			VAHCO2_directionSelectBool = false;
			VAHCO2_distanceSelectBool = true;
			// VAHCO2_confirmBool = true;
		};
	};

	if (VAHCO2_distanceSelectBool) then {
		if (_cntDistSelect == 1) then {
			// so here, you've entered a distance  
			systemChat format ["Distance Code Entered: %1", VAHCO2_directionSelect];
			systemChat "Now confirm (1) or cancel (2)";
			VAHCO2_distanceSelectBool = false;
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


	if (VAHCO2_mergeSelectBool) then {
		if (_cntMergeSelect == 2) then {
			// here, you've chosen a group by entering two numbers 
			// e.g. entering 3 and 1 should look for a group with the designation 3:1 
			_groupX = str (VAHCO2_mergeSelect select 0); // first data 
			_groupY = str (VAHCO2_mergeSelect select 1); // second data 
			systemChat format ["Target Group: %1 - %2", _groupX, _groupY];
			{
				// first convert group name to string so you can validate specific characters 
				_name = str _x;
				_nameX = _name select [8,1];
				_nameY = _name select [10,1];
				// systemChat format ["_nameX: %1 /// _nameY: %2", _nameX, _nameY];
				if ((_nameX == _groupX) && (_nameY == _groupY)) then {
					systemChat format ["Target Group Selected: %1-%2", _nameX, _nameY];
					_mergeToGroup pushBack _x;
				};
			} forEach _allGroups;

			systemChat "Now confirm (1) or cancel (2)";
			VAHCO2_mergeSelectBool = false;
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
					// systemChat format ["NOTE - VAHCO2_gridSelect: %1", VAHCO2_gridSelect];
					_res = VAHCO2_confirm select 0;
					switch (_res) do {
						case 1: {
							systemChat "grid order confirmed"; 
							// _num = VAHCO2_groupSelect select 0;
							_group = _chosenGroup select 0;
							/*
							We need to know owner 
							*/
							_clientID = groupOwner _group;
							systemChat format ["OWNER: -------------- %1", _clientID];
							_movePos = [];
							_lat = [];
							_lon = [];
							_lat pushBack (VAHCO2_gridSelect select 0);
							_lat pushBack (VAHCO2_gridSelect select 1);
							_lat pushBack (VAHCO2_gridSelect select 2);
							_lat pushBack (VAHCO2_gridSelect select 3);
							_lat pushBack (VAHCO2_gridSelect select 4);
							_lon pushBack (VAHCO2_gridSelect select 5);
							_lon pushBack (VAHCO2_gridSelect select 6);
							_lon pushBack (VAHCO2_gridSelect select 7);
							_lon pushBack (VAHCO2_gridSelect select 8);
							_lon pushBack (VAHCO2_gridSelect select 9);
							_movePos pushBack _lat;
							_movePos pushBack _lon;

							if (_clientID == 0) then {
								// [_chosenGroup, _movePos] call RGGo_fnc_order_moveTo;
								[_chosenGroup, _movePos] remoteExec ["RGGo_fnc_order_moveTo", 0];
							} else {
								[_chosenGroup, _movePos] remoteExec ["RGGo_fnc_order_moveTo", 2];
							};
							
						};
						case 2: {
							systemchat "grid order cancelled"; 
						};
						default { systemChat "switch error - confirm order"; };
					};
					VAHCO2_confirmBool = false;
					[] call RGGv2_fnc_voice2_VAHCO_clearKeyDowns; 
				 };
				case 2: { // basic move order 
					// so here, you've confirmed or cancelled  
					// systemChat format ["NOTE - VAHCO2_formationSelect: %1", VAHCO2_formationSelect];
					_res = VAHCO2_confirm select 0;
					switch (_res) do {
						case 1: {
							systemChat "basic move order confirmed"; 
							_group = _chosenGroup select 0;
							_clientID = groupOwner _group;
							systemChat format ["OWNER: -------------- %1", _clientID];
							// get dir 
							_dir = 0;
							_dirEntry = VAHCO2_directionSelect select 0;
							switch (_dirEntry) do {
								case 1: { _dir = 0};
								case 2: { _dir = 45};
								case 3: { _dir = 90};
								case 4: { _dir = 135};
								case 5: { _dir = 180};
								case 6: { _dir = 225};
								case 7: { _dir = 270};
								case 8: { _dir = 315};
								default { systemChat "switch error - dir order"; };
							};
							// get dist 
							_distEntry = VAHCO2_distanceSelect select 0;
							_dist = _distEntry * 100;
							if (_distEntry == 0) then {
								_dist = 1000;
							};

							if (_clientID == 0) then {
								// [_chosenGroup, _dir, _dist] call RGGo_fnc_order_moveBasic; 
								[_chosenGroup, _dir, _dist] remoteExec ["RGGo_fnc_order_moveBasic", 0];
							} else {
								[_chosenGroup, _dir, _dist] remoteExec ["RGGo_fnc_order_moveBasic", 2];
							};

						};
						case 2: {
							systemchat "basic move order cancelled"; 
						};
						default { systemChat "switch error - confirm order"; };
					};
					VAHCO2_confirmBool = false;
					[] call RGGv2_fnc_voice2_VAHCO_clearKeyDowns; 
				};
				case 3: { // formation order 
					// so here, you've confirmed or cancelled  
					// systemChat format ["NOTE - VAHCO2_formationSelect: %1", VAHCO2_formationSelect];
					_res = VAHCO2_confirm select 0;
					switch (_res) do {
						case 1: {
							systemChat "formation order confirmed"; 
							// _num = VAHCO2_groupSelect select 0;
							_group = _chosenGroup select 0;
							_clientID = groupOwner _group;
							systemChat format ["OWNER: -------------- %1", _clientID];
							_formCode = VAHCO2_formationSelect select 0;

							if (_clientID == 0) then {
								// [_chosenGroup, _formCode] call RGGo_fnc_order_formation;
								[_chosenGroup, _formCode] remoteExec ["RGGo_fnc_order_formation", 0];
							} else {
								[_chosenGroup, _formCode] remoteExec ["RGGo_fnc_order_formation", 2];
							};

						};
						case 2: {
							systemchat "formation order cancelled"; 
						};
						default { systemChat "switch error - confirm order"; };
					};
					VAHCO2_confirmBool = false;
					[] call RGGv2_fnc_voice2_VAHCO_clearKeyDowns; 
				};
				case 4: { // merge order 
					// so here, you've confirmed or cancelled  
					_res = VAHCO2_confirm select 0;
					switch (_res) do {
						case 1: {
							systemChat "merge order confirmed"; 
							// _num = VAHCO2_groupSelect select 0;
							_group = _chosenGroup select 0;
							_clientID = groupOwner _group;
							systemChat format ["OWNER: -------------- %1", _clientID];
							_groupTo = _mergeToGroup select 0;

							if (_clientID == 0) then {
								// [_group, _groupTo] call RGGo_fnc_order_merge;
								[_group, _groupTo] remoteExec ["RGGo_fnc_order_merge", 0];
							} else {
								[_group, _groupTo] remoteExec ["RGGo_fnc_order_merge", 2];
							};
							
						};
						case 2: {
							systemchat "merge order cancelled"; 
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