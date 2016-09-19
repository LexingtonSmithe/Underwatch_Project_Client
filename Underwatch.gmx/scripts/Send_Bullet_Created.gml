///Send_Bullet_Created(xx,yy,imageAngle,BulletSpeed)
var bxx = argument[0];
var byy = argument[1];
var imageAngle = argument[2];
var Speed = argument[3];

buffer_seek(global.buffer, buffer_seek_start,0);
buffer_write(global.buffer, buffer_u8, 9);
buffer_write(global.buffer, buffer_u32, global.playerId);
buffer_write(global.buffer, buffer_u8, global.PlayerType);
buffer_write(global.buffer, buffer_f32, bxx);
buffer_write(global.buffer, buffer_f32, byy);
buffer_write(global.buffer, buffer_f32, imageAngle);
buffer_write(global.buffer, buffer_f32, Speed);
SendPacket() 
