/// @description Check for button inputs

// Animate menu sprite
playerIndex = (playerIndex + 1/5) mod 4;

// Check for button inputs
if (scrButtonCheckPressed(global.menuUpButton)) { // Move up in the menu
    audio_play_sound(MENU_SOUND,0,false);
    optionSelect -= 1;
    if (optionSelect < 0) {
        optionSelect = optionNum - 1;
	}
} else if (scrButtonCheckPressed(global.menuDownButton)) { // Move down in the menu
    audio_play_sound(MENU_SOUND,0,false);
    optionSelect += 1;
    if (optionSelect > optionNum - 1) {
        optionSelect = 0;
	}
} else if (scrButtonCheckPressed(global.menuBackButton)) { // Save changes and go back to the difficulty menu
    scrSaveConfig();
    room_goto(rMenu);
    exit;
} else if (scrButtonCheckPressed(global.menuAcceptButton)) { // Select current option
    if (optionSelect == 0) { // Toggle mute music
        scrToggleMusic();
    } else if (optionSelect == 2) { // Toggle fullscreen
        global.fullscreenMode = !global.fullscreenMode;
        window_set_fullscreen(global.fullscreenMode);
    } else if (optionSelect == 3) { // Toggle smoothing mode
        global.smoothingMode = !global.smoothingMode;
    } else if (optionSelect == 4) { // Save changes and go to the keyboard controls menu
        scrSaveConfig();
        instance_create_layer(x,y,layer,objKeyboardMenu);
        instance_destroy();
        exit;
    } else if (optionSelect == 5) { // Save changes and go to the controller options menu
        scrSaveConfig();
        instance_create_layer(x,y,layer,objControllerMenu);
		instance_destroy();
        exit;
    }
}


if (optionSelect == 1) { // Handle volume controls
    if (scrButtonCheck(global.menuRightButton)) { // Raise volume
        if (global.volumeLevel < 100) {
            global.volumeLevel += 1;
		}
		audio_master_gain(global.volumeLevel/100); // Set master gain
    } else if (scrButtonCheck(global.menuLeftButton)) { // Lower volume
        if (global.volumeLevel > 0) {
            global.volumeLevel -= 1;
		}
		audio_master_gain(global.volumeLevel/100); // Set master gain
    }
}