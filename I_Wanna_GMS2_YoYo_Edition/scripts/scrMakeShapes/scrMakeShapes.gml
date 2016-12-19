/// @description scrMakeShapes(x,y,layer,angle,edges,numProjectiles,speed,obj)
/// Spawns a custom shape
/// argument0 - spawn X
/// argument1 - spawn Y
/// argument2 - spawn layer
/// argument3 - starting angle
/// argument4 - number of edges (3=triangle, 4=square, etc.)
/// argument5 - projectile spawns per edge
/// argument6 - speed
/// argument7 - projectile object to spawn

var spawnX = argument0;
var spawnY = argument1;
var spawnLayer = argument2;
var spawnAngle = argument3;
var spawnEdges = argument4;
var spawnNum = argument5;
var spawnSpeed = argument6;
var spawnObj = argument7;
var th, xx, yy, ddx, ddy, dx, dy, a;

th = degtorad(spawnAngle);

for (var i = 0; i < spawnEdges; i += 1) {
    xx[i] = cos(th + 2*pi * i/spawnEdges);
    yy[i] = sin(th + 2*pi * i/spawnEdges);
}

xx[spawnEdges] = xx[0];
yy[spawnEdges] = yy[0];

for (var i = 0; i < spawnEdges; i += 1) {
    ddx = xx[i+1]-xx[i];
    ddy = yy[i+1]-yy[i];
    
    for(var j = 0; j < spawnNum; j += 1) {
        dx = xx[i]+ddx*j/spawnNum;
        dy = yy[i]+ddy*j/spawnNum;
        
        a = instance_create_layer(spawnX+dx,spawnY+dy,spawnLayer,spawnObj);
        a.direction = point_direction(0,0,dx,dy);
        a.speed = spawnSpeed*point_distance(0,0,dx,dy);
    }
}