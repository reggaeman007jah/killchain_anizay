// RGGr - Role Classes - role-specific stuff to happen to players based on their chosen profession 

class RGGr {
	tag = "RGGr";
	class functions_Roles {
		file = "functions_Roles";

		// class recruiting_manageSpawnAmount {
		// 	Description = "This function will manage whether / how many indifor can be spawned";
		// };

		class roles_2IC {
			Description = "welcome msg for 2IC";
		};	

		class roles_AT {
			Description = "welcome message for AT";
		};

		class roles_checkRoles {
			Description = "This function will check which roles are in-play and create role-specific tasks for them";
		};

		class roles_engineer {
			Description = "welcome text for engineer role";
		};

		class roles_engineerTasks {
			Description = "generate tasks for engineer if one is in mission";
		};

		class roles_frequencies {
			Description = "This function will display radio frequencies to players on start";
		};

		class roles_GPMG {
			Description = "welcome message for GPMG player";
		};

		class roles_grenadier {
			Description = "welcome message for grenadier player";
		};

		class roles_huntAT {
			Description = "AT-specific hunting script";
		};

		class roles_LMG {
			Description = "welcome msg for LMG player";
		};

		class roles_medic {
			Description = "welcome msg for medic";
		};

		class roles_platoonLead {
			Description = "welcome msg for PL";
		};

		class roles_raptor1 {
			Description = "welcome msg for raptor 1";
		};	

		class roles_raptor2 {
			Description = "welcome msg for raptor 2";
		};	

		class roles_sniper {
			Description = "welcome msg for sniper";
		};	

		class roles_teamLead {
			Description = "welcome msg for TL";
		};	

		class roles_welcomeText {
			Description = "This function will provide tailored messages to players based on their class";
		};

		// class patrol_mainCycle {
		// 	Description = "This function will run the main patrol cycle";
		// };

		// class patrol_markerChange {
		// 	Description = "This function will alter existing markers";
		// };

		// class patrol_markers {
		// 	Description = "This function will create patrol markers";
		// };
	};
};

/*
Note, this was recruitment, nowe changed to roles 