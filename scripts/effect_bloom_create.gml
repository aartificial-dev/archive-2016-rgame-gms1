///
for (i = 1; i < 6; i++){
bloom[i]=surface_create(room_width/power(2,i),room_height/power(2,i));
surface_set_target(bloom[i]);
draw_clear(c_black);
surface_reset_target();
}

