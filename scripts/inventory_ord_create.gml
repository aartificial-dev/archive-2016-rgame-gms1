#define inventory_ord_create
///inventory_number, x_slots, y_slots, many_stats, x_size, y_size, x_rel, y_rel, x_start, y_start, LR, UD
 idd = argument0*10000;
  global.inventory_ord_slot[idd,idd+1] = max(1,argument1);//x
 global.inventory_ord_slot[idd,idd+2] = max(1,argument2);//y
 global.inventory_ord_slot[idd,idd+3] = max(2,argument3);//st
 global.inventory_ord_slot[idd,idd+4] = argument4;//xs
 global.inventory_ord_slot[idd,idd+5] = argument5;//ys
 global.inventory_ord_slot[idd,idd+6] = argument6;//xr
 global.inventory_ord_slot[idd,idd+7] = argument7;//yr
 global.inventory_ord_slot[idd,idd+8] = argument8;//xst
 global.inventory_ord_slot[idd,idd+9] = argument9;//yst
 global.inventory_ord_slot[idd,idd+10] = argument10;//LR
 global.inventory_ord_slot[idd,idd+11] = argument11;//UD
for (i = 0; i < max(1,argument2); i ++){//y
    for (u = 0; u < max(1,argument1); u ++){//x
        for (p = 0; p < max(2,argument3); p ++){//st
        global.inventory_ord_slot[u+(i*100)+idd,p] = 0;///Id = -1 -> Slot closed
        }
    }
}


for (z = 0; z < 16; z ++){
global.inventory_mouse_stat[z] = 0
}


#define inventory_ord_get_vars
///ind
idd = argument0*10000;
xsl = global.inventory_ord_slot[idd,idd+1]
ysl = global.inventory_ord_slot[idd,idd+2]
stts = global.inventory_ord_slot[idd,idd+3]
xsize = global.inventory_ord_slot[idd,idd+4]
ysize = global.inventory_ord_slot[idd,idd+5] 
xrel = global.inventory_ord_slot[idd,idd+6]
yrel = global.inventory_ord_slot[idd,idd+7]
xstr = global.inventory_ord_slot[idd,idd+8]
ystr = global.inventory_ord_slot[idd,idd+9]
xsstr = global.inventory_ord_slot[idd,idd+10]
ysstr = global.inventory_ord_slot[idd,idd+11]