///CreateExistingPlayers();



/*
Starting off the for loop at 1 instead of 0 as the local player is always held in position 0 of their respective grid
this way it should loop through everyone else that they player knows about 
*/

var Alive = 1;
for (var i = 1; i < ds_grid_height(global.PlayerGrid); i++) {
    
    if ds_grid_get(global.PlayerGrid, 4, i) == Alive {
    
        var pId = ds_grid_get(global.PlayerGrid, 0, i)
        var pName = ds_grid_get(global.PlayerGrid, 1, i)
        var pTeam = ds_grid_get(global.PlayerGrid, 2, i)
        var pType = ds_grid_get(global.PlayerGrid, 3, i)
        /* 
        arbitrary spawn point that doesnt matter as the first packet 
        we receive about this player will move the newly created player 
        to where they are supposed to be
        */
        var remotePlayer = instance_create(64, 64, oRemotePlayer); 
        remotePlayer.remotePlayerId = pId;
        remotePlayer.remotePlayerName = pName;
        remotePlayer.remotePlayerType = pType;
        remotePlayer.remotePlayerTeam = pTeam;
        var remoteGun = instance_create(64, 64, oRemoteGun);
        remoteGun.OwnerPID = pId;
        remoteGun.OwnerType = pType;
        remoteGun.OwnerTeam = pTeam;
    }
  
}
