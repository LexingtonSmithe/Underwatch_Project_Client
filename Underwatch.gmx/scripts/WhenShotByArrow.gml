///WhenShotByArrow()

var Hit = instance_place(x,y,oArrow);

if instance_exists(Hit) {
    //Bleed
    var ToMake = 10;
    var Made = 0;
    while Made < ToMake {
        Blood = instance_create(x,y,oBlood);
        Blood.direction = point_direction(x,y,Hit.x,Hit.y) + random_range(160,200);
        Blood.speed = random(3);
        Blood.image_angle = random(359);
        Blood.image_xscale = random_range(0.5,1);
        Blood.image_yscale = Blood.image_xscale;
        
        Made +=1;
    }
    //Register the Damage
    var modifier = Hit.speed / 2
    HP = HP -  modifier;
    DrawHealth = true;
    TimeHealthDisplayed = 0;
    // When its a big arrow make a boom
    if Hit.image_xscale > 1 {
            instance_create(Hit.x,Hit.y,oExplosion)
    } else {
    // Or if a normal arrow make a fake arrow for effect
        var flen = 12
        var fdir = point_direction(x,y,Hit.x,Hit.y)
        arrow = instance_create(x+lengthdir_x(flen,fdir),y+lengthdir_y(flen,fdir),oHarmlessArrow);
        arrow.image_angle = Hit.image_angle;
    }
    //Destroy the arror
    with Hit {
        instance_destroy();
    }

}
