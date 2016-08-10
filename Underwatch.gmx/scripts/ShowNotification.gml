///ShowNotification(text)

var text = argument[0]

with (oMessage) {
    instance_destroy()
}
var yy = 128;
if (instance_exists(oButton_Login)) {
    yy = oButton_Login.y;
} else if (instance_exists(oButton_Register)) {
    yy = oButton_Register.y;
}


var notification = instance_create(x, yy, oMessage);
notification.message = text;
