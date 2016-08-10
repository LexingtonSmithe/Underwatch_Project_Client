///HealthHud(Sprite,Name)

Sprite = argument[0]
Name = argument[1]

//Health Counter
var xx = 128;
var yy = view_hport[0] - 96;
var xp = sprite_get_width(Sprite);
var yp = sprite_get_height(Sprite);
var percentage = (HP / MaxHP)*100;

draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_font(font_HUD);
draw_text(xx-64,yy-64,string(Name) + ": "  + string(round(HP))+" / "+string(MaxHP));

draw_sprite_part(Sprite,0,0,0,(xp/100)*percentage,yp,xx-64,yy)
