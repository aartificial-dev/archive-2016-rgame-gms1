/// debug_draw(debug_enabled, view_enable);
if (argument0= 1){
    if (fps != 60){colr = c_red;}else{colr = draw_get_colour();}
    draw_text_colour(view_xview*argument1+10,view_yview*argument1+10,'FPS '+string(fps)+'/'+string(room_speed),colr,colr,colr,colr,1);
    draw_text(view_xview*argument1+10,view_yview*argument1+10+(string_width("S")*2),'Real FPS '+string(fps_real));
    draw_text(view_xview*argument1+10,view_yview*argument1+10+(string_width("S")*4),'Objects: '+string(instance_count));
}
