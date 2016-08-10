///CollisionCheck(hspd,vspd)

hspd = argument[0]
vspd = argument[1]

if place_meeting(x + hspd, y + vspd,oSolid) {
    //keep as much of our horizontalspeed as possible
    OldHSpeed = hspd
    hspd = 0
    while 
        place_meeting(x + hspd + sign(OldHSpeed),y,oSolid) = false && //check there is still room if we crept abit closer to our old hspd
        abs(hspd) < abs(OldHSpeed) //check we havent restored all of our old speed, and only play attention to the absolute values, the magnitudes
    {
        //creep towards old Hspeed
        hspd = hspd + sign(OldHSpeed)
    }  
    
    //we have now figured out how much of our hspd we can keep without hitting anything so were keeping that
    
     //keep as much of our horizontalspeed as possible
    OldVSpeed = vspd
    vspd = 0
    while 
        place_meeting(x + hspd, y + vspd + sign(OldVSpeed), oSolid) = false && //check there is still room if we crept abit closer to our old vspd
        abs(vspd) < abs(OldVSpeed) //check we havent restored all of our old speed, and only play attention to the absolute values, the magnitudes
    {
        //creep towards old Vspeed
        vspd = vspd + sign(OldVSpeed)
    }
    
}

//Move
x += hspd
y += vspd

