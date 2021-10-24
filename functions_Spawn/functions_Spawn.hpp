// RGGb - Counting Classes

class RGGs {
	tag = "RGGs";
	class functions_Spawn {
		file = "functions_Spawn";

		class spawn_baseSpawnContainer {
			Description = "This function will create the correct container (or truck) to generate the next base";
		};

		class spawn_baseSpawnContainerLevel2 {
			Description = "This function will create the correct container (or truck) to generate the next base - all level 1 basses must be built and be healthy first";
		};

		class spawn_bluforBaseMinCrew {
			Description = "This function will create minimum base crew of 8 units";
		};

		class spawn_birdDog {
			Description = "This function will spawn light aircraft for scouting and flares";
		};

		class spawn_bluforSentries {
			Description = "This function will create wall and tower AI sentries";
		};

		class spawn_opforCamp {
			Description = "This function will generate small enemy camp";
		};

		class spawn_bluforSentryRespawnQueue {
			Description = "This function will temporarily house any sentry data due to a base being unable to respawn a unit";
		};

		class spawn_blufortechnicals {
			Description = "This function will create and send in blufor humvee";
		};

		class spawn_fuelTruck {
			Description = "This function will create fuel truck on a road nearby and cycle if truck is destroyed";
		};

		class spawn_lootCrate {
			Description = "This function will create a cargo crate with random goodies";
		};

		class spawn_opforDefenders {
			Description = "This function will spawn opfor base defenders";
		};

		class spawn_opforHK {
			Description = "This function will manage HK attacks on players";
		};

		class spawn_opforNightOps {
			Description = "This function will manage whether night attacks happen";
		};

		class spawn_opforRandomThreats {
			Description = "This function will create random roaming opfor patrols";
		};

		class spawn_opforStatics {
			Description = "This function will create opfor static defences";
		};

		class spawn_opforTechnicals {
			Description = "This function will generate opfor technicals and send in to pos of random player";
		};

		class spawn_opforWelcomeParty {
			Description = "This function will send an opfor welcome party towards the patrol";
		};

		class spawn_populateOpforBuildings {
			Description = "This function will spawn opfor in random buildings near player";
		};

		class spawn_vc {
			Description = "This function will spawn VC and sent into Tinman pos";
		};
	};
};