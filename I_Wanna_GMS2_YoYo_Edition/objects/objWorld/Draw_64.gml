/// @description Draw debug overlay/pause screen

// Draw debug overlay
if (global.debugOverlay) {
    draw_set_color(c_black);
    draw_set_halign(fa_left);
    draw_set_font(fDefault12);
    
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