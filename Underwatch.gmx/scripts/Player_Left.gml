var buffer = argument[0];

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
