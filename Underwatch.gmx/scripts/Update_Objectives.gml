///Update_Objectives(buffer)
var buffer = argument[0];

var Total = buffer_read(buffer, buffer_u8);
var Point = buffer_read(buffer, buffer_u8);

if instance_exists(oLocalPlayer) { // ONLY IN THE GAME WORLD
    switch(Point) {
        case 1:
            with(oObjectiveA) {
                Score = Total;
            }
        break;
        
        case 2:
            with(oObjectiveB){
                Score = Total;
            }
        break;
            with(oObjectiveC) {
                Score = Total;
            }
        case 3:
        
        break;
    }
}
