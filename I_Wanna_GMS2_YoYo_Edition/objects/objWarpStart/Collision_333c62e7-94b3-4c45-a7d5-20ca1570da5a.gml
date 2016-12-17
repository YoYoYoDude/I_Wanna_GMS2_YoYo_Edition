/// @description Start new/load game

if (dif == 4) { // Load the game
    if (file_exists("Data\\save"+string(global.saveNum))) {
        scrLoadGame(true);
    } else {
        scrKillPlayer();
	}
} else { // Start a new game
	if (file_exists("Data\\save"+string(global.saveNum))) {
        file_delete("Data\\save"+string(global.saveNum));
	}
	
    global.gameStarted = true; // Sets game in progress (enables saving, restarting, etc.)
    global.autosave = true;
    
    global.difficulty = dif;
    
    with (objPlayer) {
        instance_destroy();
	}

    room_goto(global.startRoom);
}