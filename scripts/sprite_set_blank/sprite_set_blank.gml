///@param spr 


var spr_get = argument0 , spr_result ;

var spr_wid = sprite_get_width( spr_get ) ;
var spr_hei = sprite_get_height( spr_get ) ;
var sur = surface_create( spr_wid+2 , spr_hei+2 ) ;

for( var i = 0 ; i < sprite_get_number( spr_get ) ; i ++ ){
	surface_set_target( sur ) ;
	draw_sprite( spr_get , i , 1+sprite_get_xoffset(spr_get) , 1+sprite_get_yoffset(spr_get) ) ;
	surface_reset_target() ;
	if i == 0 {
		spr_result = sprite_create_from_surface( sur , 0 , 0 , surface_get_width( sur ) , surface_get_height( sur ) , 0 , 0 ,0 ,0 ) ;
	}
	else{
		sprite_add_from_surface( spr_result , sur , 0 , 0 , surface_get_width( sur ) , surface_get_height( sur ) , 0 , 0  ) ;
	}
	surface_free( sur ) ;
}
//sprite_delete( spr_get ) ;
return spr_result ;