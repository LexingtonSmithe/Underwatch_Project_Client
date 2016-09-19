///Login_Attempt(playerUsername,playerPasswordHash,LoggedInChange)

var playerUsername = argument[0]
var playerPasswordHash = argument[1]
var LoggedInChange = argument[2]


buffer_seek(global.buffer, buffer_seek_start, 0);
buffer_write(global.buffer, buffer_u8, 3);
buffer_write(global.buffer, buffer_u32,  global.playerId);
buffer_write(global.buffer, buffer_string, playerUsername);
buffer_write(global.buffer, buffer_string, playerPasswordHash);
buffer_write(global.buffer, buffer_u8, LoggedInChange);
SendPacket();
