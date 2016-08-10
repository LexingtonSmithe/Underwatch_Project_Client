//set the resolutions we want to dispay or get this information from the device
var displayWidth = global.displayWidth; //display_get_width()
var displayHeight = global.displayHeight; //display_get_height(

//set the size of the gui
display_set_gui_size(displayWidth, displayHeight);

//set the size of the game window
window_set_size(displayWidth, displayHeight);

// find the aspect ratio we were programmed for
var baseWidth = 1280;
var baseHeight = 720;

//determine the aspect ratio
var aspect = baseWidth / baseHeight;

// work out the adjusted height and width
if displayWidth >= displayHeight {
    var height = min(baseHeight, displayHeight)
    var width = height * aspect;
}

// resize the application surface to our adjusted view
surface_resize(application_surface,width, height);
