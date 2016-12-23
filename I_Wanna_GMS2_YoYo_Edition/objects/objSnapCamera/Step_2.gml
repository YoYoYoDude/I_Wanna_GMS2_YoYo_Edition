/// @description Snap camera to the player

if (instance_exists(objPlayer)) {
	var xFollow = objPlayer.x;
    var yFollow = objPlayer.y;
    
    if (!leaveRoom) {
        xFollow = clamp(xFollow,0,room_width-1); 
        yFollow = clamp(yFollow,0,room_height-1);   
    }
	
	xFollow = floor(xFollow/view_wport[0])*view_wport[0];
    yFollow = floor(yFollow/view_hport[0])*view_hport[0];
	
	camera_set_view_pos(view_camera[0],xFollow,yFollow);
}