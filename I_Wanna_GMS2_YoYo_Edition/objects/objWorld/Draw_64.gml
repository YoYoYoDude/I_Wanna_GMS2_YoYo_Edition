/// @description Draw pause screen/debug overlay

// Draw pause screen

if (global.gamePaused) {
    //TODO: do we need this since we're not drawing the application surface?
	//draw_clear(c_black);
	
	draw_sprite(global.pauseSpr,-1,0,0);
    
    draw_set_color(c_black);
    draw_set_alpha(0.4);
    
    draw_rectangle(-1,-1,view_wport[0],view_hport[0],0); // Draw a rectangle over the pause screen to darken it
    
    draw_set_alpha(1);
    draw_set_color(c_white);
    
    draw_set_font(fDefault30);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
    
    draw_text(view_wport[0]/2,view_hport[0]/2 - 24,"PAUSE"); // Draw pause text
    
    draw_set_font(fDefault18);
	draw_set_halign(fa_left);
    
    var t = global.time;
    var timeText = string(t div 3600) + ":";
    t = t mod 3600;
    timeText += string(t div 600);
    t = t mod 600;
    timeText += string(t div 60) + ":";
    t = t mod 60;
    timeText += string(t div 10);
    t = t mod 10;
    timeText += string(floor(t));
    
    draw_text(20,516,"Volume: " + string(global.volumeLevel) + "%");
    draw_text(20,541,"Deaths: " + string(global.deaths));
    draw_text(20,566,"Time: " + timeText);
}

// Draw debug overlay
if (global.debugOverlay) {
    draw_set_color(c_black);
	//TODO: make a script to set these font variables?
    draw_set_font(fDefault12);
    draw_set_halign(fa_left);
	draw_set_valign(fa_top);
    
    var drawX = 0, drawY = 0, drawAlign = 0;
    if (instance_exists(objPlayer)) {
        drawX = objPlayer.x;
        drawY = objPlayer.y;
        drawAlign = objPlayer.x mod 3;
    }
    
    scrDrawTextOutline(20,20,"X: "+string(drawX),c_black,c_white);
    scrDrawTextOutline(20,40,"Y: "+string(drawY),c_black,c_white);
    scrDrawTextOutline(20,60,"Align: "+string(drawAlign),c_black,c_white);
    scrDrawTextOutline(20,80,"Room name: "+room_get_name(room),c_black,c_white);
    scrDrawTextOutline(20,100,"Room number: "+string(room),c_black,c_white);
    scrDrawTextOutline(20,120,"God mode: "+string(global.godMode),c_black,c_white);
    scrDrawTextOutline(20,140,"Infinite jump: "+string(global.infJump),c_black,c_white);
    scrDrawTextOutline(20,160,"FPS: "+string(fps),c_black,c_white);
    scrDrawTextOutline(20,180,"Real FPS: "+string(fps_real),c_black,c_white);
}