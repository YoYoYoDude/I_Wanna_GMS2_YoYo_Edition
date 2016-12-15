/// @description Clean up dynamic resources

//TODO: remove this
show_debug_message("world clean up");

//TODO: this doesn't seem to execute on game end like it should, create scrRestartGame

if (global.gamePaused) {
	// Delete pause screen sprite
	sprite_delete(global.pauseSpr);
				
	// Enable automatically drawing the application surface
	application_surface_draw_enable(true);
}

/*
// Delete the pause sprite in case the game is currently paused
application_surface_draw_enable(true);

if (sprite_exists(global.pauseSpr))
	sprite_delete(global.pauseSpr);
*/

/*
// Free the pause surface in case the game is currently paused
if (surface_exists(global.pauseSurf))
    surface_free(global.pauseSurf);
*/