/// @description Give the player a djump and make him fall slower

//TODO: maybe we should move this collision to the player object instead?

event_inherited();

with (objPlayer) {
    djump = 1;
}