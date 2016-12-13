/// @description Platform collision

//TODO: look into recoding this to not need yspeed
//TODO: also add some comments son

if (global.grav == 1) {
    if (y-vspeed/2 <= other.y) {
        if (other.vspeed >= 0) {
            y = other.y-9;
            vspeed = other.vspeed;
        }
        
        onPlatform = true;
        djump = 1;
    }
} else {
    if (y-vspeed/2 >= other.y+other.sprite_height-1) {
        if (other.yspeed <= 0) {
            y = other.y+other.sprite_height+8;
            vspeed = other.yspeed;
        }
        
        onPlatform = true;
        djump = 1;
    }
}