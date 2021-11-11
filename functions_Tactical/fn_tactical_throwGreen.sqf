
if ("SmokeShellGreen" in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {
	[player, "SmokeShellGreenMuzzle"] call BIS_fnc_fire;
} else {
	["NO GREEN SMOKE"] remoteExec ["RGGi_fnc_information_lowerRight", player];  
};


