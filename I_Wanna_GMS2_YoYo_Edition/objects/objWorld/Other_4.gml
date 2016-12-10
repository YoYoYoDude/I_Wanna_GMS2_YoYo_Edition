/// @description Make sure we're on the correct object layer

//TODO: objWorld layer check

if (layer_exists("World"))
{
	layer = layer_get_id("World");
	//layer = "World";
	//layer_add_instance(layer_get_id("World"),id);
}
else
{
	show_debug_message("World layer doesn't exist");
}