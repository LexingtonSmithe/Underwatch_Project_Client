///Fade(Seconds)

Seconds = argument[0]

image_alpha = image_alpha - Seconds / room_speed

if image_alpha < 0 {
    instance_destroy()
}
