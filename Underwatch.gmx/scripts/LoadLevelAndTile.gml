///LoadLevelAndTile(LEVEL)

LEVEL = argument[0];
// Set the grid width and height
var width = room_width div CELL_WIDTH;
var height = room_height div CELL_HEIGHT;

// Create the grid
globalvar(grid) = ds_grid_create(width, height);

// Read the approprite file
ini_open(LEVEL + ".ini");
l_string = ini_read_string("Level", "Layout", 1);   
ini_close();

// Import the grid
ds_grid_read(grid, l_string);

// Add the walls
for (var yy = 1; yy < height-1; yy++) {
    for (var xx = 1; xx < width-1; xx++) {
        if (grid[# xx, yy] == FLOOR) {
            // Check for walls
            if (grid[# xx+1, yy] != FLOOR) grid[# xx+1, yy] = WALL;
            if (grid[# xx-1, yy] != FLOOR) grid[# xx-1, yy] = WALL;
            if (grid[# xx, yy+1] != FLOOR) grid[# xx, yy+1] = WALL;
            if (grid[# xx, yy-1] != FLOOR) grid[# xx, yy-1] = WALL;
        }
    }
}

// Draw the level using the grid
for (var yy = 0; yy < height; yy++) {
    for (var xx = 0; xx < width; xx++) {
        if (grid[# xx, yy] == FLOOR) {
            // Draw the floor
            tile_add(bg_floor, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT, 0)
        }
    }
}


// Get tile sizes
var tw = CELL_WIDTH/2;
var th = CELL_HEIGHT/2;

// Add the tiles
for (var yy = 0; yy < height*2; yy++) {
    for (var xx = 0; xx < width*2; xx++) {
        if (grid[# xx div 2, yy div 2] == FLOOR) {
            // Get the tile's x and y
            var tx = xx*tw;
            var ty = yy*th;
            
            var right = grid[# (xx+1) div 2, yy div 2] != FLOOR;
            var left = grid[# (xx-1) div 2, yy div 2] != FLOOR;
            var top = grid[# xx div 2, (yy-1) div 2] != FLOOR;
            var bottom = grid[# xx div 2, (yy+1) div 2] != FLOOR;
            
            var top_right = grid[# (xx+1) div 2, (yy-1) div 2] != FLOOR;
            var top_left = grid[# (xx-1) div 2, (yy-1) div 2] != FLOOR;
            var bottom_right = grid[# (xx+1) div 2, (yy+1) div 2] != FLOOR;
            var bottom_left = grid[# (xx-1) div 2, (yy+1) div 2] != FLOOR;
            
            if (right) {
                if (bottom) {
                    tile_add(bg_walltiles, tw*4, th*1, tw, th, tx+tw, ty, -ty);
                } else if (top) {
                    if (top_right) {
                        tile_add(bg_walltiles, tw*4, th*0, tw, th, tx+tw, ty-th, -ty);
                    } else {
                        tile_add(bg_walltiles, tw*3, th*0, tw, th, tx, ty-th, -ty);
                    }
                    tile_add(bg_walltiles, tw*0, th*1, tw, th, tx+tw, ty, -ty);
                } else {
                    tile_add(bg_walltiles, tw*0, th*1, tw, th, tx+tw, ty, -ty);
                }
            }
            
            if (left) {
                if (bottom) {
                    tile_add(bg_walltiles, tw*3, th*1, tw, th, tx-tw, ty, -ty);
                } else if (top) {
                    if (top_left) {
                        tile_add(bg_walltiles, tw*3, th*0, tw, th, tx-tw, ty-th, -ty);
                    } else {
                        tile_add(bg_walltiles, tw*4, th*0, tw, th, tx, ty-th, -ty);
                    }
                    tile_add(bg_walltiles, tw*2, th*1, tw, th, tx-tw, ty, -ty);
                } else {
                    tile_add(bg_walltiles, tw*2, th*1, tw, th, tx-tw, ty, -ty);
                }
            }
            
            if (top) {
                if (!top_right) {
                    tile_add(bg_walltiles, tw*2, th*2, tw, th, tx, ty-th, -ty);
                } else if (!top_left) {
                    tile_add(bg_walltiles, tw*0, th*2, tw, th, tx, ty-th, -ty);
                } else {
                    tile_add(bg_walltiles, tw*1, th*2, tw, th, tx, ty-th, -ty);
                }
            }
            
            if (bottom) {
                if (!bottom_right) {
                    tile_add(bg_walltiles, tw*2, th*0, tw, th, tx, ty, -ty-tw);
                } else if (!bottom_left) {
                    tile_add(bg_walltiles, tw*0, th*0, tw, th, tx, ty, -ty-tw);
                } else {
                    tile_add(bg_walltiles, tw*1, th*0, tw, th, tx, ty, -ty-tw);
                }
            }
        }
    }
}
