/* 
this script will be triggered when players land in a specific PZ at base 
it will:
- generate (nearby) reinforcement (RF) assets, and have them board the heli 
- it will generate only the number needed, no more, no less 

this script is triggered by an in-mission trigger, with this as the outcome of the trigger:

	call{if (CANBOARD) then { 
	[thisList] execVM "killchain\systems\boardingSystems\boardingIndifor.sqf"; 
	};}

CANBOARD is a global variable to inform whether the boarding / spawning action can take place 
it is useful in managing multiple pilots wishing to pick up AI 

*/

_passed = _this select 0; // thisList 

_pilot = _passed select 0; 
_heli = vehicle _pilot;

_freeCargoPositions = _heli emptyPositions "cargo";

[_freeCargoPositions, _heli] execVM "killchain\systems\boardingSystems\boardUnits.sqf"; 
CANBOARD = false;

