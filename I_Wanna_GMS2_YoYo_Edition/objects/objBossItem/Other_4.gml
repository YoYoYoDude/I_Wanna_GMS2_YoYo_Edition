/// @description Destroy self if this item was already obtained

//TODO: should this be moved to the step event?

if (global.bossItem[itemNum]) {
    instance_destroy();
}