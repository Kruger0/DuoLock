

varying vec2 v_vTexcoord;
varying vec4 v_vColour;


uniform float		u_progress;
uniform vec3		u_color;

void main() {
	float mask = texture2D(gm_BaseTexture, v_vTexcoord).r;	
	mask = smoothstep(u_progress, u_progress+0.02, mask);
	
    gl_FragColor = vec4(u_color, 1.0-mask);
}
