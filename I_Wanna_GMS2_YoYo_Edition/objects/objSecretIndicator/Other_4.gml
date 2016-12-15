/// @description Destroy self if this item has not been obtained

if (!global.secretItem[itemNum]) {
    instance_destroy();
}