/// @description Check if near player and move

if (vspeed == 0 && instance_exists(objPlayer)) {
    if (place_meeting(x,y-objPlayer.vspeed-(global.grav),objPlayer)) {
        vspeed = 2; // Touching the player, start falling
	}
}

event_inherited(); // Movement checks