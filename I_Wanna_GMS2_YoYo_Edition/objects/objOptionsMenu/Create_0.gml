/// @description Initialize variables

optionNum = 6; // Sets number of separate menu options available
optionSelect = 0; // Sets which option is currently selected

xSelector = 124; // Sets where to draw the menu text on the x axis
ySelector = 171; // Sets where to draw the menu text on the y axis
xSeperation = 550; // Sets how far to separate the option name from the option value
ySeperation = 48; // Sets how far each options is from each other

if (!CONTROLLER_ENABLED) { // Remove controller settings menu if controllers are disabled
    optionNum -= 1;
    ySelector += 24;
}

strSelect[0] = "Music";
strSelect[1] = "Volume Level";
strSelect[2] = "Screen Mode";
strSelect[3] = "Smoothing Mode";
strSelect[4] = "Keyboard Controls";
strSelect[5] = "Controller Options";

// Stores the image index of the menu sprite
playerIndex = 0;