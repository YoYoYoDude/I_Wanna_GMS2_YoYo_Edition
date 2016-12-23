/// @description Movement checks

if (speed != 0 || yspeed != 0) { // Make sure the platform is moving before doing collision checks
    // Check if the platform should bounce against any walls
	if (bounce) {
        if (!place_free(x+hspeed,y)) {
			hspeed = -hspeed;
		}
        
        if (!place_free(x,y+vspeed+yspeed)) {
            if (vspeed != 0) {
                yspeed = -vspeed;
                vspeed = 0;
            } else {
                vspeed = -yspeed;
                yspeed = 0;
            }
        }
    }
    
    y += yspeed;
    
	// Check if the player needs to be moved along with the platform
	if (place_meeting(x,y-(3*global.grav),objPlayer))
		audio_play_sound(sndGlass,0,false);
	//TODO
    with (instance_place(x,y-(2*global.grav),objPlayer)) {
		audio_play_sound(sndShoot,0,false);
		show_debug_message(global.timeMicro);
		show_debug_message("yes");
        y += other.vspeed + other.yspeed;
		show_debug_message(other.vspeed + other.yspeed);
        if (place_free(x+other.hspeed,y)) {
			show_debug_message("yes2");
			x += other.hspeed;
			show_debug_message(other.hspeed);
		}
    }
    
    if (vspeed < 0) {
        yspeed = vspeed;
        vspeed = 0;
    }
    if (yspeed > 0) {
        vspeed = yspeed;
        yspeed = 0;
    }
}