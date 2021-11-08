/*
I am doing this as a FNC as the markers I need to delete are created in a non-scheduled environment, so in order to delete after x seconds 
I need to manage outside of the FNC being called - so this here is spawned 
*/

_wait = _this select 0;
_marker = _this select 1;

sleep _wait;
deleteMarker _marker;