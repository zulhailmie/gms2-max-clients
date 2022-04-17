/// @description  Create Server
randomize();
socket_type = network_socket_tcp;
network_set_timeout(socket_type, 5000, 5000);
network_set_config(network_config_connect_timeout, 5000);
if socket_type < 0 { show_message("Unable to create socket."); room_goto(r_menu); network_destroy(socket_type); network_destroy(server); instance_destroy(); };
var port = get_integer("Set the port number of the server", 1337);
max_clients = get_integer("Set the max connection to this server", 200); // Results will not display if client exceeds 200.
server = network_create_server(socket_type, port, max_clients);

if server < 0 { show_message("Unable to connect to the server."); room_goto(r_menu); network_destroy(socket_type); network_destroy(server); instance_destroy(); };
else { show_message("Successfully hosted a server."); }

instance_create(x, y, o_draw);
clientpx_tx = instance_create(0, 96, o_px);

/// Variables
// Client Data
for (var i = 0; i <= max_clients; i++;)
{
    debug[i] = "No Data";
}
color = 0; //-1 disable, 0 enable
list = ds_list_create();
alarm[0] = room_speed * 1;
debug_send = 0;
debug_receive = 0;
debug_send_size = 0;
debug_receive_size = 0;
