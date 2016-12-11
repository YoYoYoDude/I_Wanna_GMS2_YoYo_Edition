/// @description Draw self/text

draw_self();

if (showText) {
    draw_set_color(c_black);
    draw_set_font(fDefault12);
    draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
    
    var yOffset = string_height(signText);
    
    draw_text(x+(sprite_width/2),y-yOffset,signText);
}