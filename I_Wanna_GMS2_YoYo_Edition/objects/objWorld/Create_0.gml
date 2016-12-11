/// @description Make sure there's never more than one world object

if (instance_number(object_index) > 1)
    instance_destroy();