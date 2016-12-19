/// @description scrSetWindowCaption()
/// Sets the current window caption

var windowCaption = global.windowCaptionDef;

if (global.gameStarted) {
    var t = global.time;
    var timeText = string(t div 3600) + ":";
    t = t mod 3600;
    timeText += string(t div 600);
    t = t mod 600;
    timeText += string(t div 60) + ":";
    t = t mod 60;
    timeText += string(t div 10);
    t = t mod 10;
    timeText += string(floor(t));
	
	windowCaption += " - Deaths: " + string(global.deaths) + " Time: " + timeText;
}

if (windowCaption != window_get_caption()) { // Only update the caption when it changes
    window_set_caption(windowCaption);
}