// --- process injured --- // 

/*
This will be triggered when civilians are dropped off at base 
It will wait for them to enter into area, will delete objects and convert to a score  
*/
systemChat "DEBUG / FNC DELETE - starting processing injured fnc";

sleep 30;

_toProcess = allUnits inAreaArray "processInjured";

{
	if ((side _x) == CIVILIAN) then {
		RGG_civviesSaved = RGG_civviesSaved + 1;
		publicVariable "RGG_civviesSaved";
		deleteVehicle _x;
	};
} forEach _toProcess;

systemChat format ["Civilians Rescued: %1", RGG_civviesSaved];