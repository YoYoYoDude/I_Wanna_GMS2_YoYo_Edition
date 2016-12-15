/// @description Warp the player if they're outside the room

if (other.x < 0 || other.x > room_width || other.y < 0 || other.y > room_height) { //Check if player has left the room
	if (!smoothTransition) { // Not using smooth transition, use default warp
        event_inherited();
    } else { // Using smooth transition, wrap the player around the screen then warp
        if (other.x < 0) {
            other.x += room_width;
        } else if (other.x > room_width) {
            other.x -= room_width;
        }
        if (other.y < 0) {
            other.y += room_height;
        } else if (other.y > room_height) {
            other.y -= room_height;
        }
        
        room_goto(roomTo);
    }
}