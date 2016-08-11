///HandleIncomingPackets(buffer, socket)

var buffer = argument[0];
var messageID = buffer_read(buffer, buffer_u8);

switch (messageID) {

    case 1: //latency request
        var time = buffer_read(buffer, buffer_u32);
        latency = current_time - time;
    break;
    
    case 2: // Registration attempt 
        var response = buffer_read(buffer, buffer_u8);
        switch(response) {
            case 0: //failure
                ShowNotification("Registragion failed!#Username already exists!");
            break;
            
            case 1: //success
                room_goto(rm_Lobby);
            break;
        }        
    break;
    
    case 3: //Login Attempt
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
    break;
    
    case 4: // recieve our player ID from the server
    
        global.playerId = buffer_read(buffer, buffer_u32)
        
        ShowNotification("Our player ID has been received!");
    break;
    
    case 5: // someone left the server this is who it is 

     var pId = buffer_read(buffer, buffer_u32);
     with(oRemotePlayer) {
     // destroy the player who has left
        if (remotePlayerId == pId) {
            instance_destroy();
        }
     }
     with(oRemoteGun) {
     // destroy the gun of the player who has left
        if (OwnerPID == pId) {
            instance_destroy();
        }
     }
    break;
    
    case 6: // when someone joins the game create a remote player and give it the appropriate ID's
        var pId = buffer_read(buffer, buffer_u32);
        var pType = buffer_read(buffer, buffer_u8);
        var pName = buffer_read(buffer, buffer_string);
        var instance = noone;
        
        with (oRemotePlayer) {
            if (remotePlayerId == pId) {
                instance = id;
            }
        }
        
        if (instance == noone) {
            //only in the gameworld
            if instance_exists(oLocalPlayer){
                //create a remote player
                var remotePlayer = instance_create(room_width/2, room_height/2, oRemotePlayer);
                remotePlayer.remotePlayerId = pId;
                remotePlayer.remotePlayerName = pName;
                remotePlayer.remotePlayerType = pType;
                var remoteGun = instance_create(room_width/2, room_height/2, oRemoteGun);
                remoteGun.OwnerPID = pId;
                remoteGun.OwnerType = pType;
            } else {
                with(instance) {
                    instance_destroy()
                }
            } 
        }
        
    break;
    
    case 7: // all of the other players stats
    var pId = buffer_read(buffer, buffer_u32);
    var xx = buffer_read(buffer, buffer_f32);
    var yy = buffer_read(buffer, buffer_f32);
    var imageIndex = buffer_read(buffer, buffer_u8);
    var spriteNumber = buffer_read(buffer, buffer_u8);
    var XScale = buffer_read(buffer, buffer_u8);
    var Shot = buffer_read(buffer, buffer_u8);
    var Health = buffer_read(buffer, buffer_u8);
    var MaxHealth = buffer_read(buffer, buffer_u8);    
    
    with(oRemotePlayer) {
        if remotePlayerId == pId {
            x = xx;
            y = yy;
            HP = Health;
            MaxHP = MaxHealth;
            
            // Change the sprite
            Sprite = spriteNumber;
            
            //make sure its the correct index
            image_index = imageIndex;
            
            //face the same way
            switch(XScale) {
                case 1:
                    image_xscale = 1;
                break;
                
                case 2:
                    image_xscale = -1;
                break;
            }
            //and if we are shot display he health bar
            switch(Shot) {
                case 0:
                    DrawHealth = false;
                break;
                
                case 1:
                    DrawHealth = true;
                break;
            }
        }
    }
    
    break;
    
    case 8: // all of the other GUNS stats
    var pId = buffer_read(buffer, buffer_u32);
    var gx = buffer_read(buffer, buffer_f32);
    var gy = buffer_read(buffer, buffer_f32);
    var Angle = buffer_read(buffer, buffer_f32);
    var YScale = buffer_read(buffer, buffer_u8);
    
    with(oRemoteGun) {
        if OwnerPID == pId {
            x = gx;
            y = gy;
            image_angle = Angle;
            switch(YScale) {
                case 1:
                    image_yscale = 1;
                break;
                
                case 2:
                    image_yscale = -1;
                break;
            }
        }
    }
    
    break;
    
    case 9: // someone has shot a bullet, this is the info about that bullet
        var BulletID = buffer_read(buffer, buffer_u32);
        var bType = buffer_read(buffer, buffer_u8);
        var bx = buffer_read(buffer, buffer_f32);
        var by = buffer_read(buffer, buffer_f32);
        var BAngle = buffer_read(buffer, buffer_f32);
        var BSpeed = buffer_read(buffer, buffer_f32);

        switch(bType) {
            case 1:
                var BulletToMake = oLightning;
                var MuzzleToMake = oGauntletMuzzle;
            break;
            
            case 2:
                var BulletToMake = oBlob;
                var MuzzleToMake = oMuzzle;
            break
        }
        
        //Do action
        var Boop = instance_create(bx, by, BulletToMake);
        Boop.image_angle = BAngle;
        Boop.speed = BSpeed;
        Boop.direction = Boop.image_angle;
        Boop.Owner = BulletID;
        Bang = instance_create(bx, by, MuzzleToMake);
        Bang.image_angle = BAngle;
        
    break;
    
    case 10: // someone has died or come back to life either create the player if they live or get rid of them if they died
        var pId = buffer_read(buffer, buffer_u32);
        var pType = buffer_read(buffer, buffer_u8);
        var LivingStatus = buffer_read(buffer, buffer_u8);
        var pName = buffer_read(buffer, buffer_string);

        switch(LivingStatus) {
            case 0: // Dead
                with(oRemotePlayer) { //destroy the player who died
                    if remotePlayerId == pId {
                        instance_destroy()
                    }
                }
                with(oRemoteGun) { // destroy that players gun
                    if OwnerPID == pId {
                        instance_destroy()
                    }
                }
                
            break;
            
            case 1: // Alive
            if instance_exists(oLocalPlayer){
                //create a remote player
                var remotePlayer = instance_create(room_width/2, room_height/2, oRemotePlayer);
                remotePlayer.remotePlayerId = pId;
                remotePlayer.remotePlayerName = pName;
                var remoteGun = instance_create(room_width/2, room_height/2, oRemoteGun);
                remoteGun.OwnerPID = pId;
                remoteGun.OwnerType = pType;
            }
            
            
            break;
        }
        
    break;
    
    case 11: //someone left the game delete that player
        var pId = buffer_read(buffer, buffer_u32);
        
             with(oRemotePlayer) {
             // destroy the player who has left
                if (remotePlayerId == pId) {
                    instance_destroy();
                }
             }
             with(oRemoteGun) {
             // destroy the gun of the player who has left
                if (OwnerPID == pId) {
                    instance_destroy();
                }
             }
             with(oLaserPellet) {
             // destroy the gun of the player who has left
                if (Owner == pId) {
                    instance_destroy();
                }
             }
    break;        
    
    case 12: // an instance has been found for us to play...
        var Level = buffer_read(buffer, buffer_u8); // find out what room it is and take us to the...
        switch(Level) {
            case 0: // Sewers
            
            global.Level = (rm_One)
            
            break;
            
            case 1: // Dojo
            
            global.Level = (rm_Two)
                        
            break;
            
        }
        //go to the player select screen
        room_goto(rm_PlayerSelect);
        
       // Acknoledge receipt of this instruction by repeating it back to the Server
        buffer_seek(global.buffer, buffer_seek_start,0);
        buffer_write(global.buffer, buffer_u8, 12);
        buffer_write(global.buffer, buffer_u32, global.playerId);
        buffer_write(global.buffer, buffer_u8, Level);
        network_send_packet(oController.socket, global.buffer, buffer_tell(global.buffer));
    break;      
}
