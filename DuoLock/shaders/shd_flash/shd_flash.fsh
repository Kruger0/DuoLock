//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
	vec4 fragcol = texture2D(gm_BaseTexture, v_vTexcoord);
	if (fragcol.a < 0.5) {
		discard;
	}
    gl_FragColor = mix(vec4(vec3(1.0), fragcol.a), fragcol, 1.0-v_vColour.a);
}
