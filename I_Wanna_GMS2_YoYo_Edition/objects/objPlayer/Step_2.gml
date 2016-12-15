/// @description Check if player left the room

if ((x < 0 || x > room_width || y < 0 || y > room_height) && global.edgeDeath) {
    scrKillPlayer();
}