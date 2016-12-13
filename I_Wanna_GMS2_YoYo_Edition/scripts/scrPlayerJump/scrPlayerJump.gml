/// @description scrPlayerJump()
/// Makes the player jump

//TODO: maybe add place_meeting objPlatform check here
if (place_meeting(x,y+(global.grav),objBlock) || onPlatform || place_meeting(x,y,objWater)) {
    // Single jump
	vspeed = -jump;
    djump = 1;
    audio_play_sound(sndJump,0,false);
} else if (djump == 1 || place_meeting(x,y,objWater2) || global.infJump) {
    // Double jump
	vspeed = -jump2;
    sprite_index = sprPlayerJump;
    audio_play_sound(sndDJump,0,false);
    
	// Check if touching water3
    if (!place_meeting(x,y,objWater3))
        djump = 0; // Take away the player's double jump
    else
        djump = 1; // Replenish double jump if touching water3
}