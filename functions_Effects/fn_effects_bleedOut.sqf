// --- bleedout --- // 

/*
this FNC will bleed out a unit's health over time intervals 

takes:
	unit - _unit
	frequency of iteration - _freq
	amount of health to remove - _amt

*/

params ["_unit","_freq","_amt"];
// private _heliPos = getPos _heli;
// private _civGroup = group _unit;

while {alive _unit} do {
	_health = damage _unit; 
	_newHealth = _health + _amt;
	_unit setDamage _newHealth;
	_reducedHealth = damage _unit; 
	systemChat format ["DEBUG / BLEEDOUT - Unit %1 health: %2", _unit, _reducedHealth];
	sleep _freq;
	
	if (!alive _unit) then {
		_mkr = str _unit;
		deleteMarker _mkr;
		systemChat format ["DEBUG / BLEEDOUT - Unit %1 has bled out", _unit];
	};
};
