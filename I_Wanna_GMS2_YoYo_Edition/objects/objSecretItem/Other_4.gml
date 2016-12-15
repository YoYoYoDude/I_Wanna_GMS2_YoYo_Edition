/// @description Destroy self if this item was already obtained

if (global.secretItem[itemNum]) {
    instance_destroy();
}