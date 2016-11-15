///IHaveLineOfSightTo(object)

Thing = argument[0]
var Result = false;

if instance_exists(Thing) {
    if collision_line(x,y,Thing.x,Thing.y,oSolid,true,true) = noone {
        Result = true;
    }
}

return Result
