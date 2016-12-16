/// @description Initiailze menu variables

//TODO: add comments to these variables (probably should rename some)

xSeperation = 239; // Sets how much to separate the save files in the menu

// Stores the image index of the menu sprites
appleIndex = 0;
playerIndex = 0;

fileSelect = 0; // Keeps track of what file we're currently on
difSelectMode = false; // Keeps track of whether we're currently selecting a difficulty
difSelect = 0; // Keeps track of what difficulty we're currently on

str[0] = "Save 1";
str[1] = "Save 2";
str[2] = "Save 3";

warnText = false; // Keeps track of whether the file overwrite warning text is showing
warnSelect = true; // Keeps track of whether to accept overwriting the save file

// Load save file values

for (var i = 0; i < 3; i++) {
    if (file_exists("Data\\save"+string(i+1))) { // Check if the current save exists
        // Save exists, load save data
        exists[i] = true;
        
        // Load the save map
        var saveMap;
		
        var f = file_text_open_read("Data\\save"+string(i+1));
            
        saveMap = ds_map_create();
        ds_map_read(saveMap,base64_decode(file_text_read_string(f)));
            
        file_text_close(f);
        
        if (saveMap != -1) { // Check if the save map loaded correctly
            deaths[i] = ds_map_find_value(saveMap,"deaths");
			// Check for undefined values in case the save was messed with or got corrupted
            if (is_undefined(deaths[i])) {
                deaths[i] = 0;
			}
            
            time[i] = ds_map_find_value(saveMap,"time");
            if (is_undefined(time[i])) {
                time[i] = 0;
			}
    
            difficulty[i] = ds_map_find_value(saveMap,"difficulty");
            if (is_undefined(difficulty[i])) {
                difficulty[i] = 0;
			}
			
			boss[i] = ds_map_find_value(saveMap,"saveBossItem");
			if (is_undefined(boss[i])) {
				boss[i] = array_create(BOSS_ITEM_TOTAL,false);
			}
            
            clear[i] = ds_map_find_value(saveMap,"saveGameClear");
            if (is_undefined(clear[i])) {
                clear[i] = false;
			}
            
            ds_map_destroy(saveMap);
			
			show_debug_message(boss[i]);
        } else {
            // Save map didn't load correctly, set variables to the defaults
            deaths[i] = 0;
            time[i] = 0;
            difficulty[i] = 0;
            boss[i] = array_create(BOSS_ITEM_TOTAL,false);
            clear[i] = false;
        }
    } else {
        exists[i] = false;
        deaths[i] = 0;
        time[i] = 0;
    }
    
	// Convert the time into a string
    var t = time[i];
    
    timeStr[i] = string(t div 3600) + ":";
    t = t mod 3600;
    timeStr[i] += string(t div 600);
    t = t mod 600;
    timeStr[i] += string(t div 60) + ":";
    t = t mod 60;
    timeStr[i] += string(t div 10);
    t = t mod 10;
    timeStr[i] += string(floor(t));
}

show_debug_message(boss);