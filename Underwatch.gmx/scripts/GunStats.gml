///GunStats(GunAmmo,ReloadTime,SecondsBetweenShots)

switch(global.PlayerType){

    case 1: //Krangs Gauntlet
        Flip = 20;
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
    break;
    
    case 2: // Gloops Oozer
        Flip = 20;
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
    
    break;
    
    case 3:
    
    break;
    
}
