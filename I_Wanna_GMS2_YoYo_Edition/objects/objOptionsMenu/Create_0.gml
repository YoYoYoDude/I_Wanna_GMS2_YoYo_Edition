/// @description Initialize variables

//TODO: add more comments (maybe rename some of these variables

optionNum = 7; // Sets number of separate options available
optionSelect = 0; // Sets which option is currently selected

xSelector = 124; // Sets where to draw the options text on the x axis
//TODO
ySelector = 132+7; // Sets where to draw the options text on the y axis
xSeperation = 550; // Sets how far to separate the option name from the option value
ySeperation = 48; // Sets how far each options is from each other

if (!CONTROLLER_ENABLED) { // Remove controller settings menu if controllers are disabled
    optionNum -= 1;
    ySelector += 32;
}

strSelect[0] = "Music";
strSelect[1] = "Volume Level";
strSelect[2] = "Screen Mode";
strSelect[3] = "Vsync";
strSelect[4] = "Smoothing Mode";
strSelect[5] = "Set Keyboard Controls";
strSelect[6] = "Controller Options";

// Stores the image index of the menu sprite
playerIndex = 0;