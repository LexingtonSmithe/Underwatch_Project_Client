///GetOrientationAndFace()

//Find the mouse and calculate the angle to it
var mx = point_direction(x,y,mouse_x,mouse_y);
// Whats the difference
var dir = 0;

if mx > 67.5  && mx < 112.5 {
    dir = 3;
}

if mx > 22.5 && mx < 67.5 {
    dir = 2;
}
if mx > 337.5 or mx < 22.5 {
    dir = 1;
}

if mx > 292.5 && mx < 337.5 {
    dir = 8;
}

if mx > 247.5 && mx < 292.5 {
    dir = 7;
}

if mx > 202.5 && mx < 247.5 {
    dir = 6;
}

if mx > 157.5 && mx < 202.5 {
    dir = 5;
}

if mx > 112.5 && mx < 157.5 {
    dir = 4;
}

Direction = dir;
Angle = mx;

if Angle > 90 && Angle < 270 {
    facingLeft = true;
} else {
    facingLeft = false;
}

var ispeed = 0.2;

if facingLeft = true {
    image_xscale = -1;
    image_speed = -ispeed;
} else {
    image_xscale = 1;
    image_speed = ispeed;
}

