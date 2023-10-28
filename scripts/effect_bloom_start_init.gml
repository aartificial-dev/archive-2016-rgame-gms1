surface_set_target(bloom[1]);
d3d_set_projection_ortho(0,0,room_width,room_height,0);
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(0,0,room_width,room_height,0); // Clear the surface to clear the "trails" effect
draw_set_alpha(1);
