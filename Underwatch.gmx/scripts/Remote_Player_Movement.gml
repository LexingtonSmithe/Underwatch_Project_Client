var buffer = argument[0];

var pId = buffer_read(buffer, buffer_u32);
var xx = buffer_read(buffer, buffer_f32);
var yy = buffer_read(buffer, buffer_f32);
var imageIndex = buffer_read(buffer, buffer_u8);
var spriteNumber = buffer_read(buffer, buffer_u8);
var XScale = buffer_read(buffer, buffer_u8);
var Shot = buffer_read(buffer, buffer_u8);
var Health = buffer_read(buffer, buffer_u8);
var MaxHealth = buffer_read(buffer, buffer_u8);    

with(oRemotePlayer) {
    if remotePlayerId == pId {
        x = xx;
        y = yy;
        HP = Health;
        MaxHP = MaxHealth;
        
        // Change the sprite
        Sprite = spriteNumber;
        
        //make sure its the correct index
        image_index = imageIndex;
        
        //face the same way
        switch(XScale) {
            case 1:
                image_xscale = 1;
            break;
            
            case 2:
                image_xscale = -1;
            break;
        }
        //and if we are shot display he health bar
        switch(Shot) {
            case 0:
                DrawHealth = false;
            break;
            
            case 1:
                DrawHealth = true;
            break;
        }
    }
}
