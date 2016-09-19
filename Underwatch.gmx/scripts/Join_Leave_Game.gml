///Join_Leave_Game(StatusChange)
var StatusChange = argument[0];

buffer_seek(global.buffer, buffer_seek_start, 0);
buffer_write(global.buffer, buffer_u8, 11);
buffer_write(global.buffer, buffer_u32,  global.playerId);
buffer_write(global.buffer, buffer_u8,  StatusChange);
SendPacket();
