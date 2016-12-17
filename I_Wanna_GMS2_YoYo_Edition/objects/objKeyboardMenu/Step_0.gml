/// @description Check for button inputs

// Animate menu sprite
playerIndex = (playerIndex + 1/5) mod 4;

// Check for button inputs
if (!settingKey) { // Check if we're currently setting a key bind
    if (scrButtonCheckPressed(global.menuUpButton)) { // Move up in the menu
        audio_play_sound(MENU_SOUND,0,false);
        keySelect -= 1;
        if (keySelect < 0) {
            keySelect = 10;
		}
    } else if (scrButtonCheckPressed(global.menuDownButton)) { // Move down in the menu
        audio_play_sound(MENU_SOUND,0,false);
        keySelect += 1;
        if (keySelect > 10) {
            keySelect = 0;
		}
    } else if (scrButtonCheckPressed(global.menuBackButton)) { // Save changes and go back to the options menu
        scrSaveConfig();
        instance_create_layer(x,y,layer,objOptionsMenu);
        instance_destroy();
    } else if (scrButtonCheckPressed(global.menuAcceptButton)) { // Select current option
        if (keySelect != 10) { // Set the selected key
            settingKey = true;
        } else { // Reset to default controls
            global.leftButton[0] = vk_left;
            global.rightButton[0] = vk_right;
            global.upButton[0] = vk_up;
            global.downButton[0] = vk_down;
            global.jumpButton[0] = vk_shift;
            global.shootButton[0] = ord("Z");
            global.restartButton[0] = ord("R");
            global.skipButton[0] = ord("S");
            global.suicideButton[0] = ord("Q");
            global.pauseButton[0] = ord("P");
            
			// Show control reset text
            resetPrompt = true;
            alarm[0] = 60;
        }
    }
} else {
    if (keyboard_check_pressed(vk_anykey)) { // Check if a key is being pressed and if it is, store that key
        var keyChange;
        
        keyChange = keyboard_key; // Get the key currently being pressed
        
		// Check if current key pressed is either shift key
        if (keyChange == 160 || keyChange == 161)
            keyChange = 16; // Set it to work for both shift keys
        
		// Set the currently pressed key to whichever key is selected
		switch (keySelect) {
			case 0:
				global.leftButton[0] = keyChange;
				break;
			case 1:
				global.rightButton[0] = keyChange;
				break;
			case 2:
				global.upButton[0] = keyChange;
				break;
			case 3:
				global.downButton[0] = keyChange;
				break;
			case 4:
				global.jumpButton[0] = keyChange;
				break;
			case 5:
				global.shootButton[0] = keyChange;
				break;
			case 6:
				global.restartButton[0] = keyChange;
				break;
			case 7:
				global.skipButton[0] = keyChange;
				break;
			case 8:
				global.suicideButton[0] = keyChange;
				break;
			case 9:
				global.pauseButton[0] = keyChange;
				break;
		}
        
        settingKey = false;
    } else if (scrAnyControllerButtonPressed() != -1) { // If a controller button was pressed, exit prompt
        settingKey = false;
    }
}

// Update current control strings
strKey[0] = scrGetKeyStr(global.leftButton[0]);
strKey[1] = scrGetKeyStr(global.rightButton[0]);
strKey[2] = scrGetKeyStr(global.upButton[0]);
strKey[3] = scrGetKeyStr(global.downButton[0]);
strKey[4] = scrGetKeyStr(global.jumpButton[0]);
strKey[5] = scrGetKeyStr(global.shootButton[0]);
strKey[6] = scrGetKeyStr(global.restartButton[0]);
strKey[7] = scrGetKeyStr(global.skipButton[0]);
strKey[8] = scrGetKeyStr(global.suicideButton[0]);
strKey[9] = scrGetKeyStr(global.pauseButton[0]);
strKey[10] = "";