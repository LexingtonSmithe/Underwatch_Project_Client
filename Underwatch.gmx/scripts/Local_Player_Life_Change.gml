///Local_Player_Life_Change(LivingStatus);
var lifeStatus = argument[0]

buffer_seek(global.buffer, buffer_seek_start, 0);
buffer_write(global.buffer, buffer_u8, 10);
buffer_write(global.buffer, buffer_u32,  global.playerId);
buffer_write(global.buffer, buffer_u8, global.PlayerType);
buffer_write(global.buffer, buffer_u8,  lifeStatus);// 0 = Dead, 1 = Alive
SendPacket();
