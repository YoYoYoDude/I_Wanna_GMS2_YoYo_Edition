/// @description Check if text should be showing

if (place_meeting(x,y,objPlayer)) {
    if (scrButtonCheckPressed(global.upButton))
        showText = true;
} else {
    showText = false;
}