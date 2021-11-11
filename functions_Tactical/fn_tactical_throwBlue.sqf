
if ("SmokeShellBlue" in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {
	[player, "SmokeShellBlueMuzzle"] call BIS_fnc_fire;
} else {
	["NO BLUE SMOKE"] remoteExec ["RGGi_fnc_information_lowerRight", player];  
};


