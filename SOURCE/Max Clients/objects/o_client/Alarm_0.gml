/// @description  Server Timeout
show_message("Disconnected - Connection timeout.");
network_destroy(server);
network_destroy(socket);
instance_destroy();
room_goto(r_menu);

