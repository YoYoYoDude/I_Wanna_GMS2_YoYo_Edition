/// @description scrInitializeGlobals()
/// Initializes all global variables needed for the game

scrSetGlobalOptions(); // Initialize global game options

// Initialize basic game variables
global.saveNum = 1;
global.difficulty = 0; // 0 = medium, 1 = hard, 2 = very hard, 3 = impossible
global.deaths = 0;
global.time = 0;
global.timeMicro = 0;
global.saveRoom = "";
global.savePlayerX = 0;
global.savePlayerY = 0;
global.grav = 1;
global.saveGrav = 1;

//TODO: check if there's a better way of initializing arrays in GMS2

global.secretItem = array_create(global.secretItemTotal,false);
global.saveSecretItem = array_create(global.secretItemTotal,false);

global.bossItem = array_create(global.bossItemTotal,false);
global.saveBossItem = array_create(global.bossItemTotal,false);

/*
for (var i = global.secretItemTotal-1; i >= 0; i--) {
    global.secretItem[i] = false;
    global.saveSecretItem[i] = false;
}

for (var i = global.bossItemTotal-1; i >= 0; i--) {
    global.bossItem[i] = false;
    global.saveBossItem[i] = false;
}
*/

global.gameClear = false;
global.saveGameClear = false;

global.trigger = array_create(100,false);

/*
for (var i = 99; i >= 0; i--) {
    global.trigger[i] = false;
}
*/

global.gameStarted = false; // Determines whether the game is currently in progress (enables saving, restarting, etc.)
global.noPause = false; // Sets whether or not to allow pausing (useful for bosses to prevent desync)
global.autosave = false; // Keeps track of whether or not to autosave the game the next time the player is created
global.gamePaused = false; // Keeps track of whether the game is paused or not
global.pauseSurf = -1; // Stores the screen surface when the game is paused
global.pauseDelay = 0; // Sets a pause delay so that the player can't quickly pause/unpause to prevent pause buffer strats

global.currentMusicID = -1; // Keeps track of what song the current main music is
global.currentMusic = -1; // Keeps track of the current main music instance
global.deathSound = -1; // Keeps track of the death sound when the player dies
global.gameOverMusic = -1; // Keeps track of the game over music instance
global.musicFading = false; // Keeps track of whether the main music is currently fading out
global.currentGain = 0; // Keeps track of the current main music gain before a song is faded out


//TODO: figure out new view stuff
/*
//get the default window size
global.windowWidth = view_wport[0];
global.windowHeight = view_hport[0];

//keeps track of previous window position/size when display_reset is used for setting vsync
global.windowXPrev = 0;
global.windowYPrev = 0;
global.windowWidthPrev = 0;
global.windowHeightPrev = 0;

display_set_gui_size(view_wport[0],view_hport[0]);  //set the correct gui size for the Draw GUI event
*/

global.controllerMode = false; // Keeps track of whether to use keyboard or controller for inputs
global.controllerDelay = -1; // Handles delay for switching between keyboard/controller so that the player can't use both at the same time

randomize(); // Make sure the game starts with a random seed for RNG