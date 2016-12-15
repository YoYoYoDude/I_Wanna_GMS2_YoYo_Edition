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

global.secretItem = array_create(SECRET_ITEM_TOTAL,false);
global.saveSecretItem = array_create(SECRET_ITEM_TOTAL,false);

global.bossItem = array_create(BOSS_ITEM_TOTAL,false);
global.saveBossItem = array_create(BOSS_ITEM_TOTAL,false);

global.gameClear = false;
global.saveGameClear = false;

global.trigger = array_create(50,false);

global.gameStarted = false; // Determines whether the game is currently in progress (enables saving, restarting, etc.)
global.noPause = false; // Sets whether or not to allow pausing (useful for bosses to prevent desync)
global.autosave = false; // Keeps track of whether or not to autosave the game the next time the player is created
global.gamePaused = false; // Keeps track of whether the game is paused or not
global.pauseSpr = -1; // Copies the application surface when the game is paused
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
*/

//TODO: should we use surface_get_width/height for this or go back to view?
display_set_gui_size(surface_get_width(application_surface),surface_get_height(application_surface)); // Set the correct gui size for the Draw GUI event

global.controllerMode = false; // Keeps track of whether to use keyboard or controller for inputs
global.controllerDelay = -1; // Handles delay for switching between keyboard/controller so that the player can't use both at the same time

randomize(); // Make sure the game starts with a random seed for RNG