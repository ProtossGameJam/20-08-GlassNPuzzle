// 사다리 탈때 드로우 순서 바꾸기 (퍼즐 조각 등에 매단것 때문에)
if state_ladder {
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	if state_getting {
		draw_sprite_ext(state_getting.sprite_index,state_getting.image_index,state_getting.x,state_getting.y,state_getting.image_xscale,state_getting.image_yscale,state_getting.image_angle,state_getting.image_blend,state_getting.image_alpha);
	}
}else {
	if state_getting and state_getting.visible {
		if image_tada {
			// 후광 효과
			gpu_set_blendmode(bm_add);
			draw_sprite_ext(spr_eff_strong,0,state_getting.x+state_getting.x_offset,state_getting.y+state_getting.y_offset-image_tada,1+eff_alpha/10,1+eff_alpha/10,health,c_white,eff_alpha)
			gpu_set_blendmode(bm_normal);
			health += 0.4; // 안쓰는 내장변수 활용
			eff_alpha -= 0.017
		}
		// 숨겨진 피스 얻었을 때 image_tada 값만큼 y값 조절.
		draw_sprite_ext(state_getting.sprite_index,state_getting.image_index,state_getting.x,state_getting.y-image_tada,state_getting.image_xscale,state_getting.image_yscale,state_getting.image_angle,state_getting.image_blend,state_getting.image_alpha);
	}
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}