// --- ambient slowbys --- //

/*
Will generate slow moving aircraft over random players
*/

sleep 60;

while {true} do {

	_helis = [
		"LOP_AA_Mi8MTV3_UPK23",
		"LOP_AA_Mi24V_FAB",
		"rhsusf_CH53E_USMC_GAU21_D",
		"RHS_UH1Y_UNARMED",
		"RHS_AH1Z_wd"
	];
	_chosenHeli = selectRandom _helis;

	// init delcarations
	// params  
	params ["_from", "_to"];

	_direction = selectRandom [1,2,3,4];

	switch (_direction) do {
		case (1): { _from = 0, _to = 180 }; // north to south 
		case (2): { _from = 180, _to = 0 }; // south to north 
		case (3): { _from = 90, _to = 270 }; // east to west 
		case (4): { _from = 270, _to = 90 }; // west to east 
	}; 

	_candidates = [];
	{
		_candidates pushBack _x;
	} forEach allPlayers;
	_chosenOne = selectRandom _candidates;
	
	if ((count _candidates) > 0) then {
		_anchor = getPos _chosenOne;
		_startPos = _anchor getpos [2500,_from];
		_endPos = _anchor getPos [2500,_to];
		// systemChat format ["debug - running lowbys from %1 to %2", _from, _to];
		[_startPos, _endPos, 10, "FULL", _chosenHeli, west] call BIS_fnc_ambientFlyby;
	};

	// sleep 1800;
	sleep 300;

};  