/// @description scrLoadGame(loadFile)
/// Loads the game
/// argument0 - sets whether or not to read the save file when loading the game

var loadFile = argument0;

// Only load save data from the save file if the script is currently set to (we should only need to read the save file on first load because the game stores them afterwards)
if (loadFile) {
    // Load the save map
    
    var f = file_text_open_read("Data\save"+string(global.saveNum));
        
    var saveMap = ds_map_create();
    ds_map_read(saveMap,base64_decode(file_text_read_string(f)));
        
    file_text_close(f);
    
    var saveValid = true; // Keeps track of whether or not the save being loaded is valid
    
    if (saveMap != -1) { // Check if the save map loaded correctly
        global.deaths = ds_map_find_value(saveMap,"deaths");
        global.time = ds_map_find_value(saveMap,"time");
        global.timeMicro = ds_map_find_value(saveMap,"timeMicro");
        
        global.difficulty = ds_map_find_value(saveMap,"difficulty");
        global.saveRoom = ds_map_find_value(saveMap,"saveRoom");
        global.savePlayerX = ds_map_find_value(saveMap,"savePlayerX");
        global.savePlayerY = ds_map_find_value(saveMap,"savePlayerY");
        global.saveGrav = ds_map_find_value(saveMap,"saveGrav");
        
        if (is_string(global.saveRoom)) { // Check if the saved room string loaded properly
            if (!room_exists(asset_get_index(global.saveRoom))) // Check if the room index in the save is valid
                saveValid = false;
        } else {
            saveValid = false;
        }
        
		//TODO: check if there's a better way of saving/loading arrays
        for (var i = 0; i < global.secretItemTotal; i++) {
            global.saveSecretItem[i] = ds_map_find_value(saveMap,"saveSecretItem["+string(i)+"]");
        }
        
        for (var i = 0; i < global.bossItemTotal; i++) {
            global.saveBossItem[i] = ds_map_find_value(saveMap,"saveBossItem["+string(i)+"]");
        }
        
        global.saveGameClear = ds_map_find_value(saveMap,"saveGameClear");
        
        // Load MD5 string from the save map
        var mapMd5 = ds_map_find_value(saveMap,"mapMd5");
        
        // Check if MD5 is not a string in case the save was messed with or got corrupted
        if (!is_string(mapMd5))
            mapMd5 = ""; // Make it a string for the MD5 comparison
        
        // Generate MD5 string to compare with
        ds_map_delete(saveMap,"mapMd5");
        var genMd5 = md5_string_unicode(ds_map_write(saveMap)+global.md5StrAdd);
        
		// Check if MD5 hash is invalid
        if (mapMd5 != genMd5)
            saveValid = false;
        
        // Destroy the map
        ds_map_destroy(saveMap);
    } else {
        // Save map didn't load correctly, set the save to invalid
        saveValid = false;
    }
    
    if (!saveValid) { // Check if the save is invalid
        // Save is invalid, restart the game
		
        show_message("Save invalid!");
		
		game_restart();
		//TODO: scrRestartGame?
        //scrRestartGame();
		
        exit;
    }
}

// Set game variables and the player's position

with (objPlayer) // Destroy the player if it exists
    instance_destroy();

global.gameStarted = true; // Sets game in progress (enables saving, restarting, etc.)
global.noPause = false; // Disable no pause mode
global.autosave = false; // Disable autosaving since we're loading the game

global.grav = global.saveGrav;

//TODO: check if there's a better way of copying these
for (var i = 0; i < global.secretItemTotal; i++) {
    global.secretItem[i] = global.saveSecretItem[i];
}

for (var i = 0; i < global.bossItemTotal; i++) {
    global.bossItem[i] = global.saveBossItem[i];
}

global.gameClear = global.saveGameClear;

instance_create_layer(global.savePlayerX,global.savePlayerY,"Player",objPlayer);

room_goto(asset_get_index(global.saveRoom));