/// @description Destroy the player's bow

//TODO: remove this
show_debug_message("player clean up");

with (objBow) {
    instance_destroy();
}