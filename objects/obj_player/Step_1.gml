
// 상태 관리 변수들
state_get -= state_get > 0;





if state_get == 0 {
	sprite_change("spr_player_stand");
	state_get = -1;
	state_tada = 0;
}

if !state_tada {
	image_tada = round(image_tada/2.5);
}

