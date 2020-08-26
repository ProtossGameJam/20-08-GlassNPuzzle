var puz = obj_game_manager.puzzle_pieces_fit;
for(var i=array_length_1d(puz);i;)if(!puz[--i])break;

if(i == 0) game_clear = true;
else game_clear = false;


timer = min(timer,timer_max); 