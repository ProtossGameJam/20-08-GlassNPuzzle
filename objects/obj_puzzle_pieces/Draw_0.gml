if !state_got{ // 바닥에 있을 때
	//var tex = sprite_get_texture(sprite_index, image_index);
	var tex_w = sprite_width;
	var tex_h = sprite_height;
	var t_xscale = -20;
	var b_xscale = 60;
	
	
	draw_sprite_pos_fixed(sprite_index,image_index,
		x-t_xscale,y,
		x+tex_w+t_xscale,y,
		x+tex_w+b_xscale,y+tex_h,
		x-b_xscale,y+tex_h,			
		c_white,1);
		
} // 플레이어가 들고 있을 때는 플레이어쪽에서 드로우