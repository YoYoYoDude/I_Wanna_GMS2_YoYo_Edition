/// @description Check if triggered

if (!triggered && global.trigger[trg]) {
    triggered = true;
	
	if (v != 0 || h != 0) {
        vspeed = v;
        hspeed = h;
    } else if (spd != 0) {
        speed = spd;
        direction = dir;
    }
}