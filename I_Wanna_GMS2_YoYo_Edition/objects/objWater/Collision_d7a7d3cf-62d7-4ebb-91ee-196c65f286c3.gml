/// @description Give the player a djump and make him fall slower

//TODO: maybe we should move this collision to the player object instead?
//TODO: switch water objects so that they all have a water parent?

with (objPlayer) {
    djump = 1;
    if ((vspeed*global.grav) > 2)
		vspeed = 2 * global.grav;
}