/// @description  Networking - Connect
var network_type = ds_map_find_value(async_load, "type");
if network_type = network_type_connect
{
    var socket = ds_map_find_value(async_load, "socket");
    ds_list_add(list, socket);
    //clientpx_rx[socket].data = 0;
}

/// Networking - Disconnect
var network_type = ds_map_find_value(async_load, "type");
if network_type = network_type_disconnect
{
    var socket = ds_map_find_value(async_load, "socket");
    var list_position = ds_list_find_index(list, socket);
    //clientpx_rx[socket].data = -1;
    ds_list_delete(list, list_position); 
    network_destroy(socket);
}

/// Networking - Data (UNUSED. NOT RECEIVING ANY DATA FROM CLIENTS ON THIS DESIGN).
var network_type = ds_map_find_value(async_load, "type");
if network_type = network_type_data
{
    var socket = ds_map_find_value(async_load, "id");
    var buffer = ds_map_find_value(async_load, "buffer");
    debug_receive++;
    debug_receive_size += buffer_get_size(buffer);
    buffer_seek(buffer, buffer_seek_start, 0);
    var buffer_id = buffer_read(buffer, buffer_string);
    switch(buffer_id)
    {
        case "STATUS_FROM_CLIENT": 
        {
            // clientpx_rx[socket].data = buffer_read(buffer, buffer_u8);
        }
        break;
    }
}

