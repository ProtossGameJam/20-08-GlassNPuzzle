if timer > timer_max { 
	if phase_on and !phase {
		timer = 0;
		phase = 1;
		x = x_end;
		y = y_end;
		image_angle += 180;
	}else if phase {
		instance_destroy();
		surface_free(surf_mask);
		surface_free(surf);
	}
}else {
	timer += 1;
}

if !phase {
	image_xscale = easing("in_out_quartic",min(timer,timer_max)/timer_max) * size_end;
}else{
	image_xscale = size_end - easing("out_quartic",timer/timer_max) * size_end;
}
var click = max(device_mouse_check_button(0,mb_left),0);
scroll = min(scroll + scroll_speed+click*2,scroll_max);