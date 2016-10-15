var Sname = part_system_create();
var particle1 = part_type_create();
part_type_shape(particle1,pt_shape_pixel);
part_type_size(particle1,0.10,0.80,0,0);
part_type_scale(particle1,1,1);
part_type_color2(particle1,65535,33023);
part_type_alpha1(particle1,1);
part_type_speed(particle1,1,2,0,0);
part_type_direction(particle1,-20,20,0,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,0,0,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,60,60);

var emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,x,x,y,y,0,0);
part_emitter_stream(Sname,emitter1,particle1,1);
