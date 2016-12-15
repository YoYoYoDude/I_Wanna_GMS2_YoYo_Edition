/// @description Spawn the player

if (!instance_exists(objPlayer)) {
	instance_create_layer(x+17,y+23,"Player",objPlayer);
}

//TODO: test what layer the player is on if the layer doesnt exist