// RGGh - Heli Classes

class RGGh {
	tag = "RGGh";
	class functions_heli {
		file = "functions_Heli";

		class heli_boardIndifor {
			Description = "This function will ensure correct number of units spawn and board the heli at base";
		};
		class heli_checkDeploy {
			Description = "This function will auto-disembark units when they land";
		};
	};
};

/*
call{if (CANBOARD) then { 
 [thisList] execVM "killchain\systems\boardingSystems\boardingIndifor.sqf"; 
};}