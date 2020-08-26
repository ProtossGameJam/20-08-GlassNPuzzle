varying vec2 tex_baseCoord ;
uniform sampler2D gm_maskTexture ;
uniform vec4 uv_baseTex ;
uniform vec4 uv_maskTex ;
uniform vec2 size_baseTex ;
uniform vec2 size_maskTex ;
uniform vec2 xy_maskTex ;
uniform vec2 sizeTex_baseTex ;
uniform vec2 sizeTex_maskTex ;

vec2 maskCoord() {
	
	vec2 size_ratio = size_maskTex/size_baseTex ;
	
	vec2 offsetStart_baseTex = vec2( uv_baseTex.r , uv_baseTex.g ) ;
	vec2 offsetStart_maskTex = vec2( uv_maskTex.r , uv_maskTex.g ) ;
	offsetStart_baseTex = offsetStart_baseTex*sizeTex_baseTex ;
	offsetStart_maskTex = offsetStart_maskTex*sizeTex_maskTex ;
	//vec2 offsetEnd_baseTex   = vec2( uv_baseTex.b , uv_baseTex.a ) ; //not used
	//vec2 offsetEnd_maskTex   = vec2( uv_maskTex.b , uv_maskTex.a ) ;
	
	vec2 uvLen_baseTex = vec2( uv_baseTex.b-uv_baseTex.r , uv_baseTex.a-uv_baseTex.g ) ;
	vec2 uvLen_maskTex = vec2( uv_maskTex.b-uv_maskTex.r , uv_maskTex.a-uv_maskTex.g ) ;
	uvLen_baseTex = uvLen_baseTex*sizeTex_baseTex ;
	uvLen_maskTex = uvLen_maskTex*sizeTex_maskTex ;
	
	vec2 tex_maskCoord = 
	( (tex_baseCoord - offsetStart_baseTex )*(uvLen_maskTex / uvLen_baseTex)/size_ratio ) + offsetStart_maskTex
	-xy_maskTex*uvLen_baseTex/size_baseTex*uvLen_maskTex/uvLen_baseTex/size_ratio ;
	
	return tex_maskCoord ;
}

void main() {
	
	
	
	vec2 tex_maskCoord = maskCoord() ;
	
	vec4 tex_base = texture2D( gm_BaseTexture , tex_baseCoord ) ;
	vec4 tex_mask = texture2D( gm_maskTexture , tex_maskCoord ) ;
	vec4 tex_result = vec4( tex_mask.a ) * ( tex_base.rgba ) ;
	
    gl_FragColor = tex_result ;
}
