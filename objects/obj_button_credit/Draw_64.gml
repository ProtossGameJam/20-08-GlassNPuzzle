
if (credit_on){
	//draw_sprite(spr_credit_img,1,0,0);
}
var color = credit_on ? c_white:make_color_rgb(254,174,52);
image_index = credit_on;
if hover {outline_start(5+mouseDown*4,color);}
draw_sprite(sprite_index,image_index,x,y);
if hover {outline_end();}

switch(credit_on){
	case 0:
		draw_text(x,y,"credit");
		break;
	case 1:
		draw_text(x,y,"Title");
		break;
}
