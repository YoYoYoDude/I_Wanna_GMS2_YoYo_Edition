/// @description scrPlayerShoot()
/// Makes the player shoot a bullet

if (instance_number(objBullet) < 4) {
    instance_create_layer(x,y-(global.grav*2),layer,objBullet);
    audio_play_sound(sndShoot,0,false);
}