_pos = _this select 0;
_ammoBoxVN = "CargoNet_01_box_F" createVehicle _pos;
sleep 1;
clearMagazineCargoGlobal _ammoBoxVN;
clearWeaponCargoGlobal _ammoBoxVN;
clearItemCargoGlobal _ammoBoxVN;

// RPG / launchers 
_ammoBoxVN addWeaponCargoGlobal ["rhs_weap_rpg7", 5]; 
_ammoBoxVN addWeaponCargoGlobal ["rhs_weap_maaws", 2]; 
_ammoBoxVN addWeaponCargoGlobal ["rhs_weap_M136", 2]; 

// launcher ammo 
_ammoBoxVN addItemCargoGlobal ["rhs_mag_maaws_HEAT", 10]; 
_ammoBoxVN addItemCargoGlobal ["rhs_m136_mag", 10]; 
_ammoBoxVN addItemCargoGlobal ["rhs_mag_M441_HE", 10]; 
_ammoBoxVN addItemCargoGlobal ["1Rnd_Smoke_Grenade_shell", 10]; 
_ammoBoxVN addItemCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 10]; 
_ammoBoxVN addItemCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell", 10]; 
_ammoBoxVN addItemCargoGlobal ["1Rnd_SmokeYellow_Grenade_shell", 10]; 
_ammoBoxVN addItemCargoGlobal ["1Rnd_SmokePurple_Grenade_shell", 10]; 
_ammoBoxVN addItemCargoGlobal ["1Rnd_SmokeBlue_Grenade_shell", 10]; 
_ammoBoxVN addItemCargoGlobal ["1Rnd_SmokeOrange_Grenade_shell", 10]; 
_ammoBoxVN addItemCargoGlobal ["UGL_FlareCIR_F", 10]; 
_ammoBoxVN addItemCargoGlobal ["UGL_FlareYellow_F", 10]; 
_ammoBoxVN addItemCargoGlobal ["UGL_FlareRed_F", 10]; 
_ammoBoxVN addItemCargoGlobal ["UGL_FlareGreen_F", 10]; 
_ammoBoxVN addItemCargoGlobal ["UGL_FlareWhite_F", 10]; 

// M16 
_ammoBoxVN addWeaponCargoGlobal ["rhs_weap_m16a4_carryhandle", 5]; 

// sniper 
_ammoBoxVN addWeaponCargoGlobal ["rhs_weap_svds", 1]; 

// supplies 
_ammoBoxVN addItemCargoGlobal ["FirstAidKit", 30]; 
_ammoBoxVN addItemCargoGlobal ["Medikit", 1]; 

// torches 
_ammoBoxVN addItemCargoGlobal ["rhs_acc_2dpZenit_ris", 20];

// mags 
_ammoBoxVN addMagazineAmmoCargo ["rhs_rpg7_PG7VL_mag", 30, 1]; 
_ammoBoxVN addMagazineAmmoCargo ["rhs_mag_30Rnd_556x45_Mk262_Stanag", 60, 30];
_ammoBoxVN addMagazineAmmoCargo ["rhsgref_50Rnd_792x57_SmE_drum", 30, 50];
_ammoBoxVN addMagazineAmmoCargo ["rhs_30Rnd_762x39mm", 30, 30];
_ammoBoxVN addMagazineAmmoCargo ["rhsusf_100Rnd_556x45_soft_pouch", 30, 100];
_ammoBoxVN addMagazineAmmoCargo ["rhs_10Rnd_762x54mmR_7N1", 30, 10];
_ammoBoxVN addMagazineAmmoCargo ["rhs_100Rnd_762x54mmR", 30, 100];

// packs 
_ammoBoxVN addBackpackCargoGlobal  ["LOP_B_KB_Med_rgr", 9];
_ammoBoxVN addBackpackCargoGlobal  ["TFAR_rt1523g_black", 9];

// hats 
_ammoBoxVN addItemCargoGlobal ["H_Beret_CSAT_01_F", 4]; 
_ammoBoxVN addItemCargoGlobal ["H_Beret_gen_F", 4]; 
_ammoBoxVN addItemCargoGlobal ["H_Beret_EAF_01_F", 4]; 
_ammoBoxVN addItemCargoGlobal ["rhs_beret_mvd", 4]; 

// binos
// _ammoBoxVN addWeaponCargoGlobal ["Binocular", 2]; 


































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


// // ------------


// comment "Exported from Arsenal by Reggs";

// comment "[!] UNIT MUST BE LOCAL [!]";
// if (!local this) exitWith {};

// comment "Remove existing items";
// removeAllWeapons this;
// removeAllItems this;
// removeAllAssignedItems this;
// removeUniform this;
// removeVest this;
// removeBackpack this;
// removeHeadgear this;
// removeGoggles this;

// comment "Add weapons";
// this addWeapon "rhs_weap_m16a4_carryhandle";
// this addPrimaryWeaponItem "rhsusf_acc_nt4_black";
// this addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
// this addPrimaryWeaponItem "rhs_acc_1p87";
// this addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag";
// this addPrimaryWeaponItem "bipod_01_F_blk";

// comment "Add containers";
// this forceAddUniform "LOP_U_AA_Fatigue_02";
// this addVest "LOP_V_CarrierLite_OLV";
// this addBackpack "rhs_tortila_grey";

// comment "Add binoculars";
// this addWeapon "rhsusf_bino_lerca_1200_black";

// comment "Add items to containers";
// this addItemToUniform "FirstAidKit";
// for "_i" from 1 to 2 do {this addItemToUniform "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
// for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
// this addItemToVest "rhs_mag_rdg2_white";
// this addItemToVest "rhs_mag_rgd5";
// this addHeadgear "rhsusf_opscore_paint_pelt_nsw_cam";

// comment "Add items";
// this linkItem "ItemMap";
// this linkItem "ItemCompass";
// this linkItem "ItemWatch";
// this linkItem "ItemRadio";
// this linkItem "NVGoggles_OPFOR";


// // ---


// comment "Exported from Arsenal by Reggs";

// comment "[!] UNIT MUST BE LOCAL [!]";
// if (!local this) exitWith {};

// comment "Remove existing items";
// removeAllWeapons this;
// removeAllItems this;
// removeAllAssignedItems this;
// removeUniform this;
// removeVest this;
// removeBackpack this;
// removeHeadgear this;
// removeGoggles this;

// comment "Add weapons";
// this addWeapon "rhs_weap_m16a4_carryhandle";
// this addPrimaryWeaponItem "rhsusf_acc_nt4_black";
// this addPrimaryWeaponItem "rhs_acc_2dpZenit_ris";
// this addPrimaryWeaponItem "rhs_acc_1p87";
// this addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag";
// this addPrimaryWeaponItem "bipod_01_F_blk";

// comment "Add containers";
// this forceAddUniform "LOP_U_AA_Fatigue_02";
// this addVest "LOP_V_CarrierLite_OLV";
// this addBackpack "rhs_tortila_grey";

// comment "Add binoculars";
// this addWeapon "rhsusf_bino_lerca_1200_black";

// comment "Add items to containers";
// this addItemToUniform "FirstAidKit";
// for "_i" from 1 to 2 do {this addItemToUniform "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
// for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
// this addItemToVest "rhs_mag_rdg2_white";
// this addItemToVest "rhs_mag_rgd5";
// this addHeadgear "rhsusf_opscore_paint_pelt_nsw_cam";

// comment "Add items";
// this linkItem "ItemMap";
// this linkItem "ItemCompass";
// this linkItem "ItemWatch";
// this linkItem "ItemRadio";
// this linkItem "NVGoggles_OPFOR";
