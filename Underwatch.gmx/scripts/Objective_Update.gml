///Objective_Update(Objective)

buffer_seek(global.buffer, buffer_seek_start,0);
buffer_write(global.buffer, buffer_u8, 15);
buffer_write(global.buffer, buffer_u32, global.playerId);
buffer_write(global.buffer, buffer_u8, global.Team);
SendPacket();
