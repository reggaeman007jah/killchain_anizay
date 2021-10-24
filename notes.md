add this to all created civilians:
this addMPEventHandler ["MPKilled", {
params ["_unit", "_killer", "_instigator", "_useEffects"];
}];
