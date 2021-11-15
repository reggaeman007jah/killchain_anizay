
// KILL WILDLIFE 
// enableEnvironment [false, true];

// ["My Awesome Mod","show_breathing_key", "Show Breathing", {_this call mymod_fnc_showGameHint}, "", [DIK_B, [true, true, false]]] call CBA_fnc_addKeybind;
// ["Operation Killchain","building_clear_key", "building_clear", {_this call RGGtac_fnc_tactical_markAsClear}, "", [DIK_O, [true, false, false]]] call CBA_fnc_addKeybind;

// DIK codes 
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

// building clear 
["Operation Killchain","building_clear_key", "building clear", {_this call RGGtac_fnc_tactical_markAsClear}, ""] call CBA_fnc_addKeybind;

// snoke systems 
["Operation Killchain","throwWhite", "throw white smoke", {_this call RGGtac_fnc_tactical_throwWhite}, ""] call CBA_fnc_addKeybind;
["Operation Killchain","throwRed", "throw red smoke", {_this call RGGtac_fnc_tactical_throwRed}, ""] call CBA_fnc_addKeybind;
["Operation Killchain","throwGreen", "throw green smoke", {_this call RGGtac_fnc_tactical_throwGreen}, ""] call CBA_fnc_addKeybind;
["Operation Killchain","throwBlue", "throw blue smoke", {_this call RGGtac_fnc_tactical_throwBlue}, ""] call CBA_fnc_addKeybind;

// aviation 
["Operation Killchain - Aviation","showFront", "show players in front", {_this call RGGtac_fnc_tactical_showOrder}, ""] call CBA_fnc_addKeybind;
