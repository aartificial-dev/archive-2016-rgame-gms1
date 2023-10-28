#define inventory_chs_create
///inventory_number, count_slots, many_stats, x_size, y_size
idd = argument0*10000;
 global.inventory_chs_slot[idd,idd+1] = max(1,argument1);//cts
 global.inventory_chs_slot[idd,idd+2] = max(2,argument2);//st
 global.inventory_chs_slot[idd,idd+3] = argument3;//xs
 global.inventory_chs_slot[idd,idd+4] = argument4;//ys
 

for (u = 0; u < max(1,argument1); u ++){//x
    for (p = 0; p < max(2,argument2); p ++){//st
        global.inventory_chs_slot[u+idd,p] = 0;///Id = -1 -> Slot closed
    }
}



for (z = 0; z < 16; z ++){
global.inventory_mouse_stat[z] = 0
}


#define inventory_chs_get_vars
///ind
idd = argument0*10000;
cts = global.inventory_chs_slot[idd,idd+1]//cts
stt = global.inventory_chs_slot[idd,idd+2]//st
xsize = global.inventory_chs_slot[idd,idd+3]//xs
ysize = global.inventory_chs_slot[idd,idd+4]//ys

xcord = global.inventory_chs_slot[idd+argument1,idd+5]
ycord = global.inventory_chs_slot[idd+argument1,idd+6]
sltpe = global.inventory_chs_slot[idd+argument1,idd+7]
xsstr = global.inventory_chs_slot[idd+argument1,idd+8]
ysstr = global.inventory_chs_slot[idd+argument1,idd+9]