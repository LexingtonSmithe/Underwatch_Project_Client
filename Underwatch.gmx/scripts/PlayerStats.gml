///PlayerStats()

Blind = false

var Character = global.PlayerType;

switch(Character){
    case 1: //Krang
    Name = "Krang"
    HudSprite = sHealth_100;
    MaxHP = 50;
    ImageOne = sKrang_Walking_1;
    ImageTwo = sKrang_Walking_2;
    ImageThree = sKrang_Walking_3;
    ImageFour = sKrang_Walking_7;
    ImageFive = sKrang_Walking_8;
    
    //var CharactersGun = oGauntlet;
    
    break;
    
    case 2:
    Name = "Gloop"
    HudSprite = sHealth_100;
    MaxHP = 200;
    ImageOne = sGloop_Walking_1;
    ImageTwo = sGloop_Walking_2;
    ImageThree = sGloop_Walking_3;
    ImageFour = sGloop_Walking_7;
    ImageFive = sGloop_Walking_8;
    
    //var CharactersGun = oOozer;
    
    break;
    
    case 3:
    Name = "Brorus"
    HudSprite = sHealth_100;
    MaxHP = 75;
    ImageOne = sBrorus_Walking_1;
    ImageTwo = sBrorus_Walking_2;
    ImageThree = sBrorus_Walking_3;
    ImageFour = sBrorus_Walking_7;
    ImageFive = sBrorus_Walking_8;
    
    //var CharactersGun = oOozer;
    
    break;
    
    case 4:
    Name = "Generico"
    HudSprite = sHealth_100;
    MaxHP = 100;
    ImageOne = sPlayer_Idle;
    ImageTwo = sPlayer_Idle;
    ImageThree = sPlayer_Idle;
    ImageFour = sPlayer_Idle;
    ImageFive = sPlayer_Idle;
    
    //var CharactersGun = oOozer;
    
    break;
    
}

