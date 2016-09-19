///ObjectSetup

// Only have the local players spawn point active for the client. 
switch(global.Team) {
    case 1:
        instance_deactivate_object(oPlayerSpawnDefend)
    break;
    
    case 2:
        instance_deactivate_object(oPlayerSpawnAttack)
    break;
}
