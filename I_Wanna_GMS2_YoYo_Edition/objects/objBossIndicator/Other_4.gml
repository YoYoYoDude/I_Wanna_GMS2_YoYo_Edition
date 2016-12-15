/// @description Destroy self if this item has not been obtained

if (!global.bossItem[itemNum]) {
    instance_destroy();
}