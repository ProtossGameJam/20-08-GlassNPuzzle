timer += 1;

if timer > timer_max { 
	if !phase {
		phase = 1;
		timer = 0;
		x = x_end;
		y = y_end;
		image_angle += 180;
		
		switch(action){
			case spr_btn_start:
				room_goto_next();
				break;
			case spr_btn_game_quit:
				game_end();
				break;
			case spr_btn_goto_main:
				room = room_intro;
		}
		
	}else {
		instance_destroy();
	}
}

if !phase {
	image_xscale = easing("in_quartic",timer/timer_max) * size_end;
}else{
	image_xscale = size_end - easing("out_quartic",timer/timer_max) * size_end;
}