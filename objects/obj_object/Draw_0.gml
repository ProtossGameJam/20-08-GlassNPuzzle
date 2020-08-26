if !highlight{
	draw_sprite_ext(sprite_index,image_index+state_open,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}else {
	image_index += state_open;
	outline_start(hightlight_thick,make_color_rgb(254,174,52),sprite_index);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	outline_end();
	image_index -= state_open;
}