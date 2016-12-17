/// @description Initialize variables

keySelect = 0; // Sets which key is currently selected

xSelector = 120; // Sets where to draw the menu text on the x axis
ySelector = 53; // Sets where to draw the menu text on the y axis
xSeperation = 560; // Sets how far to separate the key name from the key value
ySeperation = 40; // Sets how far each option is from each other

settingKey = false; // Sets whether or not a key is currently getting set
resetPrompt = false; // Sets whether to show the message that controls were reset

strSelect[0] = "Left Button";
strSelect[1] = "Right Button";
strSelect[2] = "Up Button";
strSelect[3] = "Down Button";
strSelect[4] = "Jump Button";
strSelect[5] = "Shoot Button";
strSelect[6] = "Restart Button";
strSelect[7] = "Skip Button";
strSelect[8] = "Suicide Button";
strSelect[9] = "Pause Button";
strSelect[10] = "Reset Controls";

// Get current control strings
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

// Stores the image index of the menu sprite
playerIndex = 0;