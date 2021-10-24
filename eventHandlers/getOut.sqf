// triggers on engine off - set to ROOFY asset for now 

ROOFY addEventHandler ["Engine", {
	params ["_vehicle", "_engineState"];
	if (_engineState == false) then {
		systemChat "engine is off";
		_cargo = [];
		_list = fullCrew _vehicle;
		{
			_role = assignedVehicleRole (_x select 0);
			if ((_role select 0) == "cargo") then {
				_cargo pushBack (_x select 0);
			};
		} forEach _list;
		[_cargo, _vehicle] execVM "killchain\systems\EH_Links\getOutOnRoof.sqf";
	};
}];