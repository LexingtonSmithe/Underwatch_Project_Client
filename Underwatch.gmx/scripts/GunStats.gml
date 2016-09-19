///GunStats(GunAmmo,ReloadTime,SecondsBetweenShots)

switch(global.PlayerType){

    case 1: //Krangs Gauntlet
        StartingFlip = 20;
        Flip = StartingFlip;
        SecondsSinceShot = 0.3;
        SecondsBetweenShots = 0.3;
        MaxAmmo = 3;
        Ammo = MaxAmmo;
        Reloading = false;
        SecondsReloading = 0;
        SecondsUntilReloaded = 2;
        sprite_index = sGauntlet;
        BulletType = oLightning;
        MuzzleType = oGauntletMuzzle;
        BulletSpeed = 2;
        Spray = 0
        Len = sprite_width;
    break;
    
    case 2: // Gloops Oozer
        StartingFlip = 20;
        Flip = StartingFlip;
        SecondsSinceShot = 0.5;
        SecondsBetweenShots = 0.5;
        MaxAmmo = 4;
        Ammo = MaxAmmo;
        Reloading = false;
        SecondsReloading = 0;
        SecondsUntilReloaded = 1.5;
        sprite_index = sOozer;
        BulletType = oBlob;
        MuzzleType = oMuzzle;
        BulletSpeed = 3;
        Spray = 0
        Len = sprite_width;
    break;
    
    case 3: // Brorus Staff
        StartingFlip = 20;
        Flip = StartingFlip;
        SecondsSinceShot = 1;
        SecondsBetweenShots = 1;
        MaxAmmo = 1;
        Ammo = MaxAmmo;
        Reloading = false;
        SecondsReloading = 0;
        SecondsUntilReloaded = 1;
        sprite_index = sStaff;
        BulletType = oRocket;
        MuzzleType = oGunMuzzle;
        BulletSpeed = 5;
        Spray = 0
        Len = sprite_width / 2;
    break;
    
    case 4: // Generico Minigun
        StartingFlip = 0;
        Flip = StartingFlip;
        SecondsSinceShot = 0.05;
        SecondsBetweenShots = 0.05;
        MaxAmmo = 150;
        Ammo = MaxAmmo;
        Reloading = false;
        SecondsReloading = 0;
        SecondsUntilReloaded = 4;
        sprite_index = sMinigun;
        BulletType = oSmallBullet;
        MuzzleType = oGunMuzzle;
        BulletSpeed = 6;
        Spray = 5
        Len = sprite_width;
    break;
    
}
