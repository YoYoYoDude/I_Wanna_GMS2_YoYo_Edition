/// @description Make the player fall slower

//TODO: maybe we should move this collision to the player object instead?

with (objPlayer) {
    if ((vspeed*global.grav) > 2)
		vspeed = 2 * global.grav;
}