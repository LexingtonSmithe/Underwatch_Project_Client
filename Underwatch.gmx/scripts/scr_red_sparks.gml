
Sname = part_system_create()

particle1 = part_type_create();
part_type_shape(particle1,pt_shape_line);
part_type_size(particle1,0.10,0.20,0,0.20);
part_type_scale(particle1,1,1);
part_type_color3(particle1,255,255,33023);
part_type_alpha3(particle1,1,0.70,0.30);
part_type_speed(particle1,0.10,2,0.30,0.20);
part_type_direction(particle1,0,359,0,2);
part_type_gravity(particle1,0.15,270);
part_type_orientation(particle1,0,0,0,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,60,60);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,x,x,y,y,0,0);
part_emitter_burst(Sname,emitter1,particle1,100);

part_emitter_destroy(Sname,emitter1)
