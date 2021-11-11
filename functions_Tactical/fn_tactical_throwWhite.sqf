/*
Aim is to be able to use voice to issue a smoke or frag command, without needing to cycle through grag options, which takes too muich time in the heat of battle 

Idea:
keybinds will be set up that do specific things, like arm and throw red smnoke, arm and throw green smoke etc 
there would be an on-screen messsage if you try something that you don;t have "you don't have green smoke mate" etc 

each specific keybind will call a specific function, that has a specific job: 
Check if requested thing is in stock 
arm thing 
throw thing - this action can be done using the standard throw key it is the automated checking stock and arming that is done by the function 

things to know:
Can I cycle through uniform vest and pack for a specific thing, and return true or false if owned? 
Can I swap the armed grenade for the thing I have found above?

"rhs_weapon_svdp_wd" in ((vestItems player) + (uniformItems player) + (backpackItems player))

also consider a visual show smoke command, with graphics and numbers to indicat evisually to the user what smokes they have 

sample loadout extract:

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
this addWeapon "arifle_MX_F";
this addPrimaryWeaponItem "acc_pointer_IR";
this addPrimaryWeaponItem "optic_Aco";
this addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
this addWeapon "hgun_P07_F";
this addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
this forceAddUniform "U_B_CombatUniform_mcam";
this addVest "V_PlateCarrier1_rgr";
this addBackpack "B_AssaultPack_mcamo_Ammo";

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {this addItemToUniform "30Rnd_65x39_caseless_mag";};
this addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {this addItemToUniform "SmokeShellBlue";};
for "_i" from 1 to 9 do {this addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {this addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {this addItemToVest "HandGrenade";};
this addItemToVest "SmokeShell";
this addItemToVest "SmokeShellGreen";
this addItemToVest "Chemlight_green";
for "_i" from 1 to 4 do {this addItemToBackpack "FirstAidKit";};
for "_i" from 1 to 6 do {this addItemToBackpack "30Rnd_65x39_caseless_mag";};
this addItemToBackpack "100Rnd_65x39_caseless_mag";
this addItemToBackpack "NLAW_F";
for "_i" from 1 to 2 do {this addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {this addItemToBackpack "MiniGrenade";};
for "_i" from 1 to 3 do {this addItemToBackpack "1Rnd_HE_Grenade_shell";};
this addItemToBackpack "3Rnd_HE_Grenade_shell";
for "_i" from 1 to 2 do {this addItemToBackpack "10Rnd_338_Mag";};
for "_i" from 1 to 2 do {this addItemToBackpack "20Rnd_762x51_Mag";};
this addHeadgear "H_HelmetB_grass";
this addGoggles "G_Tactical_Clear";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem "NVGoggles";

comment "Set identity";
[this,"Sturrock","male08eng"] call BIS_fnc_setIdentity;


key items of interest here are:
SmokeShellGreen
SmokeShellBlue
SmokeShell



*/

if ("SmokeShell" in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {
	[player, "SmokeShellMuzzle"] call BIS_fnc_fire;
} else {
	["NO WHITE SMOKE"] remoteExec ["RGGi_fnc_information_lowerRight", player];  
};


