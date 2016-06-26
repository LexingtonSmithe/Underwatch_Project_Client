///GunPositionAndAngle

if instance_exists(Owner) {
    //Delcare the variables
    var Length = 7

    //if the Owner faces the other direcion switch hands and reorient
    if Owner.Angle > 90 && Owner.Angle < 270 {
        Angle = 25
        image_yscale = -1
        Flip = -20
    } else {
        Angle = 150
        image_yscale = 1
        Flip = 20
    }
    
    var xx = Owner.x + lengthdir_x(Length,0 - Angle)
    var yy = Owner.y + lengthdir_y(Length,0 - Angle)
    var mx = point_direction(x,y,mouse_x,mouse_y)
    
    //Set our position and depth
    depth = Owner.depth -1
    x = xx
    y = yy
    
    //Face the correct way
    image_angle = mx
    
} else {
    // If our owner doesnt exists, destroy 
    instance_destroy()
    
}
