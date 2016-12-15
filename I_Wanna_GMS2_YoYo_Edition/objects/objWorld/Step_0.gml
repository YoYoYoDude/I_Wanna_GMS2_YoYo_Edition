/// @description Game checks

//TODO: smoothing mode
// Set linear interpolation depending on what the current smoothing setting is
//texture_set_interpolation(global.smoothingMode);

//TODO: controller checks
/*
//controller checks
if (CONTROLLER_ENABLED && global.controllerIndex != -1)
{
    if (!global.controllerMode)  //check if we should to controller mode
    {
        if (keyboard_check_pressed(vk_anykey))
        {
            global.controllerDelay = -1;
        }
        else if (scrAnyControllerButton() != -1)
        {
            if (global.controllerDelay == -1)
                global.controllerDelay = CONTROLLER_DELAY_LENGTH;
        }
    }
    else    //check if we should switch to keyboard mode
    {
        if (keyboard_check_pressed(vk_anykey))
        {
            if (global.controllerDelay == -1)
                global.controllerDelay = CONTROLLER_DELAY_LENGTH;
        }
        else if (scrAnyControllerButton() != -1)
        {
            global.controllerDelay = -1;
        }
    }
    
    if (global.controllerDelay != -1)   //check delay for switching between keyboard/controller
    {
        if (global.controllerDelay == 0)    //delay over, toggle controller mode
        {
            global.controllerMode = !global.controllerMode;
            global.controllerDelay = -1;
        }
        else
        {
            global.controllerDelay -= 1;
        }
    }
}
*/

if (global.gameStarted) {
    // Handle pausing
    if (global.pauseDelay <= 0) { // Check if pause delay is active
        if (scrButtonCheckPressed(global.pauseButton)) {
            if (!global.gamePaused) { // Game is currently not paused, pause the game
                if (!global.noPause) {
                    global.gamePaused = true; // Set the game to paused
                    global.pauseDelay = PAUSE_DELAY_LENGTH; // Set pause delay
                    
                    instance_deactivate_all(true); // Deactivate everything
                    
					//TODO: figure out new wport/hport stuff
					
					// Copy the current screen to a new sprite
					global.pauseSpr = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),false,false,0,0);
					show_debug_message(string(global.pauseSpr));
					
					show_debug_message(string(surface_get_width(application_surface)));
					
					//TODO: maybe create a new sprite instead of surface?
					/*
                    global.pauseSurf = surface_create(view_wport[0], view_hport[0]); // Create new surface
                    if (surface_exists(global.pauseSurf))
						surface_copy(global.pauseSurf,0,0,application_surface); // Copy the current screen to it
					
					surface_save(application_surface,"test1.png");
					surface_save(global.pauseSurf,"test2.png");
					*/
					
					// Disable automatically drawing the application surface since the pause screen will be over it
					application_surface_draw_enable(false);
                }
            } else { // Game is currently paused, unpause the game
                global.gamePaused = false; // Set the game to unpaused
                global.pauseDelay = PAUSE_DELAY_LENGTH; // Set pause delay
                
                instance_activate_all(); // Reactivate everything
                
				// Delete pause screen sprite
				sprite_delete(global.pauseSpr);
				show_debug_message(string(global.pauseSpr));
				
				//TODO: remove this
				/*
                if (surface_exists(global.pauseSurf))
                    surface_free(global.pauseSurf); // Free the pause surface
				*/
				
				// Enable automatically drawing the application surface
				application_surface_draw_enable(true);
                
                scrSaveConfig(); // Save the config in case the volume levels were changed
                
                io_clear(); // Clear input states to prevent possible pause strats/exploits
            }
        }
    }
    else
    {
        global.pauseDelay -= 1;
    }
    
    if (!global.gamePaused) { // Check if the game is currently paused
        // Check for restart button
		if (scrButtonCheckPressed(global.restartButton)) {
            // Stop death sound/music
            audio_stop_sound(global.deathSound);
            audio_stop_sound(global.gameOverMusic);
            
            // Resume room music
            audio_resume_sound(global.currentMusic);
            
            // Return to old gain if music is being faded out
            if (global.musicFading) {
                global.musicFading = false;
                audio_sound_gain(global.currentMusic,global.currentGain,0);
                alarm[0] = -1; // Reset alarm that pauses music
            }
            
            scrSaveGame(false); // Save death/time
            scrLoadGame(false); // Load the game
        }
        
		// Increment timer
        if (TIME_WHEN_DEAD || instance_exists(objPlayer)) {
            global.timeMicro += delta_time;
            global.time += global.timeMicro div 1000000;
            global.timeMicro = global.timeMicro mod 1000000;
        }
    } else {
        // Game is paused, check for volume controls
		if (scrButtonCheck(global.upButton)) {
            if (global.volumeLevel < 100)
                global.volumeLevel += 1;
        } else if (scrButtonCheck(global.downButton)) {
            if (global.volumeLevel > 0)
                global.volumeLevel -= 1;
        }
		
		// Set master gain
        audio_master_gain(global.volumeLevel/100);
    }
    
	//TODO: room caption
    //scrSetRoomCaption();    //keep caption updated
}

// Check debug keys
if (global.debugMode && global.gameStarted && !global.gamePaused) {
    // Drag player with mouse
	if (keyboard_check(vk_tab)) {
        with (objPlayer) {
            x = mouse_x;
            y = mouse_y;
        }
    }
	
	// Toggle debug overlay
    if (keyboard_check_pressed(vk_backspace)) {
        global.debugOverlay = !global.debugOverlay;
    }
	
	// Save game
    if (keyboard_check_pressed(vk_insert)) {
        with (objPlayer) {
            scrSaveGame(true);
            audio_play_sound(sndItem,0,false);
        }
    }
	
	// Toggle showing the player's hitbox
    if (keyboard_check_pressed(vk_delete)) {
        global.showHitbox = !global.showHitbox;
    }
	
	// Toggle god mode
    if (keyboard_check_pressed(vk_home)) {
        global.godMode = !global.godMode;
    }
	
	// Toggle infinite jump
    if (keyboard_check_pressed(vk_end)) {
        global.infJump = !global.infJump;
    }
	
	// Go to next room
    if (keyboard_check_pressed(vk_pageup) && room != room_last) {
        with (objPlayer)
            instance_destroy();
    
        room_goto_next();
    }
	
	// Go to previous room
    if (keyboard_check_pressed(vk_pagedown) && room != room_first) {
        with (objPlayer)
            instance_destroy();
    
        room_goto_previous();
    }
}

// Check to show debug visuals on the player
if (global.debugVisuals) {
    with (objPlayer) {
        if (global.godMode) // Make the player slightly transparent when god mode is on
            image_alpha = 0.7;
        else
            image_alpha = 1;
        
        if (global.infJump) // Make the player turn blue when infinite jump is on
            image_blend = c_blue;
        else
            image_blend = c_white;
    }
}

// Check function keys

// End game
if (keyboard_check_pressed(vk_escape)) {
    game_end();
}

// Restart game
if (keyboard_check_pressed(vk_f2)) {
    game_restart();
    exit;
}

// Toggle fullscreen mode
if (keyboard_check_pressed(vk_f4)) { //TODO:  && !global.gamePaused
    global.fullscreenMode = !global.fullscreenMode;
    
    window_set_fullscreen(global.fullscreenMode);
    
    scrSaveConfig(); // Save fullscreen setting
}

//TODO: reset window size
/*
// Reset window size
if (keyboard_check_pressed(vk_f5) && !global.gamePaused) {
    scrResetWindowSize();
}
*/

//TODO: toggle music
/*
// Toggle music
if (keyboard_check(vk_control) && keyboard_check_pressed(ord("M")) && !global.gamePaused) {
    scrToggleMusic();
    
    scrSaveConfig(); // Save mute setting
}
*/