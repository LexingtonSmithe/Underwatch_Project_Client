///Update_Objectives(buffer)
var buffer = argument[0];

var Total = buffer_read(buffer, buffer_u8);
var CapturePoint = buffer_read(buffer, buffer_u8);

 // ONLY IN THE GAME WORLD
switch(CapturePoint) {
    case 1:
        if instance_exists(oObjectiveA){
            with(oObjectiveA) {
                Score = Total;
            }
        }
    break;
    
    case 2:
        if instance_exists(oObjectiveB) {
            with(oObjectiveA) {
                Score = MaxScore; 
                /* 
                if we are receiving points for objective B and we havent yet 
                completed A set it to 100 so we have the same active 
                capture points as everyone else
                */
            }
            with(oObjectiveB){
                Score = Total;
            }
        }
    break;
        
    case 3:
        if instance_exists(oObjectiveC) {
            with(oObjectiveC) {
                Score = Total;
            }
        }
    break;
}
