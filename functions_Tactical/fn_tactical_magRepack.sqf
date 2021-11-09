/*
https://forums.bohemia.net/forums/topic/226310-magazines-repack/
*/


MGI_fnc_repack = { 
  _idc = ctrlIDC (_this select 0); 
  _selectedIndex = _this select 1; 
  player setVariable ["MGImags", +((magazinesAmmoFull player) select {(lbdata [_idc,_selectedIndex]) in _x})]; 
  player setVariable ["MGIselect", true]; 
  false 
}; 
 
0 = [] spawn { 
  while {true} do { 
    waitUntil {uisleep 0.5; !(isnull (finddisplay 602)) && isnil {player getVariable "MGIselect"}}; 
    if !(isNull (findDisplay 602)) then { 
      ((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDblClick", "_this  call MGI_fnc_repack"]; 
      ((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", "_this  call MGI_fnc_repack"]; 
      ((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDblClick", "_this  call MGI_fnc_repack"]; 
    }; 
    waitUntil {uisleep 0.5; !isnil {player getVariable "MGIselect"} or isNull (findDisplay 602)}; 
    if (!isnil {player getVariable "MGIselect"}) then { 
      private ["_mag","_wpnType","_wpn"]; 
      if (player getVariable ["MGImags",[]] isEqualTo []) then { 
        _mag = ""; 
        _wpn = "" 
      } else { 
        _cnts = 0; 
        _mag = (player getVariable "MGImags") select 0 select 0; 
        _fullcnt = getnumber (configFile >> "cfgmagazines" >>_mag >> "count"); 
       if (_fullcnt > 0 && _mag in getArray (configFile >> "cfgWeapons" >> currentWeapon player >> "magazines") && currentWeapon player != "") then { 
          { 
            _wpnType = _x select 3; 
            switch (_wpnType) do { 
              case 1: {_wpn = primaryWeapon player}; 
              case 2: {_wpn = handGunWeapon player}; 
              case 4: {_wpn = secondaryWeapon player}; 
              default {_wpn =""}; 
            }; 
            _cnts = _cnts + (_x select 1); 
            player setammo [_wpn,0]; 
          } count (player getVariable ["MGImags",[]]); 
          _remainingShots = _cnts mod _fullcnt; 
          {player removeMagazineGlobal _mag} count  (player getVariable ["MGImags",[]]); 
          player addMagazines [_mag, floor (_cnts/_fullcnt)]; 
          if (_remainingShots >0) then { 
            player addMagazine [_mag,_remainingShots]; 
          }; 
          reload player; 
        }; 
      }; 
    }; 
    player setVariable ["MGIselect", nil]; 
  }; 
};