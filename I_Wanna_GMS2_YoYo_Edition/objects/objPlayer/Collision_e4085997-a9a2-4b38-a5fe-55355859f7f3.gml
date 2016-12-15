/// @description Check block collisions

// Check for horizontal collisions
if (!place_free(x+hspeed,y)) {
	if (hspeed <= 0) {
		move_contact_solid(180,abs(hspeed));
    } else {
		move_contact_solid(0,abs(hspeed));
	}
		
    hspeed = 0;
}

// Check for vertical collisions
if (!place_free(x,y+vspeed)) {
	if(vspeed <= 0) {
		move_contact_solid(90,abs(vspeed));
		
		if (global.grav == -1) {
			djump = 1;
		}
    } else {
		move_contact_solid(270,abs(vspeed));
		
		if (global.grav == 1) {
			djump = 1;
		}
	}
	
    vspeed = 0;
}

// Check for diagonal collisions
if (!place_free(x+hspeed,y+vspeed)) {
	hspeed = 0;
}