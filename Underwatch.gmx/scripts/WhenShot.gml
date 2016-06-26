///WhenShot(ByWhat,Damage)
ByWhat = argument[0];
Damage = argument[1];

var Hit = instance_place(x,y,ByWhat);

if instance_exists(Hit) {
    var ToMake = 10;
    var Made = 0;
    while Made < ToMake {
        var Blood = instance_create(x,y,oBlood);
        Blood.direction = point_direction(x,y,Hit.x,Hit.y) + random_range(160,200);
        Blood.speed = random(3);
        Blood.image_angle = random(359);
        Blood.image_xscale = random_range(0.5,1);
        Blood.image_yscale = Blood.image_xscale;
        
        Made +=1;   
    }
    HP = HP - Damage;
    DrawHealth = true;
    TimeHealthDisplayed = 0;
      
    with Hit {
        instance_destroy()
    }

}
