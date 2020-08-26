//var tex = sprite_get_texture(puzzle_original, 1);
var t_xscale = -20;
var b_xscale = 60;

// 퍼즐판
draw_sprite_pos_fixed(puzzle_original,1,
	x-puzzle_w/2-t_xscale,y-puzzle_h/2,
	x+puzzle_w/2+t_xscale,y-puzzle_h/2,
	x+puzzle_w/2+b_xscale,y+puzzle_h/2,
	x-puzzle_w/2-b_xscale,y+puzzle_h/2,
	c_white,1);

// 정답 맞춘 피스 그리기
for(var i = 0; i < sprite_get_number(puzzle_pieces); i++){
	if puzzle_pieces_fit[i] {
		
		draw_sprite_pos_fixed(puzzle_pieces,i,
			x-puzzle_w/2-t_xscale,y-puzzle_h/2,
			x+puzzle_w/2+t_xscale,y-puzzle_h/2,
			x+puzzle_w/2+b_xscale,y+puzzle_h/2,
			x-puzzle_w/2-b_xscale,y+puzzle_h/2,
			c_white,1);
			
	}
}
