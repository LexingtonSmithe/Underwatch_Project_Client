///GunStats(GunAmmo,ReloadTime,SecondsBetweenShots)

GunAmmo = argument[0]
ReloadTimes = argument[1]
ShotTiming = argument[2]

Flip = 20
SecondsSinceShot = ShotTiming
SecondsBetweenShots = ShotTiming

MaxAmmo = GunAmmo
Ammo = MaxAmmo
Reloading = false
SecondsReloading = 0 
SecondsUntilReloaded = ReloadTimes
