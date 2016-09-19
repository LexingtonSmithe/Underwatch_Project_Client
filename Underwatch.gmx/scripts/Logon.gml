var buffer = argument[0];

var response = buffer_read(buffer, buffer_u8);
switch (response){
    case 0: // failure
        ShowNotification("Login failed!#Username doesn't exist or password incorrect!");
    break;
    case 1: //success
        LoggedIn = true
        room_goto(rm_Lobby);
    break;
}
