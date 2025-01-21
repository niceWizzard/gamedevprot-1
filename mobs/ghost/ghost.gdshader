shader_type canvas_item;

uniform float x_offset = .06;
uniform float y_timing = 1.;

void vertex() {
	VERTEX.x += cos(TIME * 2.* y_timing + VERTEX.y * x_offset);
	VERTEX.y += ((cos(TIME * y_timing + VERTEX.y * .45) + 1.) * .5 ) +1.;
}

void fragment() {
	// Called for every pixel the material is visible on.
}


