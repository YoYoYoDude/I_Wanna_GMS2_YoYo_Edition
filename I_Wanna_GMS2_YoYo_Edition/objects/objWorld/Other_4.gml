/// @description Play current room music and put into the correct layer

scrGetMusic(); // Find and play the proper music for the current room

//TODO: objWorld layer check

layer = layer_get_id("World"); // Put into the correct layer

//TODO: set room view settings here? (can add stuff like macros to make it easy to change window size, etc)

//TODO
//scrSetRoomCaption();    //make sure window caption stays updated