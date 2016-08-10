///scr_herd(herdLeader ,wander_radius ,1 ,IdleImage, WalkingImage)
var herd_leader, wander_radius;

herdLeader = argument0
wander_radius =  argument1
spd = argument2
idleimage = argument3
walkingimage = argument4


if distance_to_point(herdLeader.x,herdLeader.y) <   wander_radius + 10    //If you're in the wander radius of the  herd...
{

    timer-=1            //countdown the timer
    
    if timer<0  {    //if the    timer runs out
        wanderx=herdLeader.x-wander_radius+irandom(2*wander_radius)           //find a new     random wander point
        wandery=herdLeader.y-wander_radius+irandom(2*wander_radius)
        
        while(place_meeting(wanderx,wandery,oSolid)) {    //If the wander point isn't free
            wanderx=herdLeader.x-wander_radius+irandom(2*wander_radius)           //find a new random wander point
            wandery=herdLeader.y-wander_radius+irandom(2*wander_radius) 
            timer=200+irandom(200)  //reset the timer
            }  
        timer=200+irandom(200)                      //reset the     timer
    }

  
        
    if distance_to_point(wanderx,wandery) > spd  {//if you're  not at your wander point
        if wanderx > x {
            image_xscale = 1;
        } else if wanderx < x  {
            image_xscale = -1;
        }
        sprite_index = walkingimage;
        mp_potential_step(wanderx,wandery,spd,0)  //move towards it
    } else {
        sprite_index = idleimage;
    }

}

else                //If you're outside the wander radius of the     herd...

{
    mp_potential_step(herdLeader.x,herdLeader.y,spd+0.3,0)                //move toward the herd leader
    wanderx=herdLeader.x                                               //reset your wander variables
    wandery=herdLeader.y
    timer=10
}

image_speed = 0.2;
