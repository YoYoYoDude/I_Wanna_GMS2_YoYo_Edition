/// @description Initialize variables

//TODO: should blood use precise collision checking?

image_index = irandom(image_number-1);

direction = irandom(35) * 10;
speed = random(6);
gravity = (0.1+random(0.2)) * global.grav;