///Ring_Health_Bar(x,y,radius,width,maxsegments,segments,startangle,totalangle,direction,colour)

xx = argument[0];
yy = argument[1];
Radius = argument[2];
Width = argument[3];
MaxSegments = argument[4];
Segments = argument[5];
sAng = argument[6];
tAng = argument[7];
Dir = argument[8];
Colour = argument[9];

anglechange = (tAng/MaxSegments)*(pi/180)
i = sAng*(pi/180)

ax = xx+(cos(i)*Radius)
ay = yy-(sin(i)*Radius)

bx = xx+(cos(i)*(Radius+Width))
by = yy-(sin(i)*(Radius+Width))

repeat(Segments) {
    i += Dir * anglechange
    
    cx = xx+(cos(i)*Radius)
    cy = yy-(sin(i)*Radius)
    
    dx = xx+(cos(i)*(Radius+Width))
    dy = yy-(sin(i)*(Radius+Width))
    
    draw_triangle_colour(ax,ay,bx,by,dx,dy,Colour,Colour,Colour,0)
    draw_triangle_colour(ax,ay,cx,cy,dx,dy,Colour,Colour,Colour,0)
    
    ax = cx
    ay = cy
    
    bx = dx
    by = dy
}

