// --- this will alter existing markers --- //
// signify change from attack to defend - consider changing marker type (image) here

_objPos = _this select 0; // objective point 

deleteMarker "attackPoint";
_tempMarker = createMarker ["attackPoint", _objPos];
_tempMarker setMarkerType "hd_objective";
_tempMarker setMarkerColor "ColorGreen";