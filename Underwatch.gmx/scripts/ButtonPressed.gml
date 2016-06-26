///ButtonPressed
ButtonText = argument[0]
Result = false

//top and bottom of the box
BoxTop = CurrentY
TextTop = BoxTop + Margin
BoxBottom = BoxTop + string_height(ButtonText) + Margin

//either side of the box
HalfTextWidth = string_width(ButtonText) / 2
BoxLeft = x - HalfTextWidth - (Margin * 2)
BoxRight = x + HalfTextWidth + (Margin * 2)

//colour of the box
draw_set_colour(c_red)

//see if the cursor is over the box
if device_mouse_x_to_gui(0)  > BoxLeft and device_mouse_x_to_gui(0) < BoxRight and device_mouse_y_to_gui(0) > BoxTop and device_mouse_y_to_gui(0) < BoxBottom {
    draw_set_alpha(1)
    if mouse_check_button_pressed(mb_left) {
        Result = true    
    }
} else {
    draw_set_alpha(0)
}

//draw the box
draw_rectangle(BoxLeft,BoxTop,BoxRight,BoxBottom,false)

//text stuff
draw_set_alpha(1)
draw_set_colour(c_white)

CurrentY = TextTop
DrawTextThenMoveDown(ButtonText)
CurrentY = CurrentY + (Margin * 2)



return Result
