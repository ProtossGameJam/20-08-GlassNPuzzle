if !phase {
	var p_image_xscale = easing("in_quartic",max(timer-6,0)/timer_max) * size_end;
	var n_image_xscale = easing("in_quartic",min(timer+4,timer_max)/timer_max) * size_end;
}else{
	var p_image_xscale = size_end - easing("out_quartic",max(timer-6,0)/timer_max) * size_end;
	var n_image_xscale = size_end - easing("out_quartic",min(timer+4,timer_max)/timer_max) * size_end;
}

draw_sprite_ext(sprite_index,image_index,x,y,p_image_xscale,image_yscale,image_angle,make_color_rgb(228,166,114),image_alpha);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
draw_sprite_ext(sprite_index,image_index,x,y,n_image_xscale,image_yscale,image_angle,make_color_rgb(116,63,57),image_alpha);