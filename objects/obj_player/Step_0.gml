// 키 입력
var h_key = keyboard_check(vk_right) - keyboard_check(vk_left);
var v_key = keyboard_check(vk_down) - keyboard_check(vk_up);

var get_key = keyboard_check_pressed(vk_space);


// 상태별 스페이스바 동작
if !state_getting and !state_ladder {
	var near_obj = instance_nearest(x,y,obj_object);
	if abs(x - near_obj.x) + abs(y-near_obj.y)/1.5 < interact_object_range { // 오브젝트와 충분히 가까우면
		near_obj.highlight = true; // 오브젝트 강조 테두리
		if !state_get and get_key and !near_obj.state_open {  // 오브젝트 탐색
			sprite_change("spr_player_stand");
			near_obj.state_open = true;
			near_obj.alarm[0] = 75;
			state_get = 20;
			if near_obj.has_piece > -1 { // 숨겨진 피스가 있으면
				state_get += 60;
				alarm[0] = 15;
				state_tada = 1;
				with (obj_puzzle_pieces) {
					if image_index = near_obj.has_piece {
						other.state_getting = id;
						state_got = true;
						break;
					}
				}
				near_obj.has_piece = -1;
			}
		}
	}else{
		if !state_get and get_key { // 피스 들기
			state_get = 15;
			image_speed = 0;
			sprite_change("spr_player_get");
			// 가장 가까운 피스의 정보 저장 [피스까지의 거리, id]
			var nearest = [999999,0];
			with(obj_puzzle_pieces){
				var dist = point_distance(x+x_offset,y+y_offset,other.x,other.y);
				if nearest[0] > dist {
					nearest[0] = dist;
					nearest[1] = id;
				}
			}
			// 충분히 가까울 경우 피스 들기
			if nearest[0] < piece_get_range {
				nearest[1].state_got = 1;
				state_getting = nearest[1];
			}
		}
	}
}else if get_key and !state_get and !state_ladder {
	// 피스 내려놓기
	var near_obj = instance_nearest(x,y,obj_object);
	if abs(x - near_obj.x)/2 + abs(y-near_obj.y) > interact_object_range+10 { // 오브젝트와 상호작용이 가능한 거리에서는 내려놓기 안되게
		state_get = 15;
		image_speed = 0;
		sprite_change("spr_player_get");
	
		state_getting.state_got = false;
		state_getting.y += 80;
	
		// 정답 위치에 가까우면 피스 제거 후 퍼즐판에 표시
		var o = obj_game_manager;
		if point_distance(state_getting.x, state_getting.y, o.x - o.puzzle_w/2, o.y - o.puzzle_h/2) < piece_correct_range {
			obj_game_manager.puzzle_pieces_fit[state_getting.image_index] = true;
			
			repeat(4){
				var i = instance_create_layer(o.x - o.puzzle_w/2+state_getting.x_offset, o.y - o.puzzle_h/2+state_getting.y_offset,"Instances_eff",obj_particle);
				i.type = "star";
				i.mod_alpha = 0.03;
				i.gravity = 0.7;
				i.speed = 12+random(2);
				i.direction = 70+random(40);
			}
			
			instance_destroy(state_getting);
		}
	
		state_getting = false;
	}
}

// 상태별 방향키 동작
if !state_get and !state_ladder {
	// 평지 이동
	if abs(h_key) or abs(v_key) {
		if abs(h_key) {
			if collision_point(x+h_key*_hspeed,y,obj_floor_mask,1,0) {
				x +=  h_key * _hspeed;
			}else{
				for(var i = 1; i < _hspeed; i++){
					for(var j = 1; j < move_smooth; j++){
						if collision_point(x+h_key*i,y-j,obj_floor_mask,1,0) {
							x +=  h_key * i;
							y -= j;
							i = _hspeed;
							break;
						}else if collision_point(x+h_key*i,y+j,obj_floor_mask,1,0) {
							x +=  h_key * i;
							y += j;
							i = _hspeed;
							break;
						}
					}
				}
			}
		}
		if abs(v_key) {
			if collision_point(x,y+v_key*_vspeed,obj_floor_mask,1,0) {
				y += v_key * _vspeed;
			}else if collision_point(x,y+v_key*_vspeed,obj_ladder,1,0){
				var ladder = collision_point(x,y+v_key*_vspeed,obj_ladder,1,0);
				if abs((ladder.x+ladder.sprite_width/2) - x) < _hspeed*2{
					x = ladder.x+ladder.sprite_width/2;
					y += v_key*_vspeed;
					
					state_ladder = true;
					sprite_change("spr_player_onladder");
					image_speed = 0;
				}
			}else{
				for(var i = 1; i < _vspeed; i++){
					for(var j = 1; j < move_smooth; j++){
						if collision_point(x-j, y+v_key*i, obj_floor_mask, 1, 0) {
							y += v_key * i;
							x -= j;
							i = _vspeed;
							break;
						}else if collision_point(x+j, y+v_key*i, obj_floor_mask, 1, 0) {
							y += v_key * i;
							x += j;
							i = _vspeed;
							break;
						}
					}
				}
			}
		}
		
		if !state_ladder {
			image_speed = 1;
			image_LR = !abs(h_key) ? image_LR:h_key;
			sprite_change("spr_player_walk");
		}
	}else{
		sprite_change("spr_player_stand");
	}
}else if state_ladder {
	// 사다리 이동
	if abs(v_key) {
		if !collision_point(x,y+v_key*_hspeed,obj_floor_mask,1,0){
			y += v_key * _hspeed;
			image_speed = 1;
			image_index = image_index >= 0 and image_index < 1 ? 1:image_index;
		}else {
			state_ladder = false;
			y += v_key * _hspeed;
			sprite_change("spr_player_walk");
		}
	}else{
		image_speed = 0;
		image_index = 0;
	}
}




// 카메라 추적
var camera = view_get_camera(view_current);
var camera_y = camera_get_view_y(camera);
var cy = y - 520;
var cy_current = camera_y + (cy - camera_y) / 50;
camera_set_view_pos(camera,camera_get_view_x(camera),median(-320,round(cy_current),90));

