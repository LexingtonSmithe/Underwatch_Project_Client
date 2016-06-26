window_set_fullscreen(true)

//how big is this screen?
ScreenWidth = display_get_width()
ScreenHeight = display_get_height()

//How much of the room do we want on screen
view_wview[0] = ScreenWidth
view_hview[0] = ScreenHeight

//How much of the screen do you want that to take up
view_wport = ScreenWidth
view_hport = ScreenHeight


//set size of window, you cant tell me what to do! oh wait...
window_set_size(ScreenWidth,ScreenHeight)

//some stupid yet nessecary thing
surface_resize(application_surface,ScreenWidth,ScreenHeight)

