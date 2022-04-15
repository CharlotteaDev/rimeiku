shader_type canvas_item;

void fragment() 
{
	vec4 color = texture(TEXTURE, UV);
	color.rgb = mix(color.rgb, vec3(0.25,0.25,0.25).rgb, 1);
	COLOR = color;
}