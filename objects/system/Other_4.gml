// 각 룸별 기본 셋팅
switch(room){
	case room_intro:
		var b = instance_create_layer(room_width/2,room_height/2+30,"ui",obj_ui_btn);
		b.sprite_index = spr_btn_start;
		var b = instance_create_layer(room_width/2,room_height/2+60+60,"ui",obj_ui_btn);
		b.sprite_index = spr_btn_game_quit;
		break;
}