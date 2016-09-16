///ButtonHover

var Xscale = 1.15;

if position_meeting(mouse_x, mouse_y, self){
    if image_xscale < Xscale {
        image_xscale += 2/room_speed;
        image_yscale = image_xscale;
    }
} else {
    if image_xscale > 1 {
        image_xscale -= 2/room_speed;
        image_yscale = image_xscale;
    }
}
