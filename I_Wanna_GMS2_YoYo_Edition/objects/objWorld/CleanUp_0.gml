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