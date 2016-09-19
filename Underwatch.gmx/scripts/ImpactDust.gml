var xLeft = x - 32;
var xRight = x + 32;
var yUp = y - 32;
var yDown = y + 32;
var spread = 8;
var Dir = 0;
var Speed = 3;

if !place_meeting(x, yUp, oSolid) {
    Dir = 90;
}
if !place_meeting(x, yDown, oSolid) {
    Dir = 270;
}
if !place_meeting(xLeft, y, oSolid) {
    Dir = 180;
}
if !place_meeting(xRight, y, oSolid) {
    Dir = 0;
}

var ToMake = 8;
var Made = 0;

while Made < ToMake {
    var dust = instance_create(x,y,oDustLead);
    dust.direction = Dir + random_range(-spread, spread);
    dust.speed = Speed;
    Made ++;
}
