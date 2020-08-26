/// @description sprite_change(sprite)
/// @param sprite 


var spr_basename = argument0;
if spr_basename == "spr_player_onladder" {
	var spr = asset_get_index(spr_basename);
	var spr_r = asset_get_index(spr_basename);
}else { // 좌우 스프라이트 구분
	var LR = image_LR == 1 ? "_right":"_left";
	var LR_r = image_LR == 1 ? "_left":"_right";

	var spr = asset_get_index(spr_basename+LR);
	var spr_r = asset_get_index(spr_basename+LR_r);
}


if sprite_index != spr {
	if sprite_index != spr_r {
		image_index = 0;
	}
	sprite_index = spr;
}