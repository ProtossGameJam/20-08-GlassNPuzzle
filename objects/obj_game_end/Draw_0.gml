if(game_clear){
	//게임 클리어 이미지
	draw_sprite(spr_game_end,1,0,0);
	
	timer += 1;
	
	var vw_current = vw + easing("in_quartic",timer/timer_max) * (vw_end - vw);
	var vh_current = vh + easing("in_quartic",timer/timer_max) * (vh_end - vh);
	camera_set_view_size(camera,round(vw_current),round(vh_current));
	
	var vx_current = vx - easing("in_quartic",timer/timer_max) * (vw_end - vw)/2;
	var vy_current = vy - easing("in_quartic",timer/timer_max) * (vh_end - vh)/2;
	camera_set_view_pos(camera,round(vx_current),round(vy_current));
	
	
}
if(timer == timer_max){
	instance_create_layer(room_width/2,room_height/2+60,"top_ui",obj_ui_btn);
	obj_ui_btn.sprite_index = spr_btn_goto_main;
}