// 마우스 닿음
hover = collision_point(device_mouse_x(0), device_mouse_y(0), id, 1, 0) ? 1:0;

// 마우스 안닿으면 클릭 인식 안함
if !hover {
	mouseDown = 0;
}

// 클릭 발생 시 마우스가 닿으면 클릭 인식시작
if device_mouse_check_button_pressed(0, mb_left) {
	mouseDown = hover
}

// 인식 시작된 상태로 클릭 떼면 버튼 작동
if mouseDown and device_mouse_check_button_released(0, mb_left)
and !instance_exists(obj_room_changer)
and !instance_exists(obj_show_credit) {
	mouseDown = 0;
	
	if (object_index == obj_ui_btn){ // 원본(부모) 오브젝트일 경우
		if sprite_index != spr_btn_game_quit {
			room_change(sprite_index);
		}else{
			game_end();
		}
	}else { // 자식 오브젝트일 경우
		alarm[0] = 1;
	}
}

// 상태에 맞는 이미지
image_index = hover + (hover and mouseDown);

