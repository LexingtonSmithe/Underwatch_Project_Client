//update latency every couple of seconds
buffer_seek(global.buffer, buffer_seek_start,0);
buffer_write(global.buffer, buffer_u8, 1);
buffer_write(global.buffer, buffer_u32, current_time);
SendPacket();

