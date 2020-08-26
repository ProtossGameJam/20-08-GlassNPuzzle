sprite_index = spr_part_long;

if (!surface_exists(surf_mask)) {
    surf_mask = surface_create(vw, vh);
}
if (!surface_exists(surf)) {
    surf = surface_create(vw, vh);
}

surface_set_target(surf_mask);
draw_clear(c_black);

gpu_set_blendmode(bm_subtract);
draw_sprite_ext(spr_part_long,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,image_alpha);
gpu_set_blendmode(bm_normal);
surface_reset_target();

surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_sprite(spr_credit_img, 0, 0, vh-scroll);
gpu_set_blendmode(bm_subtract);
draw_surface(surf_mask, 0, 0);
gpu_set_blendmode(bm_normal);
surface_reset_target();

draw_sprite_ext(spr_part_long,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,image_alpha);
draw_surface(surf, 0, 0);
