/// @description Collect this item

global.bossItem[itemNum] = true;

audio_play_sound(sndBlockChange,0,false);
instance_destroy();