shader_type canvas_item;

uniform float x_offset = .06;
uniform float y_timing = 1.;
uniform float hurt_value = 1. ;

void vertex() {
	VERTEX.x += cos(TIME * 2.* y_timing + VERTEX.y * x_offset);
	VERTEX.y += ((cos(TIME * y_timing + VERTEX.y * .45) + 1.) * .5 ) +1.;
}

void fragment() {
	COLOR.rgb = mix(COLOR.rgb, COLOR.rgb * vec3(1., 0.,0.) * COLOR.a , hurt_value);
}


