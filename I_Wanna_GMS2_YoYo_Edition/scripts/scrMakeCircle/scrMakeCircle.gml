/// @description scrMakeCircle(x,y,layer,angle,numProjectiles,speed,obj)
/// Spawns a ring of projectiles 
/// argument0 - spawn X
/// argument1 - spawn Y
/// argument2 - spawn layer
/// argument3 - starting angle
/// argument4 - number of projectiles to spawn
/// argument5 - speed
/// argument6 - projectile object to spawn

var spawnX = argument0;
var spawnY = argument1;
var spawnLayer = argument2
var spawnAngle = argument3;
var spawnNum = argument4;
var spawnSpeed = argument5;
var spawnObj = argument6;
var a;

for (var i = 0; i < spawnNum; i += 1) {
    a = instance_create_layer(spawnX,spawnY,spawnLayer,spawnObj);
    a.speed = spawnSpeed;
    a.direction = spawnAngle + i * (360 / spawnNum);
}