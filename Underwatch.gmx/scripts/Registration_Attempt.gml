///Registration_Attempt(playerUsername,playerPasswordHash)
var playerUsername = argument[0];
var playerPasswordHash = argument[1];

buffer_seek(global.buffer, buffer_seek_start, 0);
buffer_write(global.buffer, buffer_u8, 2);
buffer_write(global.buffer, buffer_string, playerUsername);
buffer_write(global.buffer, buffer_string, playerPasswordHash);
SendPacket();
