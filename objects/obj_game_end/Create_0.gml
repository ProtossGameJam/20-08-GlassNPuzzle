// 게임 클리어 여부 판단
game_clear = false;
timer = 0;
timer_max = room_speed*1;

camera = view_get_camera(view_current);
vw = camera_get_view_width(camera);
vh = camera_get_view_height(camera);
vx = 160;
vy = 90;
vw_end = 1920-16*5;
vh_end = 1080-9*5;

