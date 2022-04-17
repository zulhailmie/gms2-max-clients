/// @description  Networking - Data
var network_type = ds_map_find_value(async_load, "type");
if network_type = network_type_data
{
    var buffer = ds_map_find_value(async_load, "buffer");
    buffer_seek(buffer, buffer_seek_start, 0);
    var buffer_id = buffer_read(buffer, buffer_string);
    switch(buffer_id)
    {
        case "STATUS_FROM_SERVER":
        {
            var color = buffer_read(buffer, buffer_u8);
            o_px.data = color;
            /// Send Buffer - STATUS_SEND
            var buffer_size = 128;
            var buffer_type = buffer_fixed;
            var buffer_align = 1;
            var buffer2 = buffer_create(buffer_size, buffer_type, buffer_align);
            var buffer_id = "STATUS_FROM_CLIENT";
            
            buffer_seek(buffer2, buffer_seek_start, 0);
            buffer_write(buffer2, buffer_string, buffer_id);
            buffer_write(buffer2, buffer_u8, color);
            
            network_send_packet(socket, buffer2, buffer_get_size(buffer2));
        }
        break;
    }
}

