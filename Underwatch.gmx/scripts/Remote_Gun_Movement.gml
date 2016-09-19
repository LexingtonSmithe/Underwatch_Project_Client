var buffer = argument[0];

var pId = buffer_read(buffer, buffer_u32);
var gx = buffer_read(buffer, buffer_f32);
var gy = buffer_read(buffer, buffer_f32);
var Angle = buffer_read(buffer, buffer_f32);
var Depth = buffer_read(buffer, buffer_f32);
var imageIndex = buffer_read(buffer, buffer_u8);
var YScale = buffer_read(buffer, buffer_u8);

with(oRemoteGun) {
    if OwnerPID == pId {
        x = gx;
        y = gy;
        image_angle = Angle;
        image_index = imageIndex;
        depth = Depth
        switch(YScale) {
            case 1:
                image_yscale = 1;
            break;
            
            case 2:
                image_yscale = -1;
            break;
        }
    }
}
