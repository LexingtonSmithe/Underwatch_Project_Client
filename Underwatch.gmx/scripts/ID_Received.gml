var buffer = argument[0];

global.playerId = buffer_read(buffer, buffer_u32)

//update the player grid
ds_grid_set(global.PlayerGrid,0,0,global.playerId);

ShowNotification("Our player ID has been received!");
