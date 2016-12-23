/// @description Follow the player

if (instance_exists(objPlayer)) {
    x += (objPlayer.x - x) / snapDiv;
    y += (objPlayer.y - y) / snapDiv;
}