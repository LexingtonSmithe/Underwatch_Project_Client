///Game_OutCome(buffer)
buffer = argument[0];

var Outcome = buffer_read(buffer, buffer_u8);
var xx = view_xview + view_wview * 0.5
var yy = view_yview + view_hview * 0.5

/*
1 = Timeout AKA Defenders Win
2 = Objectives Taken AKA Attackers Win
*/
if !instance_exists(oOutcome) && global.Team != 0 {
    if global.Team == Outcome {
        instance_create(xx,yy,oVictoryMaker);
    } else {
        instance_create(xx,yy,oDefeatMaker);
    }
}


