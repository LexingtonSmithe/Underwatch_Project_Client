var buffer = argument[0];

var pId = buffer_read(buffer, buffer_u32);
var pType = buffer_read(buffer, buffer_u8);
var xx = buffer_read(buffer, buffer_f32);
var yy = buffer_read(buffer, buffer_f32);
var dir = buffer_read(buffer, buffer_f32);

switch(pType) {
    case 4: //GENERICO'S MINI GUN SHELL CASINGS
        var casing = instance_create(xx,yy,oShellCasing);
        casing.direction = dir;
        casing.Owner = pId
    break;
    
    default:
        show_debug_message("No Recognisable Player Type Was Sent In Case 13 Of HandleIncomingPackets")
    break;
}
