///GunPositionAndAngle

if instance_exists(Owner) {
    //Set the Angle
    //if the Owner faces the other direcion switch hands and reorient
    if Owner.Angle > 90 && Owner.Angle < 270 {
        Angle = 25
        image_yscale = -1
        Flip = -StartingFlip
    } else {
        Angle = 155
        image_yscale = 1
        Flip = StartingFlip
    }
    
    //Delcare the variables
    var xx = Owner.x + lengthdir_x(DistanceFromPlayer,0 - Angle)
    var yy = Owner.y + lengthdir_y(DistanceFromPlayer,0 - Angle)
    var mx = point_direction(x,y,mouse_x,mouse_y)
    
    //Set depth based on which way the player is facing
    if Owner.Direction = 2 or Owner.Direction = 3 or Owner.Direction = 4 {
        depth = Owner.depth +1;
    } else {
        depth = Owner.depth -1;
    }
    // Set our position
    x = xx;
    y = yy;
    
    //Face the correct way
    image_angle = mx;
    
} else {
    // If our owner doesnt exists, destroy 
    instance_destroy()
    
}
