// --- process injured --- // 

/*
This will be triggered when civilians are dropped off at base 
It will wait for them to enter into area, will delete objects and convert to a score  
*/
systemChat "DEBUG / FNC DELETE - starting processing injured fnc";

sleep 20;

_toProcess = allUnits inAreaArray "pathfinderbase";
{
	if ((side _x) == CIVILIAN) then {
		_x doMove [8336.46,7121.02,0.0807266];
	};
} forEach _toProcess;

sleep 10;

_toProcess = allUnits inAreaArray "pathfinderbase";

{
	if ((side _x) == CIVILIAN) then {
		RGG_civviesSaved = RGG_civviesSaved + 1;
		publicVariable "RGG_civviesSaved";
		RGG_availableIndifor = RGG_availableIndifor + 4;
		publicVariable "RGG_availableIndifor";
		deleteVehicle _x;
	};
} forEach _toProcess;

systemChat format ["Total Civilians Rescued: %1", RGG_civviesSaved];
sleep 2;
systemChat format ["Available Peshmerga Troops: %1", RGG_availableIndifor];
// RGG_availableIndifor - show this to all players on rescue 