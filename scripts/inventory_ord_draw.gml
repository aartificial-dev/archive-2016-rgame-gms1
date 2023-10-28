///inventory_number, x_slots, y_slots, many_stats, x_size, y_size, x_rel, y_rel, x_start, y_start, LR, UD
inventory_ord_get_vars(argument0);


if (xsstr = "L"){xsstr = view_xview;} if (xsstr = "R"){xsstr = view_wdview();}
if (ysstr = "U"){ysstr = view_yview;} if (ysstr = "D"){ysstr = view_hdview();}

///inventory_number, sprite_slot, sprite_clos_slot, sprite_ind
///Id = -1 -> Slot closed
for (i = 0; i < ysl; i ++){//y
    for (u = 0; u < xsl; u ++){//x
        if ( global.inventory_ord_slot[u+(i*100)+idd,0] != -1){
            draw_sprite(argument1,all,xsstr+xstr+((xsize+xrel)*u),ysstr+ystr+((ysize+yrel)*i));
        }else{
            draw_sprite(argument2,all,xsstr+xstr+((xsize+xrel)*u),ysstr+ystr+((ysize+yrel)*i));
        }
        if ( global.inventory_ord_slot[u+(i*100)+idd,0] > 0){
            draw_sprite(asset_get_index(string(argument3)+string(global.inventory_ord_slot[u+(i*100)+idd,0])),all,xsstr+xstr+((xsize+xrel)*u),ysstr+ystr+((ysize+yrel)*i));
        }
    }
}

if (global.inventory_mouse_stat[0] > 0){
draw_sprite(asset_get_index(string(argument3)+string(global.inventory_mouse_stat[0])),all,mouse_x,mouse_y);
}
