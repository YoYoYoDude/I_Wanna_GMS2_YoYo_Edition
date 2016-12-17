/// @description Draw menu

draw_set_color(c_black);
draw_set_font(fDefault24);
draw_set_valign(fa_top);

for(var i = 0; i < 11; i += 1) {
    draw_set_halign(fa_left);
	
	// Draw key option text
    draw_text(xSelector,ySelector+(i*ySeperation)+32,strSelect[i]);
    
    draw_set_halign(fa_right);
    
	// Show the current bound key
    if (!settingKey || i != keySelect) {
        draw_text(xSelector+xSeperation,ySelector+(i*ySeperation)+32,strKey[i]);
    }
	
	// Draw menu sprite
    if (i == keySelect) {
        draw_sprite(sprPlayerIdle,playerIndex,xSelector-20,ySelector+(i*ySeperation)+47);
        
		// Show key prompt if this key is currently being set
        if (settingKey) {
            draw_text(xSelector+xSeperation,ySelector+(i*ySeperation)+32,"Press the key to set");
        }
    }
	
	// Show the reset controls prompt
    if (resetPrompt && i == 10) {
        draw_text(xSelector+xSeperation,ySelector+(i*ySeperation)+32,"Controls reset!");
    }
}

scrDrawButtonInfo(false); // Draw menu button text