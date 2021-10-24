_pos = _this select 0;

_ammoBoxVN = "CargoNet_01_box_F" createVehicle _pos;
sleep 1;
clearMagazineCargoGlobal _ammoBoxVN;
clearWeaponCargoGlobal _ammoBoxVN;
clearItemCargoGlobal _ammoBoxVN;

// weapons
_ammoBoxVN addWeaponCargo ["rhsusf_weap_glock17g4", 5]; // 

// supplies 
_ammoBoxVN addItemCargo ["FirstAidKit", 15]; // 

// scope 
_ammoBoxVN addItemCargo ["optic_ACO_grn", 4]; // 
_ammoBoxVN addItemCargoGlobal ["rhs_optic_maaws", 2]; 
_ammoBoxVN addItemCargoGlobal ["rhsusf_acc_premier_low", 1]; 

// mags 
// rhsusf_mag_17Rnd_9x19_JHP
// _ammoBoxVN addMagazineAmmoCargo ["rhs_mag_20Rnd_762x51_m80_fnfal", 30, 20]; // 
// _ammoBoxVN addMagazineAmmoCargo ["rhs_rpg7_PG7VL_mag", 30, 1]; // ok
_ammoBoxVN addMagazineAmmoCargo ["rhs_mag_30Rnd_556x45_Mk262_Stanag", 30, 30];
_ammoBoxVN addMagazineAmmoCargo ["rhsgref_50Rnd_792x57_SmE_drum", 30, 50];
// _ammoBoxVN addMagazineAmmoCargo ["rhs_30Rnd_762x39mm", 30, 30];
_ammoBoxVN addMagazineAmmoCargo ["rhsusf_100Rnd_556x45_soft_pouch", 30, 100];

// frags 
// _ammoBoxVN addItemCargo ["vn_m34_grenade_mag", 2]; //    
// _ammoBoxVN addItemCargo ["vn_m61_grenade_mag", 2]; //    
// _ammoBoxVN addItemCargo ["vn_m67_grenade_mag", 2]; //  

// smokes 
_ammoBoxVN addItemCargo ["SmokeShellBlue", 2]; //    
_ammoBoxVN addItemCargo ["SmokeShellGreen", 2]; //    
_ammoBoxVN addItemCargo ["SmokeShellOrange", 2]; //    
_ammoBoxVN addItemCargo ["SmokeShellPurple", 2]; //    
_ammoBoxVN addItemCargo ["SmokeShellRed", 2]; //    
_ammoBoxVN addItemCargo ["SmokeShell", 2]; //    
_ammoBoxVN addItemCargo ["SmokeShellYellow", 2]; //   

// range finder 
_ammoBoxVN addItemCargo ["rhsusf_bino_lerca_1200_black", 2]; //    
















/*

comment "Exported from Arsenal by Reggs";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local this) exitWith {};

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

comment "Add weapons";
this addWeapon "rhs_weap_m16a4_carryhandle";
this addPrimaryWeaponItem "rhsusf_acc_premier_low";
this addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag";

comment "Add containers";
this forceAddUniform "LOP_U_AA_Fatigue_02_slv";
this addVest "LOP_V_CarrierLite_OLV";

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {this addItemToUniform "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
this addItemToVest "rhs_mag_rdg2_white";
this addItemToVest "rhs_mag_rgd5";
this addHeadgear "PO_H_PASGT_M81_1";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";

comment "Set identity";
[this,"PersianHead_A3_03","male01per"] call BIS_fnc_setIdentity;

comment "Exported from Arsenal by Reggs";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local this) exitWith {};

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

comment "Add weapons";
this addWeapon "rhs_weap_m16a4_carryhandle";
this addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";
this addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag";

comment "Add containers";
this forceAddUniform "LOP_U_AA_Fatigue_02_slv";
this addVest "LOP_V_CarrierLite_OLV";

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {this addItemToUniform "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
this addItemToVest "rhs_mag_rdg2_white";
this addItemToVest "rhs_mag_rgd5";
this addHeadgear "PO_H_PASGT_M81_1";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";

comment "Set identity";
[this,"PersianHead_A3_01","male02per"] call BIS_fnc_setIdentity;











this addItemToVest "rhs_mag_rdg2_white";
this addItemToVest "rhs_mag_rdg2_black";
for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_rgd5";};
for "_i" from 1 to 2 do {this addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};




