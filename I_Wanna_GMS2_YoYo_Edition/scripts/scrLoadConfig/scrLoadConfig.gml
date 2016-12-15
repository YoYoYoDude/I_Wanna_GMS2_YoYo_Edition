/// @description scrLoadConfig()
/// Loads config settings, sets default config if it doesn't exist

ini_open("config.ini");

// General settings
global.muteMusic = ini_read_real("settings","mute_music",false);

global.volumeLevel = clamp(floor(ini_read_real("settings","volume_level",100)),0,100);
audio_master_gain(global.volumeLevel/100);

global.fullscreenMode = ini_read_real("settings","fullscreen_mode",false);
window_set_fullscreen(global.fullscreenMode);

global.vsyncMode = ini_read_real("settings","vsync_mode",false);
//TODO: implement vsync
/*
if (global.vsyncMode) { // Set vsync mode if it's currently on since it's off by default
    scrSetVsync();
}
*/

//TODO: make sure vsync is over smoothing mode in menus

global.smoothingMode = ini_read_real("settings","smoothing_mode",false);
//TODO: implement smoothing mode (move it out of objWorld step event)

//TODO: implement option to not update windows caption maybe

// Keyboard controls
global.leftButton[0] = ini_read_real("controls","left",vk_left);
global.rightButton[0] = ini_read_real("controls","right",vk_right);
global.upButton[0] = ini_read_real("controls","up",vk_up);
global.downButton[0] = ini_read_real("controls","down",vk_down);
global.jumpButton[0] = ini_read_real("controls","jump",vk_shift);
global.shootButton[0] = ini_read_real("controls","shoot",ord("Z"));
global.restartButton[0] = ini_read_real("controls","restart",ord("R"));
global.skipButton[0] = ini_read_real("controls","skip",ord("S"));
global.suicideButton[0] = ini_read_real("controls","suicide",ord("Q"));
global.pauseButton[0] = ini_read_real("controls","pause",ord("P"));
global.alignLeftButton[0] = ini_read_real("controls","align_left",ord("A"));
global.alignRightButton[0] = ini_read_real("controls","align_right",ord("D"));

// Keyboard menu keys (not rebindable)
global.menuLeftButton[0] = vk_left;
global.menuRightButton[0] = vk_right;
global.menuUpButton[0] = vk_up;
global.menuDownButton[0] = vk_down;
global.menuAcceptButton[0] = vk_shift;
global.menuBackButton[0] = ord("Z");
global.menuOptionsButton[0] = vk_enter;

if (CONTROLLER_ENABLED) {
    // Controller options/controls
    global.controllerIndex = ini_read_real("controller", "index", -1); // -1 sets no controller
    global.leftButton[1] = ini_read_real("controller","left",gp_padl);
    global.rightButton[1] = ini_read_real("controller","right",gp_padr);
    global.upButton[1] = ini_read_real("controller","up",gp_padu);
    global.downButton[1] = ini_read_real("controller","down",gp_padd);
    global.jumpButton[1] = ini_read_real("controller","jump",gp_face1);
    global.shootButton[1] = ini_read_real("controller","shoot",gp_face3);
    global.restartButton[1] = ini_read_real("controller","restart",gp_face4);
    global.skipButton[1] = ini_read_real("controller","skip",gp_face2);
    global.suicideButton[1] = ini_read_real("controller","suicide",gp_select);
    global.pauseButton[1] = ini_read_real("controller","pause",gp_start);
    global.alignLeftButton[1] = ini_read_real("controller","align_left",gp_shoulderl);
    global.alignRightButton[1] = ini_read_real("controller","align_right",gp_shoulderr);
	
	// Controller menu buttons (not rebindable)
	global.menuLeftButton[1] = gp_padl;
	global.menuRightButton[1] = gp_padr;
	global.menuUpButton[1] = gp_padu;
	global.menuDownButton[1] = gp_padd;
	global.menuAcceptButton[1] = gp_face1;
	global.menuBackButton[1] = gp_face2;
	global.menuOptionsButton[1] = gp_select;
}

ini_close();

scrSaveConfig(); // Save the current config settings