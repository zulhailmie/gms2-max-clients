/// @description  Send Buffer - STATUS_FROM_SERVER
//alarm[0] = 1//room_speed * 1;
//if color = -1 { color = 1; }
if color != -1
{
    color++;
}
if color > 255 { color = 0; }
clientpx_tx.data = color;

var buffer_size = 128;
var buffer_type = buffer_fixed;
var buffer_align = 1;
var buffer = buffer_create(buffer_size, buffer_type, buffer_align);
var buffer_id = "STATUS_FROM_SERVER";

buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_string, buffer_id);

for (var i = 1; i <= max_clients; i++;)
{
    buffer_write(buffer, buffer_u8, color);
}

// Send Buffer
for (var n = 0; n < ds_list_size(list); n++;)
{
    network_send_packet(ds_list_find_value(list, n), buffer, buffer_get_size(buffer));
    debug_send++;
    debug_send_size += buffer_get_size(buffer);
}

