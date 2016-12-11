/// @description Fade current music out
global.musicFading = true;
global.currentGain = audio_sound_get_gain(global.currentMusic); // Get current gain
audio_sound_gain(global.currentMusic,0,1000); // Fade out music over 1 second

alarm[0] = 50; // Pause music when it's done fading