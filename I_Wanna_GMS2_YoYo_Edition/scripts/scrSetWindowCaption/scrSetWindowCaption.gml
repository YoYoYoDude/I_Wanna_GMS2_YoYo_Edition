/// @description scrSetWindowCaption()
/// Sets the current window caption

var windowCaption = global.windowCaptionDef;

if (global.gameStarted) {
    var t = global.time;
    var timeStr = string(t div 3600) + ":";
    t = t mod 3600;
    timeStr += string(t div 600);
    t = t mod 600;
    timeStr += string(t div 60) + ":";
    t = t mod 60;
    timeStr += string(t div 10);
    t = t mod 10;
    timeStr += string(floor(t));
	
	windowCaption += " - Deaths: " + string(global.deaths) + " Time: " + timeStr;
}

if (windowCaption != window_get_caption()) { // Only update the caption when it changes
    window_set_caption(windowCaption);
}