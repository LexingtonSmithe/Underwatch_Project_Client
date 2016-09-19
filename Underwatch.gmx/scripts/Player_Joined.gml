var buffer = argument[0];

var pId = buffer_read(buffer, buffer_u32);
var pType = buffer_read(buffer, buffer_u8);
var pTeam = buffer_read(buffer, buffer_u8);
var pName = buffer_read(buffer, buffer_string);


// add them to the list of players in game with us as well as any other pertinant information to be called later
ds_grid_resize(global.PlayerGrid,ds_grid_width(global.PlayerGrid),ds_grid_height(global.PlayerGrid) + 1);

ds_grid_set(global.PlayerGrid, 0, ds_grid_height(global.PlayerGrid) -1 , pId) // 0,1 
ds_grid_set(global.PlayerGrid, 1, ds_grid_height(global.PlayerGrid) -1, pName) // 1,1
ds_grid_set(global.PlayerGrid, 2, ds_grid_height(global.PlayerGrid) -1, pTeam) // 2,1
ds_grid_set(global.PlayerGrid, 3, ds_grid_height(global.PlayerGrid) -1, pType) // 3,1
ds_grid_set(global.PlayerGrid, 4, ds_grid_height(global.PlayerGrid) -1, 0) // Dead // 4,1

//   0 , 1,     2, 3
// 0 1, "Dave", 1, 0
// 1 5, "Ken",  1, 0 
