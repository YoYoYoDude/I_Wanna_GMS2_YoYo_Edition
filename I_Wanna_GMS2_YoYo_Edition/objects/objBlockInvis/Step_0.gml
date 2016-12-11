/// @description Check if the player is near

if (!visible && distance_to_object(objPlayer) <= 1) {
    audio_play_sound(sndBlockChange,0,false);
    visible = true;
}