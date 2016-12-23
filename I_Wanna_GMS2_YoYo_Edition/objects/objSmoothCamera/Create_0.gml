/// @description Initalize variables

snapDiv = 4; // Determines how fast the camera snaps to the player, higher numbers follow the player slower (can be changed in creation code)

// Snap to the player when spawning
if (instance_exists(objPlayer)) {
    x = objPlayer.x;
    y = objPlayer.y;
}

camera_set_view_target(view_camera[0],id); // Set the view camera to follow this object