/// @description scrAnyControllerButtonPressed()
/// Returns a gamepad button if one is being pressed and -1 if none are pressed (if multiple are pressed at the same time, return whichever has the lowest value)

// Make an array of all the gamepad buttons to check
var buttonArr = [gp_face1,gp_face2,gp_face3,gp_face4,gp_padu,gp_padd,gp_padl,gp_padr,gp_stickr,gp_stickl,gp_select,gp_start,gp_shoulderr,gp_shoulderrb,gp_shoulderl,gp_shoulderlb];
var buttonArrLength = array_length_1d(buttonArr);

// Check every button in the array
for (var i = 0; i < buttonArrLength; i++) {
    if (gamepad_button_check_pressed(global.controllerIndex, buttonArr[i])) {
        return buttonArr[i]; // Button pressed, return value
	}
}

return -1; // No buttons pressed