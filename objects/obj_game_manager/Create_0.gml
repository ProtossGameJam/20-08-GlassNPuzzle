// 피스별 중앙 좌표
pieces_centers = [[93,67],[170,52],[55,135],[101,124],[157,122],[198,125],[138,162],[185,175],[87,191],[137,192]];

// 퍼즐 스프라이트 정보
puzzle_original = spr_puzzle1_original;
puzzle_w = sprite_get_width(puzzle_original);
puzzle_h = sprite_get_height(puzzle_original);

puzzle_pieces = spr_puzzle1_pieces;
puzzle_pieces_fit = []; // 퍼즐 정답 여부 배열

// 숨길/안숨길 피스 리스트
piece_hide = ds_list_create();
piece_not_hide_amount = 6;
piece_not_hide = ds_list_create();

// 숨길 피스 리스트 생성 후 안숨길 인덱스 값만 랜덤으로 빼서 안숨길 피스 리스트에 넣기
for(var i = 0; i<sprite_get_number(puzzle_pieces); i++){
	ds_list_add(piece_hide,i);
}
repeat(piece_not_hide_amount){
	ds_list_shuffle(piece_hide);
	ds_list_add(piece_not_hide,piece_hide[| 0]);
	ds_list_delete(piece_hide,0);
}

// 피스 생성
for(var i = 0; i<sprite_get_number(puzzle_pieces); i++){
	var piece = instance_create_layer(room_width/choose(1.76,4.5)+irandom(110), room_height/1.88+irandom(90),"instances_1",obj_puzzle_pieces);
	puzzle_pieces_fit[i] = false;
	with piece {
		sprite_index = other.puzzle_pieces;
		image_index = i;
		image_speed = 0;
		
		var centers = other.pieces_centers[i];
		x_offset = centers[0];
		y_offset = centers[1];
	}
	
	if ds_list_find_index(piece_hide,i) > -1 { // 숨길 리스트에 있으면 숨기기
		with piece {
			visible = false;
			x = 999999;
		}
	}
}

// 퍼즐판 기준 위치
x = room_width / 2;
y = room_height / 2 + 180;


// 게임 클리어 여부 판단
game_clear = false;
