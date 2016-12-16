/// @description scrDrawButtonInfo(optionsText)
/// Draws the button control info for menus
/// argument0 - sets whether to draw the text for entering the options menu

var optionsText = argument0;

var backButton;
var acceptButton;
var optionsButton;

// Check whether to display keyboard or controller buttons
if (!global.controllerMode) {
    backButton = scrGetKeyStr(global.menuBackButton[0]);
    acceptButton = scrGetKeyStr(global.menuAcceptButton[0]);
    optionsButton = scrGetKeyStr(global.menuOptionsButton[0]);
} else {
    backButton = scrGetControllerStr(global.menuBackButton[1]);
    acceptButton = scrGetControllerStr(global.menuAcceptButton[1]);
    optionsButton = scrGetControllerStr(global.menuOptionsButton[1]);
}

// Draw button info
draw_set_font(fDefault12);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(34,556,"["+backButton+"] Back");
draw_set_halign(fa_right);
draw_text(766,556,"["+acceptButton+"] Accept");

// Check if we should draw button info for entering to the options menu
if (optionsText) {
    draw_set_halign(fa_middle);
    draw_text(400,556,"["+optionsButton+"] Options");
}