///enable_bloom
if (argument0==true){
texture_set_interpolation(true);
draw_set_blend_mode(bm_add);
for (i = 1; i < 6; i ++)
{
draw_surface_stretched_ext(bloom[i],0,0,room_width,room_height,c_white,0.5);
}
draw_set_blend_mode(bm_normal);}

