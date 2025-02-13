
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
	vec4 fragcol = v_vColour;
	fragcol.a = smoothstep(0.4, 1.0, v_vTexcoord.y);
    gl_FragColor = fragcol;
}
