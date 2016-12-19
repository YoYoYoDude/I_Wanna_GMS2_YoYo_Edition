/// @description Return to previous window position/size (after using display_reset)

if (!window_get_fullscreen()) {
    window_set_position(global.windowXPrev,global.windowYPrev);
    window_set_size(global.windowWidthPrev,global.windowHeightPrev);
}