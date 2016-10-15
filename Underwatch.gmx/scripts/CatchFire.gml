///CatchFire()
if instance_place(x,y,oGunFlames) {
    Lit = true;
}

if Lit = true { 
    var len = speed + 5;
    var dir = direction;
        xx = x + lengthdir_x(len,dir);
        yy = y + lengthdir_y(len,dir);
    
    if instance_place(xx, yy, oPlayer) {
        instance_create(xx, yy, oFlames)
        Lit = false;
    }
}
