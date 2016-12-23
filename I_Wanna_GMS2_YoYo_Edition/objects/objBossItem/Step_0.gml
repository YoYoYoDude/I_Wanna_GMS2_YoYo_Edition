/// @description Destroy self if this item was already obtained

if (global.bossItem[itemNum]) {
    instance_destroy();
}