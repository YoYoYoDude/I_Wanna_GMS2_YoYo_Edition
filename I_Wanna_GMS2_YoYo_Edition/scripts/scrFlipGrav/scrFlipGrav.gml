/// @description scrFlipGrav()
/// Flips the current gravity

// Set gravity to go the opposite direction
global.grav = -global.grav;

// Flip the player and set his variables accordingly
with (objPlayer) {
	vspeed = 0;
	djump = 1;
	
	jump = abs(jump) * global.grav;
	jump2 = abs(jump2) * global.grav;
	gravity = abs(gravity) * global.grav;
	
	if (global.grav == 1)
		mask_index = sprPlayerMask;
	else
		mask_index = sprPlayerMaskFlip;
	
	y += 4 * global.grav;
}