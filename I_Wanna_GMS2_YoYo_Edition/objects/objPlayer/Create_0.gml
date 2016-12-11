/// @description Initialize variables

frozen = false; // Sets if the player can move or not

jump = 8.5 * global.grav; // Sets how fast the player jumps
jump2 = 7 * global.grav; // Sets how fast the player double jumps
gravity = 0.4 * global.grav; // Sets the player's gravity

djump = 1; // Allow the player to double jump as soon as he spawns
maxSpeed = 3; // Max horizontal speed
maxVspeed = 9; // Max vertical speed
//TODO: set image speed in sprite settings
//image_speed = 0.2; //initial speed of animation
onPlatform = false; // Sets if the player is currently standing on a platform

xScale = 1; // Sets the direction the player is facing (1 is facing right, -1 is facing left)

//TODO: figure out hitbox stuff
//scrSetPlayerMask(); //set the player's hitbox

// Create the player's bow
if (global.difficulty == 0 && global.gameStarted)
    instance_create_layer(x,y,layer,objBow);

// Save the game if currently set to autosave
if (global.autosave) {
    scrSaveGame(true);
    global.autosave = false;
}