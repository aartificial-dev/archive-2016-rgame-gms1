///enable_light, ligth_surface, light_alpha
if (argument0==true){
draw_set_blend_mode(bm_normal);
surface_reset_target();
texture_set_interpolation(true);
draw_surface_ext(argument1, 0, 0, 2, 2, 0, c_white, argument2);
}
