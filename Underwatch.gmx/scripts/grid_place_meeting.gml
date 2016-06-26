///grid_place_meeting(x, y)

var xx = argument[0];
var yy = argument[1];

// Remember our position

var xp = x;
var yp = y;

// Update the position for the BBox calculations
x = xx;
y = yy;

// Check for an X meeting
var x_meeting = (oLevel.grid[# bbox_right div CELL_WIDTH, bbox_top div CELL_HEIGHT] != FLOOR) or 
                (oLevel.grid[# bbox_left div CELL_WIDTH, bbox_top div CELL_HEIGHT] != FLOOR);

// Check for a Y meeting
var y_meeting = (oLevel.grid[# bbox_right div CELL_WIDTH, bbox_bottom div CELL_HEIGHT] != FLOOR) or 
                (oLevel.grid[# bbox_left div CELL_WIDTH, bbox_bottom div CELL_HEIGHT] != FLOOR);
                
var center_meeting = oLevel.grid[# xx div CELL_WIDTH, yy div CELL_HEIGHT] != FLOOR;

// Move Back
x = xp;
y = yp;


// Return either true or false

return x_meeting or y_meeting or center_meeting;
