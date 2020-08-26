event_inherited();

// 인식 시작된 상태로 클릭 떼면 버튼 작동
if mouseDown and device_mouse_check_button_released(0, mb_left)
and !instance_exists(obj_room_changer) {
	mouseDown = 0;
	
	alarm[0] = 1;
}

