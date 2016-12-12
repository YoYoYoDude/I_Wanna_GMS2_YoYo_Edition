/// @description Initialize variables (can be changed in creation code)

// This warp only activates when the player leaves the room, it can be used on the edges of rooms for smoother room transitions

event_inherited();

// Sets whether the player wraps around the screen for a smooth transition to the next room (this requires both the room sizes to be the same), can be changed in creation code
smoothTransition = false;