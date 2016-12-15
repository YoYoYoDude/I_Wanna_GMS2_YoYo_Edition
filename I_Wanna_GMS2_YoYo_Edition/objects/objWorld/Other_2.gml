/// @description Initialize everything

// Initialize all variables
scrInitializeGlobals();

// Load the current config file (sets default config if it doesn't exist)
scrLoadConfig();

if (global.noFileSelectMode) { // No file select mode is on, immediately start a new file
	// Start a new game using file 0
	global.saveNum = 0;
	
	if (file_exists("Data\\save"+string(global.saveNum)))
		file_delete("Data\\save"+string(global.saveNum));
	
	global.gameStarted = true; // Sets game in progress (enables saving, restarting, etc.)
	global.autosave = true;
                        
	global.difficulty = 0;
                        
	room_goto(global.startRoom);
} else { // No file select mode is off, go to the main menu
	room_goto_next();
}