/// @description  Alpha 1
image_alpha = 1;

/// Create Object
__view_set( e__VW.WPort, 0, 32 );
__view_set( e__VW.HPort, 0, 32 );
__view_set( e__VW.WView, 0, 32 );
__view_set( e__VW.HView, 0, 32 );
room_width = 32;
room_height = 32;

var count = get_integer("How many clients to connect to the server", "1");

instance_create(0,0,o_client);

for (var i = 0; i < count-1; i++)
{
	instance_create(0,0,o_client_bypass_dialog);
}

instance_destroy(o_bserver);
instance_destroy(o_bclient);

