var buffer = argument[0];

var response = buffer_read(buffer, buffer_u8);
switch(response) {
    case 0: //failure
        ShowNotification("Registragion failed!#Username already exists!");
    break;
    
    case 1: //success
        room_goto(rm_Lobby);
    break;
} 
