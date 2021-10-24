// --- spawn loot crate of goodies --- // 

/*

Land_Cargo20_military_green_F

comment "Add weapons";
this addWeapon "rhs_weap_m16a4_carryhandle";
this addPrimaryWeaponItem "rhsusf_acc_nt4_black"; ok 
this addPrimaryWeaponItem "rhs_acc_1p87"; ok 
this addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag"; ok 
this addPrimaryWeaponItem "bipod_01_F_blk"; ok 

comment "Add containers";
this forceAddUniform "LOP_U_AA_Fatigue_02";
this addVest "LOP_V_CarrierLite_OLV";
this addBackpack "rhs_tortila_grey"; ok 

comment "Add binoculars";
this addWeapon "rhsusf_bino_lerca_1200_black";

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {this addItemToUniform "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
this addItemToVest "rhs_mag_rdg2_white";
this addItemToVest "rhs_mag_rgd5";
this addHeadgear "rhsusf_opscore_paint_pelt_nsw_cam";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem "NVGoggles_OPFOR";

create one of these each patrol phase 
load it with nice things 

thoughts:
	does this have to be during an active mission?
	this could be a pre-mission activity maybe 
	I need to randomise the marker location so it is not that easy to find, but not too hard either 

*/

_anchor = _this select 0; // should be obj pos  

_dir = random 359;
_dist = random 500;
_dist = _dist + 250;

_pos = _anchor getPos [_dist, _dir]; // actual pos of box 
// systemChat format ["DEBUG / LOOT CRATE - running loot crate, chosen pos is: %1", _pos];

_ammoBoxVN = "B_CargoNet_01_ammo_F" createVehicle _pos;

// create marker 
_mDir = random 359;
_mDist = random 300;
_mPos = _pos getPos [_mDist, _mDir];
_base = createMarker ["loot", _mPos];
// _base setMarkerShape "ELLIPSE";
_base setMarkerColor "ColorBlue";
_base setMarkerSize [1.3, 1.3];
_base setMarkerType "loc_rearm";
_base setMarkerAlpha 0.5;

// clear content 
clearMagazineCargoGlobal _ammoBoxVN;
clearWeaponCargoGlobal _ammoBoxVN;
clearItemCargoGlobal _ammoBoxVN;

// supplies 
_ammoBoxVN addItemCargoGlobal ["FirstAidKit", 15]; // 
_ammoBoxVN addItemCargoGlobal ["Medikit", 2]; // 

// scopes
_ammoBoxVN addItemCargoGlobal ["rhsgref_acc_l1a1_l2a2", 2]; //  
_ammoBoxVN addItemCargoGlobal ["rhs_acc_1p87", 2]; // 

// bipod 
_ammoBoxVN addItemCargoGlobal ["bipod_01_F_blk", 5]; // 

// silencer 
_ammoBoxVN addItemCargoGlobal ["rhsusf_acc_nt4_black", 5]; // 

// mags 
_ammoBoxVN addMagazineAmmoCargo ["rhs_mag_20Rnd_762x51_m80_fnfal", 30, 20]; // ok
_ammoBoxVN addMagazineAmmoCargo ["rhs_rpg7_PG7VL_mag", 30, 1]; // ok
_ammoBoxVN addMagazineAmmoCargo ["rhs_mag_30Rnd_556x45_Mk262_Stanag", 30, 30];
_ammoBoxVN addMagazineAmmoCargo ["rhsgref_50Rnd_792x57_SmE_drum", 30, 50];
_ammoBoxVN addMagazineAmmoCargo ["rhs_30Rnd_762x39mm", 30, 30];
_ammoBoxVN addMagazineAmmoCargo ["rhsusf_100Rnd_556x45_soft_pouch", 30, 100];

// packs 
_ammoBoxVN addBackpackCargoGlobal  ["rhs_tortila_grey", 10];

// binos 
_ammoBoxVN addItemCargoGlobal ["rhsusf_bino_lerca_1200_black", 2]; // 

// NV 
_ammoBoxVN addItemCargoGlobal ["NVGoggles_OPFOR", 4]; // 

// torch 
_ammoBoxVN addMagazineAmmoCargo ["rhsusf_100Rnd_556x45_soft_pouch", 30, 100];

// lids  
_ammoBoxVN addItemCargoGlobal ["rhsusf_opscore_paint_pelt_nsw_cam", 10]; // scope ok  

/*
note: I can't get the trigger to run, so am trying to execVM from here, to see if that works 
*/


// smoke on prox 
[_pos] execVM "killchain\systems\FNC_Links\smokeOnProx.sqf";
// systemChat format ["DEBUG / LOOT CRATE - calling smoke on prox, passing: %1", _pos];
// [_pos] spawn RGGe_effects_smokeOnProx;
// _trg = createTrigger ["proxDetect", _pos];
// _trg setTriggerArea [400, 400, 0, false, 400];
// _trg setTriggerActivation ["ANYPLAYER", "PRESENT", false];
// _trg setTriggerStatements [
// 	"this", 
// 	"systemChat 'DEBUG / PROX DETECT - created trigger activator'; _smoke = createVehicle ['G_40mm_smokeYELLOW', _pos, [], 0, 'none'];", 
// 	"systemChat 'no player near'"
// ];


// // bullets and mags 
// _ammoBoxVN addMagazineAmmoCargo ["vn_m16_20_mag", 60, 18];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m60_100_mag", 15, 100];
// _ammoBoxVN addMagazineAmmoCargo ["vn_rpd_100_mag", 15, 100];
// _ammoBoxVN addMagazineAmmoCargo ["vn_mk22_mag", 5, 14];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m14_mag", 20, 20];
// _ammoBoxVN addMagazineAmmoCargo ["vn_carbine_30_mag", 20, 30];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m3a1_mag", 20, 30];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m38_mag", 10, 5];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m1911_mag", 20, 7];
// _ammoBoxVN addMagazineAmmoCargo ["vn_22mm_m19_wp_mag", 5, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_22mm_m1a2_frag_mag", 5, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_22mm_m22_smoke_mag", 5, 1];

// // 40mm 
// _ammoBoxVN addMagazineAmmoCargo ["vn_40mm_m406_he_mag", 30, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_40mm_m680_smoke_w_mag", 6, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_40mm_m682_smoke_r_mag", 6, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_40mm_m715_smoke_g_mag", 6, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_40mm_m716_smoke_y_mag", 6, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_40mm_m717_smoke_p_mag", 6, 1];

// // buck
// _ammoBoxVN addMagazineAmmoCargo ["vn_m1897_buck_mag", 20, 6];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m1897_fl_mag", 5, 6];

// // To Be Classified
// _ammoBoxVN addMagazineAmmoCargo ["vn_welrod_mag", 5, 8];
// _ammoBoxVN addMagazineAmmoCargo ["vn_hd_mag", 10, 10];
// _ammoBoxVN addMagazineAmmoCargo ["vn_hp_mag", 10, 13];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m129_mag", 5, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m128_mag", 5, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m127_mag", 5, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m40a1_mag", 5,5];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m10_mag", 6, 6];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m14_grenade_mag", 5, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m34_grenade_mag", 12, 1];

// // bangs
// _ammoBoxVN addMagazineAmmoCargo ["vn_mine_m18_mag", 6];
// _ammoBoxVN addMagazineAmmoCargo ["vn_mine_satchel_remote_02_mag", 2, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_mine_tripwire_m16_04_mag", 6, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m61_grenade_mag", 20, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m72_mag", 10, 1];

// // colours
// _ammoBoxVN addMagazineAmmoCargo ["vn_m18_green_mag", 4, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m18_purple_mag", 4, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m18_red_mag", 4, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m18_yellow_mag", 4, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_m18_white_mag", 10, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_v40_grenade_mag", 6, 3];
// _ammoBoxVN addMagazineAmmoCargo ["vn_40mm_m583_flare_w_mag", 3, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_40mm_m661_flare_g_mag", 3, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_40mm_m695_flare_y_mag", 3, 1];
// _ammoBoxVN addMagazineAmmoCargo ["vn_40mm_m662_flare_r_mag", 3, 1];

