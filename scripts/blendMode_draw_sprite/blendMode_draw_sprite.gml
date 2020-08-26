//Set the clipping mask info
/// @param spr 
/// @param image_index 
/// @param x 
/// @param y 
blendMode_baseSpirte = argument0 ;
blendMode_baseImage = argument1 ;
blendMode_basex = argument2 ;
blendMode_basey = argument3 ;
blendMode_uvs_baseTex = sprite_get_uvs( blendMode_baseSpirte , blendMode_baseImage ) ;
var blendMode_baseSpirte_xoffset = sprite_get_xoffset( blendMode_baseSpirte ) ;
var blendMode_baseSpirte_yoffset = sprite_get_yoffset( blendMode_baseSpirte ) ;
var blendMode_sizeTex_maskTex = shader_get_uniform( blendMode_shd , "sizeTex_maskTex" ) ;
var blendMode_sizeTex_baseTex = shader_get_uniform( blendMode_shd , "sizeTex_baseTex" ) ;

shader_set( blendMode_shd ) ;
texture_set_stage( blendMode_uni_gm_maskTexture , blendMode_tex_maskTexture ) ;
shader_set_uniform_f( blendMode_uni_uv_baseTex , blendMode_uvs_baseTex[0] , blendMode_uvs_baseTex[1] , blendMode_uvs_baseTex[2] , blendMode_uvs_baseTex[3] ) ;
shader_set_uniform_f( blendMode_uni_uv_maskTex , blendMode_uvs_maskTex[0] , blendMode_uvs_maskTex[1] , blendMode_uvs_maskTex[2] , blendMode_uvs_maskTex[3] ) ;
shader_set_uniform_f( blendMode_uni_size_baseTex , sprite_get_width(blendMode_baseSpirte) , sprite_get_height(blendMode_baseSpirte) ) ;
shader_set_uniform_f( blendMode_uni_size_maskTex , sprite_get_width(blendMode_maskSpirte) , sprite_get_height(blendMode_maskSpirte) ) ;
shader_set_uniform_f( blendMode_uni_xy_maskTex , blendMode_x-blendMode_basex+blendMode_baseSpirte_xoffset , blendMode_y-blendMode_basey+blendMode_baseSpirte_yoffset ) ;
shader_set_uniform_f( blendMode_sizeTex_maskTex , texture_get_width(sprite_get_texture(blendMode_maskSpirte,blendMode_maskImage)) , texture_get_height(sprite_get_texture(blendMode_maskSpirte,blendMode_maskImage)) ) ;
shader_set_uniform_f( blendMode_sizeTex_baseTex , texture_get_width(sprite_get_texture(blendMode_baseSpirte,blendMode_baseImage)) , texture_get_height(sprite_get_texture(blendMode_baseSpirte,blendMode_baseImage)) ) ;
draw_sprite( blendMode_baseSpirte , blendMode_baseImage , blendMode_basex , blendMode_basey ) ;
shader_reset() ;