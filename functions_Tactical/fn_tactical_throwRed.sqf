
if ("SmokeShellRed" in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {
	[player, "SmokeShellRedMuzzle"] call BIS_fnc_fire;
} else {
	["NO RED SMOKE"] remoteExec ["RGGi_fnc_information_lowerRight", player];  
};


