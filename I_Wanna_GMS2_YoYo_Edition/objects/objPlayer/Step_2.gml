/// @description Check if player left the room and update player sprite (if set to)

if ((x < 0 || x > room_width || y < 0 || y > room_height) && global.edgeDeath) {
    scrKillPlayer();
}

// Update player sprite
if (PLAYER_ANIMATION_FIX) {
	// Block/vine checks
	var notOnBlock = (place_free(x,y+(global.grav)));
	var onVineR = (place_meeting(x+1,y,objWalljumpR) && notOnBlock);
	var onVineL = (place_meeting(x-1,y,objWalljumpL) && notOnBlock);
	
	if (!onVineR && !onVineL) {
		if (!onPlatform) {
		    if (notOnBlock) {
				if ((vspeed * global.grav) < 0) {
					sprite_index = sprPlayerJump;
			    } else {
					sprite_index = sprPlayerFall;
				}
			} else {
				sprite_index = sprPlayerIdle;
			}
		} else {
			sprite_index = sprPlayerIdle;
		}
	} else {
		sprite_index = sprPlayerSlide;
	}
	
	if (sprite_index == sprPlayerIdle && !frozen) {
		// Check for left/right button presses
		var L = (scrButtonCheck(global.leftButton) || (DIRECTIONAL_TAP_FIX && scrButtonCheckPressed(global.leftButton)));
		var R = (scrButtonCheck(global.rightButton) || (DIRECTIONAL_TAP_FIX && scrButtonCheckPressed(global.rightButton)));
		
		if (L || R) {
			sprite_index = sprPlayerRun;
		}
	}
}