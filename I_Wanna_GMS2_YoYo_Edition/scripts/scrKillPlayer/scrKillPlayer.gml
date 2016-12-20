/// @description scrKillPlayer()
/// Kills the player

if (instance_exists(objPlayer) && (!global.noDeath && !global.debugNoDeath)) {
    if (global.gameStarted) {
        // Normal death
		
		global.deathSound = audio_play_sound(sndDeath,0,false);
        
		// Play death music
        if (!global.muteMusic) {
            if (global.deathMusicMode == 1) { // Instantly pause the current music
                audio_pause_sound(global.currentMusic);
                
                global.gameOverMusic = audio_play_sound(musOnDeath,1,false);
            } else if (global.deathMusicMode == 2) { // Fade out the current music
                with (objWorld) {
                    event_user(0); // Fade out and stop the current music
				}
                
                global.gameOverMusic = audio_play_sound(musOnDeath,1,false);
            }
        }
        
        with (objPlayer) {
            instance_create_layer(x,y,layer,objBloodEmitter);
            instance_destroy();
        }
        
        instance_create_layer(0,0,"World",objGameOver);
        
        global.deaths++; // Increment death counter
            
        scrSaveGame(false); // Save deaths/time
    } else {
        // Death in the difficulty select room, restart the room
		
		with (objPlayer) {
            instance_destroy();
		}
            
        room_restart();
    }
}