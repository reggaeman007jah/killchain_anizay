// RGGc - Counting Classes

class RGGo {
	tag = "RGGo";
	class functions_Order {
		file = "functions_Order";

		class order_fallBack {
			Description = "This function will send units back to Tinman";
		};

		class order_fallBackRemain {
			Description = "This function will send units back to Tinman and repeat on a cycle";
		};

		class order_attack {
			Description = "This function will send all indifor towards the OBJ";
		};

		class order_civiliansToBoard {
			Description = "This function will order all civilians into nearest heli as cargo";
		};

		class order_getInCargo {
			Description = "This test function will try to move selected unit into selected heli";
		};

		class order_hold {
			Description = "This function will stop all indifor units in their tracks";
		};

		class order_hunt {
			Description = "This function will keep sending hunter to given target on a cycle";
		};

		class order_insuranceMoveIndifor {
			Description = "This function will push all indifor in Redzone towards their obj";
		};

		class order_insuranceMoveOpfor {
			Description = "This function will push all opfor in Redzone towards their obj";
		};

		class order_sitrep {
			Description = "This function will relay count of indifor in Redzone";
		};
	};
};

