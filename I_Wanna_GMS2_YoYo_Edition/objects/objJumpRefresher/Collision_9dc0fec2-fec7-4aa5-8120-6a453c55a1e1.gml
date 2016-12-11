/// @description Give player a djump

if (visible) {
    with (objPlayer)
        djump = 1;
    
    visible = false;
    alarm[0] = refreshTime;
}