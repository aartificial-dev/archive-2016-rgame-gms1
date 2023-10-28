///inventory_number, sprite_slot, sprite_clos_slot, sprite_ind
        inventory_chs_get_vars(argument0,0);

for (u = 0; u < cts; u ++){
        inventory_chs_get_vars(argument0,u);

if (xsstr = "L"){xsstr = view_xview;} if (xsstr = "R"){xsstr = view_wdview();}
if (ysstr = "U"){ysstr = view_yview;} if (ysstr = "D"){ysstr = view_hdview();}
xslot = xsstr+xcord;
yslot = ysstr+ycord;
            if ( global.inventory_chs_slot[u+idd,0] != -1){
            draw_sprite(argument1,all,xslot,yslot);
        }else{
            draw_sprite(argument2,all,xslot,yslot);
        }
        if ( global.inventory_chs_slot[u+idd,0] > 0){
            draw_sprite(asset_get_index(string(argument3)+string(global.inventory_chs_slot[u+idd,0])),all,xslot,yslot);
        }
}


if (global.inventory_mouse_stat[0] > 0){
draw_sprite(asset_get_index(string(argument3)+string(global.inventory_mouse_stat[0])),all,mouse_x,mouse_y);
}
