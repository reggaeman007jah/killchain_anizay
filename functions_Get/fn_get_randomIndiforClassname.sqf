// this function when called will returna random classname for opfor forces 

_data = [
	"LOP_PESH_IND_Infantry_SL",
	"LOP_PESH_IND_Infantry_TL",
	"LOP_PESH_IND_Infantry_Corpsman",
	"LOP_PESH_IND_Infantry_Marksman",
	"LOP_PESH_IND_Infantry_Rifleman",
	"LOP_PESH_IND_Infantry_Rifleman_3",
	"LOP_PESH_IND_Infantry_GL",
	"LOP_PESH_IND_Infantry_MG",
	"LOP_PESH_IND_Infantry_TL",
	"LOP_PESH_IND_Infantry_AT",
	"LOP_PESH_IND_Infantry_AT",
	"LOP_PESH_IND_Infantry_Rifleman_2",
	"LOP_PESH_IND_Infantry_Rifleman",
	"LOP_PESH_IND_Infantry_Rifleman_3",
	"LOP_PESH_IND_Infantry_TL",
	"LOP_PESH_IND_Infantry_Corpsman",
	"LOP_PESH_IND_Infantry_GL",
	"LOP_PESH_IND_Infantry_MG",
	"LOP_PESH_IND_Infantry_Rifleman_2",
	"LOP_PESH_IND_Infantry_SL",
	"LOP_PESH_IND_Infantry_TL",
	"LOP_PESH_IND_Infantry_Corpsman",
	"LOP_PESH_IND_Infantry_Marksman",
	"LOP_PESH_IND_Infantry_Rifleman",
	"LOP_PESH_IND_Infantry_Rifleman_3",
	"LOP_PESH_IND_Infantry_GL",
	"LOP_PESH_IND_Infantry_MG"
];

// yes some doubles above, can sort that later 

_return = selectRandom _data;

_return;


/*

rhs_mag_20Rnd_762x51_m80_fnfal
scope - addPrimaryWeaponItem "rhsgref_acc_l1a1_l2a2";
"rhs_mag_30Rnd_556x45_Mk262_Stanag"
addBackpack "LOP_B_KB_Med_rgr";
for "_i" from 1 to 5 do {this addItemToBackpack "rhsgref_50Rnd_792x57_SmE_drum";};
ak - "rhs_30Rnd_762x39mm"
249 - "rhsusf_100Rnd_556x45_soft_pouch"
"rhs_weap_rpg7"
"rhs_rpg7_PG7VL_mag"
"FirstAidKit"



