// 생성된 오브젝트들에 숨겨진 피스 랜덤으로 하나씩 할당
if room = room_play {
	
	for(var i = 0; i < ds_list_size(piece_hide); i ++){
		var o = instance_find(obj_object,irandom(instance_number(obj_object)-1));
		while (o.has_piece > -1) {
			o = instance_find(obj_object,irandom(instance_number(obj_object)-1));
		}
		o.has_piece = piece_hide[| i];
	}
	
	ds_list_destroy(piece_hide);
	ds_list_destroy(piece_not_hide);
}