/*
fnc to stop players from camping in one spot 

should this be run from initPlayerLocal?
then locally check, but if yes, global effect?

needs a global bool to ensure only one of these happens at any one time 
*/

while { TRUE } do {

	_1stPos = getPos player;
	sleep 300;
	_2ndPos = getPos player;
	_dist = _1stPos distance _2ndPos;

	if (_dist < 30) then {
		// player is deemed to be camping 


		// ambi arty .. first smoke 
		// 200m from target, work out 5 spots, to see it gettig closer 
		// get good first pos, between player and obj - drop from high 
		// then explode,

		
	};


};