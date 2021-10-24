// --- medivacEngineOff --- // 

/*
This is called by the EH, and from here spawns the operation 

takes:
	heli name   

notes:
	runs a check on all civvie units every x seconds while running, and assigns them to a medivac heli when healed 

*/

// _heli = _this select 0;
// _pos = getPos _heli;

params ["_heli"]; //-- same as _heli = _this select 0, but shorter and variables are defined as private to scope
private _pos = getPos _heli;

_objective1 = createMarker ["_medivac", _pos];
_objective1 setMarkerShape "ELLIPSE";
_objective1 setMarkerColor "ColorBlue";
_objective1 setMarkerAlpha 0.5;
_objective1 setMarkerSize [200, 200];

// initial get of all units in area ---------------------- start 
// _units = allUnits inAreaArray "_medivac";
// _civs = []; // base array to hold all civs 
// {
// 	if ((side _x) == CIVILIAN) then {
// 		_civs pushBack _x;
// 	};
// } forEach _units;

// -- improved code from cheese 
_civs = allUnits select {
    side _x == CIVILIAN &&
    {
        isNull objectParent _x && 
        {
            _x distance2D _pos <= 200 && 
            {
                canMove _x
            }
        }
    }
}; 
// initial get of all units in area ---------------------- end 

systemChat format ["DEBUG / CIV_GET_IN - _civs: %1", _civs];
_cntCivs = count _civs;


sleep 2; // ---------------------------------------------

// now run loop to monitor who is healed and who needs to board etc 

_cargoSpace = 1; // used to control getInCargoIndex .. 
// this goes up every time an order is given to ensure spaces dont get mixed up 

_extractInjured = true;
while { _extractInjured } do {
	{
		_damage = damage _x; // get damage of unit 
		// we get damage of unit to assess whether they are fit to fly - too injured, no ticket, no exceptions!
		if (_damage < 0.5) then {
			// unit is stabilised and fit to fly 
			_x setBehaviour "CARELESS";
			_x setUnitPos "up";
			// _spd = selectRandom [1,1.2,1.4];
			_spd = selectRandom [2,3];
			_x forceSpeed _spd;  
			// _x enableAI "move";
			// action - ensure that heli near? and only board if yes... but for now we just assume yes is near  
			// [_x, MEDIVAC, _cargoSpace] spawn RGGo_fnc_order_getInCargo; // old fnc, testing execVM system now 
			[_x, MEDIVAC, _cargoSpace] execVM "killchain\systems\orderSystems\getInCargo.sqf";
			systemChat format ["DEBUG / CIV_GET_IN - killchain\systems\orderSystems\getInCargo.sqf %1 %2 %3", _x, MEDIVAC, _cargoSpace];
			_cargoSpace = _cargoSpace +1;
			sleep 2;
			_civs deleteAt _forEachIndex;
		} else {
			// systemChat format ["DEBUG / CIV_GET_IN - %1 is too sick to fly, as damage was %2", _x, _damage];
			// only use for debugging ^^
		};
		sleep 1; 
	} forEach _civs;

	// this checks whether any players are near, and closes the loop if not  
	{
		_playerPos = getPos _x;
		_dist = _playerPos distance _pos; // this should be reflection of initial pos reading when landed 
		if (_dist > 750) then {
			_extractInjured = false;
			// here we should abandon mission completely 
			// delete units and markers and let the overall cycle catch the next mission loop 
		};
		// systemChat format ["DEBUG / CIV_GET_IN - No players near, loop status: %1", _extractInjured];
	} forEach allPlayers;

	// this also looks to close the loop, and will do so when there are no more units in the _civs array 
	_cntCivs = count _civs;
	if (_cntCivs == 0) then {
		systemChat format ["DEBUG / CIV_GET_IN - Civs: %1, closing loop", _civs];
		_extractInjured = false;
	};

	sleep 2; // might be too frequent, but is low now for testing reasons 
};
















// systemChat format ["allunits: %1", _units];



// _cnt = count _injured;
// systemChat format ["DEBUG / CIV_GET_IN - Number of injured civilians in blue zone: %1", _cnt];

// {
// 	_x doMove _pos;
// } forEach _units;

// // clear all first 
// { 
// 	unassignVehicle _x; 
// } forEach crew MEDIVAC;

// // _units = allUnits inAreaArray "extract";
// (crew MEDIVAC) orderGetIn false;

// {
// 	_damage = damage _x;
// 	if (_damage < 0.5) then {
// 		_x enableAI "move";
// 		_x assignAsCargo MEDIVAC;
// 		systemChat format ["%1 assigned as cargo as damage was %2", _x, _damage];
// 		_injured orderGetIn true;
// 		systemChat format ["%1 ordered to get in", _injured];
// 		_cargo = assignedVehicleRole _x;
// 		systemChat format ["%1 assigned to cargo %2", _injured, _cargo];
// 	} else {
// 		systemChat format ["%1 is too sick to fly, as damage was %2", _x, _damage];
// 	};
// 	sleep 1;
// } forEach _injured;	







// // this below was what was previously triggered from the off EH 

// 			// this manages what happens when you turn off while away from base 
// 			systemChat "running in-field extraction of civilians / civGetIn.sqf";
// 			[MEDIVAC] execVM "killchain\systems\boardingSystems\civilianGetIn.sqf";