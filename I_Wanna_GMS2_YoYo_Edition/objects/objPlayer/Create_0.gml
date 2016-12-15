/// @description Initialize variables

frozen = false; // Sets if the player can move or not

jump = 8.5 * global.grav; // Sets how fast the player jumps
jump2 = 7 * global.grav; // Sets how fast the player double jumps
gravity = 0.4 * global.grav; // Sets the player's gravity

djump = 1; // Allow the player to double jump as soon as he spawns
maxHSpeed = 3; // Max horizontal speed
maxVSpeed = 9; // Max vertical speed
onPlatform = false; // Sets if the player is currently standing on a platform

xScale = 1; // Sets the direction the player is facing (1 is facing right, -1 is facing left)

// Set the player's hitbox depending on gravity direction
if (global.grav == 1) {
	mask_index = sprPlayerMask;
} else {
	mask_index = sprPlayerMaskFlip;
}

// Create the player's bow if on medium mode
if (global.difficulty == 0 && global.gameStarted) {
    instance_create_layer(x,y,layer,objBow);
}

// Save the game if currently set to autosave
if (global.autosave) {
    scrSaveGame(true);
    global.autosave = false;
}