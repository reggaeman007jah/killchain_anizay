// RGGc - Effects Classes

class RGGd {
	tag = "RGGd";
	class functions_Delete {
		file = "functions_Delete";

		class delete_AllWithinArea {
			Description = "This function will delete all within an area";
		};

		class delete_campItems {
			Description = "This function will delete camp items when no players are nearby";
		};

		class delete_extractLeftBehind {
			Description = "This function will delete civvie objects and markers after 25 minutes of creation";
		};

		class delete_marker {
			Description = "This function will delete given marker after given time - used when marker created was Called via unscheduled env";
		};

		class delete_quickVics {
			Description = "This function will delete vics when no players are nearby";
		};

		class delete_processInjured {
			Description = "This function will delete rescued civilian objects and convert to points";
		};

	};
};

