/// @description Set game to clear and autosave when touched

if (!global.gameClear) {
    global.gameClear = true;
    scrSaveGame(true);
}