/// @description Make the player fall slower and give him a djump if set to

with (objPlayer) {
    if ((vspeed*global.grav) > 2) {
		vspeed = 2 * global.grav;
	}
	
	if (other.refreshDjump) {
		djump = 1;
	}
}