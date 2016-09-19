///Local_Player_Movement(xx,yy,imageIndex,spriteNumber,XScale,Shot,HP,MaxHP)
var xx = argument[0]
var yy = argument[1]
var imageIndex = argument[2]
var spriteNumber = argument[3]
var XScale = argument[4]
var Shot = argument[5]
var HP = argument[6]
var MaxHP = argument[7]

buffer_seek(global.buffer, buffer_seek_start,0);
buffer_write(global.buffer, buffer_u8, 7);
buffer_write(global.buffer, buffer_u32, global.playerId);
buffer_write(global.buffer, buffer_f32, x);
buffer_write(global.buffer, buffer_f32, y);
buffer_write(global.buffer, buffer_u8, imageIndex);
buffer_write(global.buffer, buffer_u8, spriteNumber);
buffer_write(global.buffer, buffer_u8, XScale);
buffer_write(global.buffer, buffer_u8, Shot);
buffer_write(global.buffer, buffer_u8, HP);
buffer_write(global.buffer, buffer_u8, MaxHP);
SendPacket();
