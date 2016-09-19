///Game_Found_Reciept(Level,Team)
var level = argument[0];
var team = argument[1];

buffer_seek(global.buffer, buffer_seek_start,0);
buffer_write(global.buffer, buffer_u8, 12);
buffer_write(global.buffer, buffer_u32, global.playerId);
buffer_write(global.buffer, buffer_u8, level);
buffer_write(global.buffer, buffer_u8, team);
SendPacket();
