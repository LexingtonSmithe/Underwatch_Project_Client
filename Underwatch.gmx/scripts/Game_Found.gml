var buffer = argument[0];

var Level = buffer_read(buffer, buffer_u8); // find out what room it is and take us to the...
var Team = buffer_read(buffer, buffer_u8);

global.Team = Team;

ds_grid_set(global.PlayerGrid, 2, 0, Team);

switch(Level) {
    case 0: // Sewers
    
    global.Level = (rm_One);
    
    break;
    
    case 1: // Dojo
    
    global.Level = (rm_Two);
                
    break;
    
}
//go to the player select screen
room_goto(rm_PlayerSelect);

// Acknoledge receipt of this instruction by repeating it back to the Server
Game_Found_Reciept(Level,Team);
