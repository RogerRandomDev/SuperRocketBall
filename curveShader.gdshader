shader_type canvas_item;

void fragment() {
	float curveY=texture(TEXTURE,UV).r;
	if(UV.y-0.5>curveY-0.01&&UV.y-0.5<curveY+0.01){COLOR=vec4(1.);}else{COLOR.a=0.;}
}
