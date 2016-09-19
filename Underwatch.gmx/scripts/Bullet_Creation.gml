var buffer = argument[0];

var BulletID = buffer_read(buffer, buffer_u32);
var bType = buffer_read(buffer, buffer_u8);
var bx = buffer_read(buffer, buffer_f32);
var by = buffer_read(buffer, buffer_f32);
var BAngle = buffer_read(buffer, buffer_f32);
var BSpeed = buffer_read(buffer, buffer_f32);
var BulletToMake = oSmallBullet;
var MuzzleToMake = oGunMuzzle;

switch(bType) {
    case 0: // this isnt a player type so it shouldnt do anything, just missfire
            //although i need to propably create a seperate packet case to handle non damaging things information
        BulletToMake = oShellCasing;
        MuzzleToMake = oPopMuzzle;
    break;
    
    case 1:
        BulletToMake = oLightning;
        MuzzleToMake = oGauntletMuzzle;
    break;
    
    case 2:
        BulletToMake = oBlob;
        MuzzleToMake = oMuzzle;
    break
    
    case 3:
        BulletToMake = oRocket;
        MuzzleToMake = oGunMuzzle;
    break;
    
    case 4:
        BulletToMake = oSmallBullet;
        MuzzleToMake = oGunMuzzle;
    break
    
    default:
        show_debug_message("No Recognisable Bullet Type Was Sent In Case 9 Of HanfleIncomingPackets")
    break; 

}
//only in a game room
if room != rm_PlayerSelect {
    //Do action
    var Boop = instance_create(bx, by, BulletToMake);
    Boop.image_angle = BAngle;
    Boop.speed = BSpeed;
    Boop.direction = Boop.image_angle;
    Boop.Owner = BulletID;
    var Bang = instance_create(bx, by, MuzzleToMake);
    Bang.image_angle = BAngle;
}
