/// @description Platform collision

if (global.grav == 1) { // Check if on top of the platform (when right-side up)
    if (y-vspeed/2 <= other.y) {
        if (other.vspeed >= 0) {
            y = other.y-9; // Snap to the platform
            vspeed = other.vspeed;
        }
        
        onPlatform = true;
        djump = 1;
    }
} else { // Check if on top of the platform (when flipped)
    if (y-vspeed/2 >= other.y+other.sprite_height-1) {
        if (other.yspeed <= 0) {
            y = other.y+other.sprite_height+8; // Snap to the platform
            vspeed = other.yspeed;
        }
        
        onPlatform = true;
        djump = 1;
    }
}