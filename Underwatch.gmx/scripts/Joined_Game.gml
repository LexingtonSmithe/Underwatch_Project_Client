buffer_seek(global.buffer, buffer_seek_start, 0);
buffer_write(global.buffer, buffer_u8, 6);
buffer_write(global.buffer, buffer_u32,  global.playerId);
buffer_write(global.buffer, buffer_u8,  global.PlayerType);
SendPacket();
