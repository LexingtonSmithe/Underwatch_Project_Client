///Send_Item_Created(xx,yy,Dir)
var ix = argument[0]
var iy = argument[1]
var iDir = argument[2]

buffer_seek(global.buffer, buffer_seek_start,0);
buffer_write(global.buffer, buffer_u8, 13); // A non damaging item
buffer_write(global.buffer, buffer_u32, global.playerId);
buffer_write(global.buffer, buffer_u8, global.PlayerType);
buffer_write(global.buffer, buffer_f32, ix);
buffer_write(global.buffer, buffer_f32, iy);
buffer_write(global.buffer, buffer_f32, iDir);
SendPacket()
