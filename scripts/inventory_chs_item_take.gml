///inventory_number
inventory_chs_get_vars(argument0,0);

///Id = -1 -> Slot closed
    for (u = 0; u < cts; u ++){//x
    
inventory_chs_get_vars(argument0,u);

if (xsstr = "L"){xsstr = view_xview;} if (xsstr = "R"){xsstr = view_wdview();}
if (ysstr = "U"){ysstr = view_yview;} if (ysstr = "D"){ysstr = view_hdview();}
xslot = xsstr+xcord;
yslot = ysstr+ycord;
        if ( global.inventory_chs_slot[u+idd,0] != -1){
        if (sltpe == global.inventory_mouse_stat[1] || (global.inventory_mouse_stat[1] == 0 && global.inventory_mouse_stat[0] == 0)){
            if (mouse_in(xslot,yslot,xslot+xsize,yslot+ysize)){
                for (p = 0; p < stt; p ++){
                trashvariable = global.inventory_chs_slot[u+idd,p];
                global.inventory_chs_slot[u+idd,p] = global.inventory_mouse_stat[p];
                global.inventory_mouse_stat[p] = trashvariable;
                }
            }
        }
    }
}
