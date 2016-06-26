///HandleIncomingPackets(buffer, socket)

var buffer = argument[0];
var messageID = buffer_read(buffer, buffer_u8);

switch (messageID) {
    case 1: //latency request
     var time = buffer_read(buffer, buffer_u32);
     latency = current_time - time;
    break;
    
}
