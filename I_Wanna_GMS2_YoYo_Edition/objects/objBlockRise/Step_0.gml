/// @description Check if near the player

if (instance_exists(objPlayer)) {
    if (place_meeting(x,y-objPlayer.vspeed-(global.grav),objPlayer)) {
        yspeed = -2; // Touching the player, start rising
        objPlayer.y += yspeed;
    }
}

y += yspeed;