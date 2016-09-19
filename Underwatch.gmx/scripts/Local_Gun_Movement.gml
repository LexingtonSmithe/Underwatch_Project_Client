///Local_Gun_Movement(xx,yy,imageAngle,Depth,imageIndex,YScale)
var xx = argument[0]
var yy = argument[1]
var imageAngle = argument[2]
var Depth = argument[3]
var imageIndex = argument[4]
var YScale = argument[5]


buffer_seek(global.buffer, buffer_seek_start,0);
buffer_write(global.buffer, buffer_u8, 8);
buffer_write(global.buffer, buffer_u32, global.playerId);
buffer_write(global.buffer, buffer_f32, xx);
buffer_write(global.buffer, buffer_f32, yy);
buffer_write(global.buffer, buffer_f32, imageAngle);
buffer_write(global.buffer, buffer_f32, Depth);
buffer_write(global.buffer, buffer_u8, imageIndex);
buffer_write(global.buffer, buffer_u8, YScale);
SendPacket();
