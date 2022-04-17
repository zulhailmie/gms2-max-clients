/// @description  Connect to Server
randomize();
socket = network_create_socket(network_socket_tcp);
network_set_timeout(socket, 5000, 5000);
network_set_config(network_config_connect_timeout, 5000);
if socket < 0 { room_goto(r_menu); network_destroy(socket); network_destroy(server); instance_destroy(); }
ip = get_string("Enter the server address", "127.0.0.1"); // Specify the server IP address to connect to
port = get_string("Enter the server port number", "1337"); // Specify the server port number to connect to
server = network_connect(socket, ip, port); // Try connecting to the server
if server < 0 { room_goto(r_menu); network_destroy(socket); network_destroy(server); instance_destroy(); }

/// Create Px
instance_create(0, 0, o_px);

/// Variables
timer_disconnect = room_speed * 10;
color = 0;

