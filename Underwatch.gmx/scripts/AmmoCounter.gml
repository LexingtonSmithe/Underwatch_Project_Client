///AmmoCounter()

/*
Requires Script in Gun Create Event
GunStats(GunAmmo,ReloadTime,ShotTiming)
*/
var xx = view_wport[0] - 96;
var yy = view_hport[0] - 96;
var xp = (sprite_get_width(sReload_Bar) / 2) - 8;
var percentage = (SecondsReloading / SecondsUntilReloaded)*2;

draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_font(font_HUD);
draw_text(xx,yy,string(Ammo)+" / "+string(MaxAmmo));

if Reloading = true {
    draw_sprite(sReload_Bar,0,xx,yy-32);
    draw_sprite(sReload_Slider,0,xx-xp+(xp*percentage),yy-32);
}
