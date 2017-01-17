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
    
	// Check if the player needs to be moved along with the platform
    with (instance_place(x,y-(2*global.grav),objPlayer)) {
        y += other.vspeed + other.yspeed;
        if (place_free(x+other.hspeed,y)) {
			x += other.hspeed;
		}
    }
	
	y += yspeed;
    
    if (vspeed < 0) {
        yspeed = vspeed;
        vspeed = 0;
    }
    if (yspeed > 0) {
        vspeed = yspeed;
        yspeed = 0;
    }
}