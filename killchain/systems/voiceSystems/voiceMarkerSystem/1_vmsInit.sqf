/*
From: initPlayerLocal.sqf 
*/

// ----------------------
// 1_vmsInit.sqf 


// init for VMS 
systemChat " ... Voice Activated Marker System Activated ... ";

/*
Voice Activated Visual Marker System (VA-VMS) by Reggaeman 
v.01 May 2020

Notes:
This system will enable a player to use VA to create a temp global marker using voice commands
Essentially this will be a spotting tool for faction and types (e.g, opfor infi, blufor tanks, repair spots etc)
Will be based on marker category, marker type, distance and lookDir
e.g. opfor infantry 300m (+ look direction)
e.g. fire mission 1 klick (+ look direction)
e.g. set up a repair signal on my location 
Markers are temporary - they fde out and then get deleted
System feedback is to confirm this to all units (though remoteExec systChat for now)
If this is a mistake in marker placement, for now, tough, let it expire and tell your units about your mistake
consider breaking out the general markers into a totally different flow

consider:
decide on audio alerts to players (.ogg or within VA)
creating separate J-TAC system for more exact relay of fire strikes, direction, repair, pickup etc 

toDo:
check whether all EHs are needed (cancel?)
complete cancel operation 
enable a delete option while in map - for any player 
enable system to show other info like "attack here", "move there" or "this direction"
enable "infi moving" + direction arrow 
enable an "on my location" command for pickups 
add player name to marker intel or alerts somehow
add custom radio channel for colour in sysChat 

done:
enable multiple markers at once!

partly done (but needs more work if demand is there):
global alerts to MP players (see colour and custom radio chat)

current issues:

fixed issues:
general category is bugged (process trips before confirmation is made) and also does not show correct menu in systemChat
Removed the general selection - will be done separately to keep things focussed on rapid heli-observations

*/

/// tvSetCurSel
// declarations
RGG_VMS_Category		= [];		// holds category info (east, west, general etc) 
RGG_VMS_Type			= [];		// holds type info (1-infantry, 2-light armour, 3 - heavy armour)
RGG_VMS_Distance		= [];		// holds distance value fed from Voice Attack
RGG_VMS_LookDir			= [];		// holds look direction fed from player look direction
RGG_VMS_Confirm			= [];		// manages confirm action 
RGG_VMS_Cancel			= [];		// manages cancel action
RGG_VMS_NumInputBool 	= false; 	// manages general keydown state 
RGG_VMS_CategoryBool	= false; 	// manages category state 
RGG_VMS_TypeBool		= false; 	// manages type state 
RGG_VMS_DistanceBool	= false;	// manages distance state 
RGG_VMS_ConfirmBool		= false;	// manages confirm/cancel state

// trigger key = "4"
rgg_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 75)) then {
	vamp = true;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_Activate];
	systemChat 'VMS Activated - Please Confirm Category';
	systemChat '1 - Blufor';
	systemChat '2 - Indifor';
	systemChat '3 - Opfor';
	RGG_VMS_NumInputBool = true;
	RGG_VMS_CategoryBool = true; 
	execVM 'killchain\systems\voiceSystems\voiceMarkerSystem\keyDowns.sqf'; 
	execVM 'killchain\systems\voiceSystems\voiceMarkerSystem\keyDownMonitor.sqf'; 
}"];

// 	playSound 'dangerClose1';
// 	systemChat '4 - General Requests';