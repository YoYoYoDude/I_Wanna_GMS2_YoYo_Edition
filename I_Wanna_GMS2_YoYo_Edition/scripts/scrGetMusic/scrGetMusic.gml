/// @description scrGetMusic()
/// Gets and plays which song is supposed to be playing for the current room

var roomSong;

switch (room) {
    case rTitle: // Add rooms to this list here (if you have several rooms that play the same song they can be put together)
    case rMenu:
    case rOptions:
    case rDifficultySelect:
    case rSample01:
        roomSong = musGuyRock;
        break; // Always put a break after setting the song
    /*
	case rEnd:
        roomSong = -1; // Play nothing
        break;
	*/
	//TODO: add roomSong = -2 example
    default: // By default don't play anything in case the room does not have a song set
        roomSong = -1;
        break;
}

if (roomSong != -2) { // Don't change music if roomSong is set to -2 (this is useful for bosses that you want full control of what song is playing)
    scrPlayMusic(roomSong,true); // Play the song for the current room
}