/// @description scrSetGlobalOptions()
/// Sets configurable global game options

global.debugMode = false; // Enables debug keys (check objWorld step event to see all of them), make sure to set this to "false" before releasing your game
global.debugVisuals = true; // Enables changing the color/alpha of the player when inf jump/god mode are toggled, make sure to disable this if you want to change the player's image_alpha or image_blend
global.debugOverlay = false; // Enables showing the debug text overlay (shows player location, align, etc.)
global.godMode = false; // Enables god mode (toggle with Home key)
global.infJump = false; // Enables infinite jump (toggle with End key)
global.showHitbox = false; // Enables showing the player's hitbox (toggle with Del key)

//TODO: captions
/*
global.roomCaptionDef = "I Wanna Be The Studio Engine YoYoYo Edition";  //sets default window caption (only works with the Professional version of Studio)
global.roomCaptionLast = global.roomCaptionDef;
window_set_caption(global.roomCaptionDef);
*/

global.md5StrAdd = "Put something here!"; // Sets what to add to the end of md5 input string to make saves harder to hack, should be set to something unique and hard to predict (similar to setting a password)

global.startRoom = rSample01; // Sets which room for the game to begin with

global.menuMode = 1; // Sets whether to use a warp room or a menu for selecting the game's difficulty (0 = warp room, 1 = menu)
global.menuSound = sndJump; // Sets what sound to use for navigating the main menu
global.deathMusicMode = 0; // Sets whether or not to play death music when the player dies (0 = no death music, 1 = death music and instantly pause current music, 2 = death music and fade out current music)
global.adAlign = false; // Sets whether or not to enable A/D align
global.timeWhenDead = true; // Sets whether or not to count the in-game timer when the player is dead
global.edgeDeath = true; // Sets whether to kill the player when he leaves the boundaries of the room
global.pauseDelayLength = 40; // Sets the delay in frames in which the player can pause/unpause the game to prevent pause buffer strats (can be set to 0 to disable pause delay)
//TODO: remove this option
//global.delayBow = false; // Sets whether to delay the player bow's movement by a frame or not (most engines have the bow lagging behind the player by a frame, so set this to "true" to make the bow look like it does in other engines)
global.directionalTapFix = false; // Sets whether to change the behavior of tapping left/right for less than 1 frame (by default the player does not move when this happens, enabling this always moves the player for 1 frame when left/right is tapped)

global.secretItemTotal = 8; // Sets how many secret items for the game to save/load
global.bossItemTotal = 8; // Sets how many boss items for the game to save/load
global.autosaveSecretItems = false; // Sets whether to save secret items immediately when you grab them or if you have to hit a save afterward

global.controllerEnabled = true; // Sets whether controllers are supported
global.controllerDelayLength = 5; // Sets the delay in frames in which the player can switch between keyboard/controller (can be set to 0 to disable delay)

//TODO: remove this option
//global.extraSaveProtection = false; //sets whether to use the ds_map_secure functions for saving/loading (improves save security and prevents transferring between PCs)