var buffer = argument[0];

var time = buffer_read(buffer, buffer_u32);
global.latency = current_time - time;
