/// @description Check for menu button press

if (scrButtonCheckPressed(global.menuAcceptButton)) {
	// Start game
	
	if (file_exists("Data\\save"+string(global.saveNum))) {
		scrLoadGame(true);
	//	file_delete("Data\\save"+string(global.saveNum));
		exit;
	}
	
	global.gameStarted = true; //sets game in progress (enables saving, restarting, etc.)
	global.autosave = true;
                        
	global.difficulty = 0;
                        
	room_goto(rSample01);
	
//TODO: change to this behavior
//    room_goto(rMenu);
}