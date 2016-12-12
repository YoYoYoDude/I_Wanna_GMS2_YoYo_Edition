/// @description Check if near the player

//TODO: check if you can pixel perfect hop off this, from either the bottom or top, also maybe code it better

if (vspeed == 0 && instance_exists(objPlayer)) {
    if (place_meeting(x,y-objPlayer.vspeed-(global.grav),objPlayer)) {
        vspeed = 2; // Touching the player, start falling
	}
}