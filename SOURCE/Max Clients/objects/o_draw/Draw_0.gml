//draw_set_font(f_orator);
draw_set_color(c_black);

str1 = "[FPS]: " + string(fps) + " / " + string(fps_real);
draw_text_transformed(0, 0, string_hash_to_newline(string(str1)), 1, 1, 0);

var size = ds_list_size(o_server.list)
str2 = "[SERVER SIZE]: " + string(size) + " / " + string(o_server.max_clients);
draw_text_transformed(0, 32, string_hash_to_newline(string(str2)), 1, 1, 0);

str3 = "[BUFFER SEND] " + string(o_server.debug_send) + " : " + string(o_server.debug_send_size) + " bytes";
draw_text_transformed(0, 64, string_hash_to_newline(string(str3)), 1, 1, 0);

str4 = "[BUFFER RECEIVE] " + string(o_server.debug_receive) + " : " + string(o_server.debug_receive_size) + " bytes";
draw_text_transformed(x, 128, string_hash_to_newline(string(str4)), 1, 1, 0);

