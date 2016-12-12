/// @description Collect this item

global.secretItem[itemNum] = true;

// Save the item if autosaving items is on
if (AUTOSAVE_SECRET_ITEMS) {
    global.saveSecretItem[itemNum] = true;
    scrSaveGame(false); // Save the game without saving the player's current position
}

audio_play_sound(sndItem,0,false);
instance_destroy();