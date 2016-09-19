///HandleIncomingPackets(buffer, socket)

var buffer = argument[0];
var messageID = buffer_read(buffer, buffer_u8);

switch (messageID) {

    case 1: //latency request
        Latency_Update(buffer);
    break;
    
    case 2: // Registration attempt 
        Registration(buffer);
    break;
    
    case 3: // Login Attempt
        Logon(buffer);
    break;
    
    case 4: // Recieve our player ID from the server
        ID_Received(buffer);
    break;
    
    case 5: // Someone left the server this is who it is 
        Player_Left(buffer);
    break;
    
    case 6: // When someone joins the game store the information about them in the grid to be used later
        Player_Joined(buffer);        
    break;
    
    case 7: // All of the other players stats
        Remote_Player_Movement(buffer);    
    break;
    
    case 8: // All of the other GUNS stats
        Remote_Gun_Movement(buffer); 
    break;
    
    case 9: // Someone has shot a bullet, this is the info about that bullet
        Bullet_Creation(buffer);
        
    break;
    
    case 10: // Someone has died or come back to life either create the player if they live or get rid of them if they died
        Remote_Player_Life_Change(buffer);        
    break;
    
    /*
        CASE 11 is a player leaving the game however this is already handled by CASE 5
        decided not to double up for what is (from the client perspective) the same request
    */
        
    case 12: // An instance has been found for us to play...
        Game_Found(buffer);
    break;
    
    case 13: // Non bullet item has been created
        Item_Creation(buffer);        
    break;
    case 14:
        Game_Time(buffer);
    break;

    default:
        show_debug_message("No Recognisable Packet Type Was Sent To HandleIncomingPackets")
    break;      
}
