var buffer = argument[0];

var pId = buffer_read(buffer, buffer_u32);
var pType = buffer_read(buffer, buffer_u8);
var pTeam = buffer_read(buffer, buffer_u8);
var LivingStatus = buffer_read(buffer, buffer_u8);
var pName = buffer_read(buffer, buffer_string);
var instance = noone;
var xx = 128;
var yy = 128;
if (ds_grid_value_exists(global.PlayerGrid,0,0,0, ds_grid_height(global.PlayerGrid), pId)) { //update the grid where the information about that player is held locally
    var playerRow = ds_grid_value_y(global.PlayerGrid,0,0,0,ds_grid_height(global.PlayerGrid)-1,pId);
    ds_grid_set(global.PlayerGrid, 3, playerRow, pType)
    ds_grid_set(global.PlayerGrid, 4, playerRow, LivingStatus)
}
switch(LivingStatus) {
    case 0: // Dead
        
        with(oRemotePlayer) { //destroy the player who died
            if remotePlayerId == pId {
                xx = x;
                yy = y;
                switch(pType) { // leave a pile of gibs
                    case 1:
                        var body = instance_create(xx,yy,oKrang_Corpse);
                    break;
                }
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

with (oRemotePlayer) {
    if (remotePlayerId == pId) {
        instance = id;
    }
}

if (instance == noone) {
    //only in the gameworld
    if instance_exists(oPlayerSpawn){
        //create a remote player
        var remotePlayer = instance_create(64, 64, oRemotePlayer); // arbitrary spawn point as CASE 6 will update location next frame
        remotePlayer.remotePlayerId = pId;
        remotePlayer.remotePlayerName = pName;
        remotePlayer.remotePlayerType = pType;
        remotePlayer.remotePlayerTeam = pTeam;
        var remoteGun = instance_create(64, 64, oRemoteGun); // arbitrary spawn point as CASE 7 will update location next frame
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
}
