/*
FNC to count number of units within xm of a position 

takes pos, dist to check and side 
*/

params ["_anchor", "_distance", "_side"];
_units = allUnits select {side _x == _side && _anchor distance2D _x < _distance};
count _units