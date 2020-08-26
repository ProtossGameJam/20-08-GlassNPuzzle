// 시드 난수화
randomize();

// bgm 재생
audio_play_sound(sound_main_bgm,0,true);


// 기울이기 쉐이더 버텍스버퍼
vertex_format_begin();
vertex_format_add_colour();
vertex_format_add_position();
vertex_format_add_normal();
global.format_perspective = vertex_format_end();