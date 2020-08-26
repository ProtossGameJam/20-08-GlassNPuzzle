timer = 0;
timer_max = 30;

phase = 0;

//camera = camera_get_default();
//vx = view_get_xport(view_current);
//vy = view_get_yport(view_current);

x = 0;
y = 0 + view_get_hport(view_current);

x_end = 0 + view_get_wport(view_current);
y_end = 0;

size_end = point_distance(x,y,x_end,y_end);

image_angle = point_direction(x,y,x_end,y_end);
image_yscale = 2500;