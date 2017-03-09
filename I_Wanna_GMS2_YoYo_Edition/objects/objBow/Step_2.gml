/// @description Snap to the player

if (instance_exists(objPlayer)) {
    x = objPlayer.x;
    y = objPlayer.y;
    image_xscale = objPlayer.xScale;
    
	// Check if gravity is normal or flipped
    if (global.grav == 1) {
        image_yscale = 1;
    } else {
        image_yscale = -1;
        y += 1; // Need to draw the sprite a pixel off when flipped
    }
	
	depth = objPlayer.depth - 1;
} else {
    instance_destroy();
}