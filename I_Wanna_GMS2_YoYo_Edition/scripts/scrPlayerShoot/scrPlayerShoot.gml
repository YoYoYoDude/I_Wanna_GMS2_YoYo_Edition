/// @description scrPlayerShoot()
/// Makes the player shoot a bullet

if (instance_number(objBullet) < 4) {
	//TODO: make the bullets spawn at a better height
    instance_create_layer(x,y,layer,objBullet);
    audio_play_sound(sndShoot,0,false);
}