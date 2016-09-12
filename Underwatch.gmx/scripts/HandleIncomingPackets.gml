///HandleIncomingPackets(buffer, socket)

var buffer = argument[0];
var messageID = buffer_read(buffer, buffer_u8);

switch (messageID) {

    case 1: //latency request
        var time = buffer_read(buffer, buffer_u32);
        global.latency = current_time - time;
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

        //update the player grid
        ds_grid_set(global.PlayerGrid,0,0,global.playerId);
        
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
        var pTeam = buffer_read(buffer, buffer_u8);
        var pName = buffer_read(buffer, buffer_string);
        var instance = noone;
        
        // add them to the list of players in game with us as well as any other pertinant information to be called later
        ds_grid_resize(global.PlayerGrid,ds_grid_width(global.PlayerGrid),ds_grid_height(global.PlayerGrid) + 1);
        
        ds_grid_set(global.PlayerGrid, 0, ds_grid_height(global.PlayerGrid) -1 , pId) // 0,1 
        ds_grid_set(global.PlayerGrid, 1, ds_grid_height(global.PlayerGrid) -1, pName) // 1,1
        ds_grid_set(global.PlayerGrid, 2, ds_grid_height(global.PlayerGrid) -1, pTeam) // 2,1
        ds_grid_set(global.PlayerGrid, 3, ds_grid_height(global.PlayerGrid) -1, pType) // 3,1
        ds_grid_set(global.PlayerGrid, 4, ds_grid_height(global.PlayerGrid) -1, 1) // Alive // 4,1
        
        //   0 , 1,     2, 3
        // 0 1, "Dave", 1, 1
        // 1 5, "Ken",  1, 1 
        
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
                remotePlayer.remotePlayerTeam = pTeam;
                var remoteGun = instance_create(room_width/2, room_height/2, oRemoteGun);
                remoteGun.OwnerPID = pId;
                remoteGun.OwnerType = pType;
                remoteGun.OwnerTeam = pTeam;
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
    var Depth = buffer_read(buffer, buffer_f32);
    var imageIndex = buffer_read(buffer, buffer_u8);
    var YScale = buffer_read(buffer, buffer_u8);
    
    with(oRemoteGun) {
        if OwnerPID == pId {
            x = gx;
            y = gy;
            image_angle = Angle;
            image_index = imageIndex;
            depth = Depth
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
        //only in a game room
        if room != rm_PlayerSelect {
            //Do action
            var Boop = instance_create(bx, by, BulletToMake);
            Boop.image_angle = BAngle;
            Boop.speed = BSpeed;
            Boop.direction = Boop.image_angle;
            Boop.Owner = BulletID;
            Bang = instance_create(bx, by, MuzzleToMake);
            Bang.image_angle = BAngle;
        }
        
    break;
    
    case 10: // someone has died or come back to life either create the player if they live or get rid of them if they died
        var pId = buffer_read(buffer, buffer_u32);
        var pType = buffer_read(buffer, buffer_u8);
        var pTeam = buffer_read(buffer, buffer_u8);
        var LivingStatus = buffer_read(buffer, buffer_u8);
        var pName = buffer_read(buffer, buffer_string);
        
        if (ds_grid_value_exists(global.PlayerGrid,0,0,0, ds_grid_height(global.PlayerGrid), pId)) { //update the grid where the information about that player is held locally
            var playerRow = ds_grid_value_y(global.PlayerGrid,0,0,0,ds_grid_height(global.PlayerGrid)-1,pId);
            ds_grid_set(global.PlayerGrid, 3, playerRow, pType)
            ds_grid_set(global.PlayerGrid, 4, playerRow, LivingStatus)
        }
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
                remotePlayer.remotePlayerTeam = pTeam;
                var remoteGun = instance_create(room_width/2, room_height/2, oRemoteGun);
                remoteGun.OwnerPID = pId;
                remoteGun.OwnerType = pType;
                remoteGun.OwnerTeam = pTeam;
            }
            
            
            break;
        }
        
    break;
    
    case 11: //someone left the game delete that player
        var pId = buffer_read(buffer, buffer_u32);
        
        if (ds_grid_value_exists(global.PlayerGrid,0,0,0, ds_grid_height(global.PlayerGrid), pId)) {
            var playerRow = ds_grid_value_y(global.PlayerGrid,0,0,0,ds_grid_height(global.PlayerGrid)-1,pId);
            ds_grid_set(global.PlayerGrid, 0, playerRow, 0)
            ds_grid_set(global.PlayerGrid, 1, playerRow, 0)
            ds_grid_set(global.PlayerGrid, 2, playerRow, 0)
            ds_grid_set(global.PlayerGrid, 3, playerRow, 0)
            ds_grid_set(global.PlayerGrid, 4, playerRow, 0)
        }
        
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
        var Team = buffer_read(buffer, buffer_u8);

        global.Team = Team
        
        ds_grid_set(global.PlayerGrid, 2, 0, Team)
        
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
        buffer_write(global.buffer, buffer_u8, Team);
        network_send_packet(oController.socket, global.buffer, buffer_tell(global.buffer));
    break;      
}
