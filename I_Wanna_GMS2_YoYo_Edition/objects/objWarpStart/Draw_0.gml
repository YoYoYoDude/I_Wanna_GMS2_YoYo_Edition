/// @description Draw self and difficulty text

draw_self();

draw_set_color(c_black)
draw_set_font(fDefault12);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(x+16,y-16,difName);