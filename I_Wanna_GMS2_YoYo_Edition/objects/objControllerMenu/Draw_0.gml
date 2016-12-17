/// @description Draw menu

draw_set_color(c_black);
draw_set_font(fDefault24);
draw_set_valign(fa_top);

for(var i = 0; i < 12; i += 1) {
    draw_set_halign(fa_left);
	
	// Draw button option text
    draw_text(xSelector,ySelector+(i*ySeperation)+32,strSelect[i]);
    
    draw_set_halign(fa_right);
	
	// Show the current bound button
	if (!settingButton || i != buttonSelect) {
        draw_text(xSelector+xSeperation,ySelector+(i*ySeperation)+32,strButton[i]);
    }
    
	// Draw menu sprite
    if (i == buttonSelect) {
        draw_sprite(sprPlayerIdle,playerIndex,xSelector-20,ySelector+(i*ySeperation)+47);
        
        // Show button prompt if this key is currently being set
		if (settingButton)  {
            draw_text(xSelector+xSeperation,ySelector+(i*ySeperation)+32,"Press button to set");
        }
    }
	
	// Show the reset controls prompt
    if (resetPrompt && i == 11) {
        draw_text(xSelector+xSeperation,ySelector+(i*ySeperation)+32,"Controls reset!");
    }
}

// Draw current controller text
if (global.controllerIndex != -1) {
    draw_set_color(c_maroon);
    draw_set_font(fDefault12);
    draw_set_halign(fa_left);
    
    var controllerText = "Current controller: ";
    
    if (gamepad_is_connected(global.controllerIndex)) { // Show what type of controller is connected
        controllerText += gamepad_get_description(global.controllerIndex);
    } else { // No controller connected
        controllerText += "None";
    }
    
    draw_text(xSelector+2,ySelector+(12*ySeperation)+34,controllerText);
    
    draw_set_color(c_black);
}

scrDrawButtonInfo(false); // Draw menu button text