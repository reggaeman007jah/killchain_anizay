/*
Tinman Advanced
This function moves a given group based on given direction and distance 
*/

params ["_grp", "_dir", "_dist"];
_group = _grp select 0;

_anchor = getPos leader _group;
_dest = _anchor getPos [_dist, _dir];
_group move _dest;
systemchat format ["Group %1 moving %2m at heading %3", _group, _dist, _dir];