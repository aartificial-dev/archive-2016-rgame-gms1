///enable_light, light_id
if (argument0==true){
if (argument1 != null){
with (argument1)
    {
    draw_sprite_ext(sprite_index, image_index, x / 2, y / 2, light_size, light_size, image_angle, light_colour, light_strength);
    }
    draw_set_blend_mode(bm_add);
with (argument1)
    {
    draw_sprite_ext(sprite_index, image_index, x / 2, y / 2, light_size, light_size, image_angle, light_colour, light_strength/2);
    }}
    }
