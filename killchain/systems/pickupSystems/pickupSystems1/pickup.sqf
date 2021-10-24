// typeOf vehicle player == "B_Heli_Light_01_F (RGG_Heli5)" && (player distance thistrigger) < 500
/*
B_W_Soldier_A_F
B_W_Soldier_GL_F
B_W_HeavyGunner_F
B_W_soldier_M_F
*/

// systemChat "pickup systems running";

// _pos = [12828.3,16712.1,0];
// _transport1 = "B_Heli_Light_01_F" createVehicle _pos;
// _transport1 setVehicleVarName "transport1";
// transport1 = _transport1;
// // systemChat "unit test created";
// sleep 2;

// [13382,16911,-5.72205e-006] new pos 

// _offroad setVehicleVarName "MyFerrari";
// MyFerrari = _offroad;

// while {true} do {

//   // just an alt check
// 	_HELI1ATL1 = (getPosATL transport1) select 2;
// 	_HELI1ATL1 = round _HELI1ATL1;
// 	systemChat str _HELI1ATL1;

// 	sleep 1;
// };

 
// hanger spawn point where they are created 
// [15074,17244]

// pickup point where they wait for pickup 
/*
[15221,17085] groupBlu1
[15206,17074] groupBlu2
[15192,17060] groupBlu3
[15178,17045] groupBlu4
[15165,17031] groupBlu5
*/
// deploymentMissionIsActive = false;
// systemChat "testing in 10";

// sleep 60;

// initially, check to see if the mission is considered 'live' - i.e. if it is live, then do not spawn more units!
// I have a feeling this logic needs some more thought?!
// deploymentMissionIsActive = false;

// _indiGroup = createGroup independent;

// if (!deploymentMissionIsActive) then {
//   systemChat "squaddies ready for pickup";

//   for "_i" from 1 to 1 do { 
//     // "B_W_Soldier_A_F" createUnit [[15074,17244], _indiGroup]; 
//     "B_W_Soldier_A_F" createUnit [[15074,17244], _indiGroup]; 
//     sleep 0.1;
//   };
//   for "_i" from 1 to 1 do { 
//     "B_W_Soldier_GL_F" createUnit [[15074,17244], _indiGroup]; 
//     sleep 0.1;
//   };
//   for "_i" from 1 to 1 do { 
//     "B_W_HeavyGunner_F" createUnit [[15074,17244], _indiGroup]; 
//     sleep 0.1;
//   };
//   for "_i" from 1 to 1 do { 
//     "B_W_soldier_M_F" createUnit [[15074,17244], _indiGroup]; 
//     sleep 0.1;
//   };

//   _indiGroup move [15122,17197];
//   _indiGroup setFormation "STAG COLUMN";
// };

// think about how you can create and designate a group that is named after the UID of the player .. so that group always and only ever belongs to that player 

/*
Note - we need to control the spawning - maybe link number of fireteams available to number of patrol points taken
So, 1 PP = 3 FT, then +1 for every new base taken  

Known Issue - sometimes the alt check (and probably other stuff) is duplicated! Maybe when destroyed.
test comment
*/

// _myHeli = _this select 0;

HKSQUADGP = [];

deploymentMission = true;
initPhase = true;
pickup = false;
wait = false;
dropoff = false;
complete = false;
_myHeli = transport1a;
deleteMarker "extract"; // belt and braces
private _HELI1ATL1 = "_HELI1ATL1";

while {deploymentMission} do {

  // engine check
  if (isEngineOn transport1a) then {
    _HELI1ATL1 = (getPosATL _myHeli) select 2;
    _HELI1ATL1 = round _HELI1ATL1;
    systemChat str _HELI1ATL1;
  } else {
    // this should shut everything down if the engine is turned off
    deploymentMission = false;
    initPhase = false;
    pickup = false;
    wait = false;
    dropoff = false;
    complete = false;
    deleteMarker "extract"; // belt and braces
    execVM "killchain\systems\pickupSystems\pickupSystems1\pickupInit.sqf";
    systemChat "shutting down pickup system";
  };
  // alt check
  // _HELI1ATL1 = (getPosATL _myHeli) select 2;
  // _HELI1ATL1 = round _HELI1ATL1;
  // systemChat str _HELI1ATL1;
   
  if (initPhase) then {
    if (_HELI1ATL1 > 5) then {
      _freeCargoPositions = _myHeli emptyPositions "cargo";
      systemChat format ["cargo available: %1", _freeCargoPositions];
      initPhase = false;
      pickup = true;
    };
  };
 
  // PICKUP 
 	if (pickup) then {
    systemChat "Land so troops can board";
		if ((_HELI1ATL1) < 1) then {
			_extractLocation = position transport1a;
			_extractMarker = createMarker ["extract", _extractLocation];
			_extractMarker setMarkerShape "ELLIPSE";
			_extractMarker setMarkerColor "ColorGreen";
			_extractMarker setMarkerSize [50, 50];
  		_units = allUnits inAreaArray "extract";
			{
				_x assignAsCargo _myHeli;
        _squaddieGrp = group _x;
        _x setUnitPos "MIDDLE";
        // if !(group _squaddieGrp isEqualTo group player) then {
        //   HKSQUADGP pushBackUnique _squaddieGrp;
        // };
        HKSQUADGP pushBackUnique _squaddieGrp;
			} forEach _units;	
			_units orderGetIn true;
			pickup = false;
			wait = true;
		};
	};

  // WAIT / BOARD / TRANSIT
	if (wait) then {
    systemChat "Troops boarded";
		if ((_HELI1ATL1) > 3) then {
			wait = false;
			dropoff = true;
			deleteMarker "extract";
		};
	};

  // DISEMBARK
	if (dropoff) then {
    systemChat "Get the troops on the ground";
		if ((_HELI1ATL1) < 1) exitWith {
			_extractLocation = position transport1a;
			_extractMarker = createMarker ["extract", _extractLocation];
			_extractMarker setMarkerShape "ELLIPSE";
			_extractMarker setMarkerColor "ColorRed";
			_extractMarker setMarkerSize [20, 20];
      // order getOut 
      { unassignVehicle _x } forEach crew transport1a;
      _units = allUnits inAreaArray "extract";
      _units orderGetIn false;
      {
        _x setUnitPos "AUTO";
      } forEach _units;
      dropoff = false;
      complete = true;
      {
        _squaddieGrp = group _x;
        HKSQUADGP pushBackUnique _squaddieGrp;
      } forEach _units;
      systemChat format ["hk group: %1", HKSQUADGP];
		};
	};

  if (complete) then {
      _units = allUnits inAreaArray "extract";
      {
        _x setUnitPos "AUTO";
      } forEach _units;
    _pos = getMarkerPos "extract";
    _safeDelete = transport1a distance _pos;
		if ((_safeDelete) > 5) then {

      // 	_opforCount1 = 0;
      // 	_blueforCount1 = 0;
      // 	_units = allUnits inAreaArray "Objective 1";
      // 	_unitCount1 = count _units;
      // 	{
      // 		switch ((side _x)) do
      // 		{
      // 			case EAST: {_opforCount1 = _opforCount1 + 1};
      // 			case WEST: {_blueforCount1 = _blueforCount1 + 1};
      // 		};
      // 	} forEach _units;

      // 	sleep 60;
      // };
      // {(leader _x) sideChat "Go ! Go ! Go !"} forEach allGroups;
      // _groups = allGroups inAreaArray "extract";
      // systemChat format ["allGroups inAreaArray: %1", _groups];
      
      // count group members 
      // _hkSize = count group 
      // {
      //   _hkSize = count group _x;
      //   if (_hkSize == 1) then {
      //     _hkGrp = HKSQUADGP select 1;
      //   } else {
          
      //   };
      // } forEach HKSQUADGP;
      
      if (HUNTERKILLER) then {
        _arraySize = count HKSQUADGP; // probably 2 

        // this tries to delete any single-unit groups e.g. a player group 
        for "_i" from 1 to _arraySize do {
          _group = HKSQUADGP select (_i -1);
          _size = count units _group; 
          systemChat format ["Iteration / Group: %1, Size: %2", _group, _size];
          if (_size > 1) then {
            // HKSQUADGP deleteAt _i;
            [_group] execVM "killChain\systems\hunterKillerSystems\runHK.sqf";
            systemChat format ["sending this: %1", _group];
          };
        };   
      };

      // debug check what do we have left? should be only one result
      // systemChat format ["HK Group Array: %1", HKSQUADGP];


      // _hkGrp = HKSQUADGP select 0;
      // systemChat format ["sending this: %1", _hkGrp];
      // [_hkGrp] execVM "killChain\systems\hunterKillerSystems\runHK.sqf";
      sleep 1;
      deleteMarker "extract";
      complete = false;
      initPhase = true;
    };
  };
  
	sleep 2;
};


  //     // COUNT UNITS IN PZ1 - IF UNITS, THEN DO NOT SPAWN
  //     _units = allUnits inAreaArray "PZ1";
  //     _unitCount1 = count _units;

  //     if (_unitCount1 == 0) then {
  //         systemChat "squaddies spawning .............................................!";
  //         _float = diag_tickTime;
  //         // _float2 = random 10000;
  //         // _uniqueStamp = [_float, _float2];
  //         // _stampToString = str _uniqueStamp;
  //         _stampToString = str _float;
  //         _stampToString = createGroup west;
  //         for "_i" from 1 to 1 do { 
  //           // "B_W_Soldier_A_F" createUnit [[15074,17244], _indiGroup]; 
  //           "B_W_Soldier_A_F" createUnit [[15074,17244], _stampToString]; 
  //           sleep 0.1;
  //         };
  //         for "_i" from 1 to 1 do { 
  //           "B_W_Soldier_A_F" createUnit [[15074,17244], _stampToString]; 
  //           sleep 0.1;
  //         };
  //         for "_i" from 1 to 1 do { 
  //           "B_W_Soldier_A_F" createUnit [[15074,17244], _stampToString]; 
  //           sleep 0.1;
  //         };
  //         for "_i" from 1 to 1 do { 
  //           "B_W_Soldier_A_F" createUnit [[15074,17244], _stampToString]; 
  //           sleep 0.1;
  //         };
  //         _stampToString move [15129,17195];
  //         _stampToString setFormation "COLUMN";
  //         systemChat "squaddies ready .............................................!";
  //       };
