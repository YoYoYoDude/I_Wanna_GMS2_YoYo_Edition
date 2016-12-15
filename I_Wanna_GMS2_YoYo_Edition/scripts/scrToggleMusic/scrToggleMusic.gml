/// @description scrToggleMusic()
/// Toggles the music on and off

global.muteMusic = !global.muteMusic;

if (!global.muteMusic) {  // Unmuting music, start playing music
    if (instance_exists(objPlayer) || !global.gameStarted) {
        scrGetMusic(); // Find and play the proper music for the current room
    }
} else { // Muting music
    scrStopMusic();
    audio_stop_sound(global.gameOverMusic);
}