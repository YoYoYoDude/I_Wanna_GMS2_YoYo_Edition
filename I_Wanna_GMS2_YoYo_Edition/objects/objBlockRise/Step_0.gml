/// @description Check if near player and move

if (yspeed == 0 && instance_exists(objPlayer)) {
    if (place_meeting(x,y-objPlayer.vspeed-(global.grav),objPlayer)) {
        yspeed = -2; // Touching the player, start rising
    }
}

event_inherited(); // Movement checks