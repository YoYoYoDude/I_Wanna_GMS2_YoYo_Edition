/// @description scrSetVsync()
/// Sets vsync mode depending on the current setting

//TODO: test to make sure this is actually working

// Get where the window currently is so we can return to it next frame
global.windowXPrev = window_get_x();
global.windowYPrev = window_get_y();
global.windowWidthPrev = window_get_width();
global.windowHeightPrev = window_get_height();

display_reset(0,global.vsyncMode);

// Set alarm for returning to the previous window position/size (using display_reset resets the window's location and size)
with (objWorld) {
    alarm[1] = 1;
}