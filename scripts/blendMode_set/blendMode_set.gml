//Set the clipping mask info
/// @param spr 
/// @param image_index 
/// @param x 
/// @param y 
/// @param shder

blendMode_shd = argument4 ;

blendMode_maskSpirte = argument0 ;
blendMode_maskImage = argument1 ;
blendMode_x = argument2 ;
blendMode_y = argument3 ;

blendMode_x -= sprite_get_xoffset( blendMode_maskSpirte ) ;
blendMode_y -= sprite_get_yoffset( blendMode_maskSpirte ) ;

blendMode_uni_gm_maskTexture = shader_get_sampler_index( blendMode_shd , "gm_maskTexture" ) ;
blendMode_tex_maskTexture = sprite_get_texture( blendMode_maskSpirte , blendMode_maskImage ) ;
blendMode_uni_uv_baseTex = shader_get_uniform( blendMode_shd , "uv_baseTex" ) ;
blendMode_uni_uv_maskTex = shader_get_uniform( blendMode_shd , "uv_maskTex" ) ;
//blendMode_uvs_baseTex = sprite_get_uvs( spr_ , 0 ) ;
blendMode_uvs_maskTex = sprite_get_uvs( blendMode_maskSpirte , blendMode_maskImage ) ;
blendMode_uni_size_baseTex = shader_get_uniform( blendMode_shd , "size_baseTex" ) ;
blendMode_uni_size_maskTex = shader_get_uniform( blendMode_shd , "size_maskTex" ) ;
blendMode_uni_xy_maskTex = shader_get_uniform( blendMode_shd , "xy_maskTex" ) ;