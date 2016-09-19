///Game_Time(buffer)
var buffer = argument[0];

var minutes = buffer_read(buffer, buffer_u8);
var seconds = buffer_read(buffer, buffer_u8);

global.Minutes = minutes;
global.Seconds = seconds;
