/// scrSaveConfig()
/// Saves current config settings

ini_open("config.ini");

// General settings
ini_write_real("settings","mute_music",global.muteMusic);
ini_write_real("settings","volume_level",global.volumeLevel);
ini_write_real("settings","fullscreen_mode",global.fullscreenMode);
ini_write_real("settings","smoothing_mode",global.smoothingMode);
ini_write_real("settings","vsync_mode",global.vsyncMode);

// Keyboard controls
ini_write_real("controls","left",global.leftButton[0]);
ini_write_real("controls","right",global.rightButton[0]);
ini_write_real("controls","up",global.upButton[0]);
ini_write_real("controls","down",global.downButton[0]);
ini_write_real("controls","jump",global.jumpButton[0]);
ini_write_real("controls","shoot",global.shootButton[0]);
ini_write_real("controls","restart",global.restartButton[0]);
ini_write_real("controls","skip",global.skipButton[0]);
ini_write_real("controls","suicide",global.suicideButton[0]);
ini_write_real("controls","pause",global.pauseButton[0]);
ini_write_real("controls","align_left",global.alignLeftButton[0]);
ini_write_real("controls","align_right",global.alignRightButton[0]);

if (global.controllerEnabled)
{
    // Controller options/controls
    ini_write_real("controller","index",global.controllerIndex);
    ini_write_real("controller","left",global.leftButton[1]);
    ini_write_real("controller","right",global.rightButton[1]);
    ini_write_real("controller","up",global.upButton[1]);
    ini_write_real("controller","down",global.downButton[1]);
    ini_write_real("controller","jump",global.jumpButton[1]);
    ini_write_real("controller","shoot",global.shootButton[1]);
    ini_write_real("controller","restart",global.restartButton[1]);
    ini_write_real("controller","skip",global.skipButton[1]);
    ini_write_real("controller","suicide",global.suicideButton[1]);
    ini_write_real("controller","pause",global.pauseButton[1]);
    ini_write_real("controller","align_left",global.alignLeftButton[1]);
    ini_write_real("controller","align_right",global.alignRightButton[1]);
}

ini_close();