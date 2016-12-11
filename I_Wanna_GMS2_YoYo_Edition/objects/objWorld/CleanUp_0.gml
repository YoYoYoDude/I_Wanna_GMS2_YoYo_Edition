/// @description Clean up dynamic resources

//TODO: remove this
show_debug_message("world clean up");

// Free the pause surface in case the game is currently paused
if (surface_exists(global.pauseSurf))
    surface_free(global.pauseSurf);