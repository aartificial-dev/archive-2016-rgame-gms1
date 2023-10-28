surface_reset_target();
for (i = 2; i < 6; i ++){
surface_set_target(bloom[i]);
draw_surface_ext(bloom[i-1],0,0,0.5,0.5,0,c_white,1);
surface_reset_target();
}