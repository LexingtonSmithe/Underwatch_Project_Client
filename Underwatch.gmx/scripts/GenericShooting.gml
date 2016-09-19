///Generic Shooting

///Shooting

var Dir = image_angle + Flip;

SecondsSinceShot = SecondsSinceShot + 1/room_speed;

if mouse_check_button(mb_left) {
    
    if SecondsSinceShot > SecondsBetweenShots && Ammo > 0 {
        image_speed = 0.4;
        Ammo = Ammo - 1;
        SecondsSinceShot = 0;
        
        var bx = x + lengthdir_x(Len, Dir);
        var by = y + lengthdir_y(Len, Dir);
        var Bullet = instance_create(bx, by, BulletType);
            Bullet.speed = BulletSpeed;
            Bullet.direction = image_angle + random_range(-Spray,Spray);
            Bullet.image_angle = Bullet.direction;
            Bullet.Owner = global.playerId;
        var Bang = instance_create(bx, by, MuzzleType);
            Bang.image_angle = image_angle;

        
        //ONLY MINIGUN GETS SHELL CASINGS ATM 
        if global.PlayerType == 4 {
            var xx = x+lengthdir_x(Len/4, Dir)
            var yy = y+lengthdir_y(Len/4, Dir)
            var Casing = instance_create(xx, yy, oShellCasing);
                Casing.Owner = global.playerId;
                Casing.direction = image_angle + 250 + random_range(-20,20);
                
            var Dir = Casing.direction;
            Send_Item_Created(xx,yy,Dir); // Switches off of global.PlayerType

        }
        // Tell the server we fired a shot
        var imageAngle = Bullet.image_angle
        Send_Bullet_Created(bx,by,imageAngle,BulletSpeed);

    }
    
} else {
    image_speed = 0;
}

if Ammo <= 0 {
    Reloading = true;
}

if Reloading = true && Ammo != MaxAmmo{
    Ammo = 0;
    SecondsReloading = SecondsReloading + 1 / room_speed;
    
    if SecondsReloading > SecondsUntilReloaded {
        Ammo = MaxAmmo;
        SecondsReloading = 0; 
        Reloading = false;
    }
    
}
