///enable_light, light_surface
if (argument0==true){//If light enabled
    if surface_exists(argument1)
        {//If light surface exists
        surface_set_target(argument1);
        draw_clear_alpha(c_black, 1);//Clear surface
        draw_set_blend_mode(bm_subtract);
        return(argument1);
        }
    else
        {//If NOT light surface exists
        goo = surface_create(room_width / 2, room_height / 2);
        return(effect_light_draw_start(1,goo));
        }
    }
