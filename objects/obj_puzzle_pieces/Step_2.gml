if state_got { // 플레이어가 들고있으면 따라다님
	h_dir = sign(obj_player.image_LR);
	
	x = obj_player.x - x_offset - h_dir*20;
	y = obj_player.y - y_offset - 80;
	
	//image_xscale = 0.8;
	//image_yscale = 0.8;
}