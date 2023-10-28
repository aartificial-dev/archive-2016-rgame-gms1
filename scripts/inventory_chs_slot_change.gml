///inventory_number, slot_number, x, y, type, xsize, ysize
idd = argument0*10000;
global.inventory_chs_slot[argument1+idd,idd+5] = argument2;
global.inventory_chs_slot[argument1+idd,idd+6] = argument3;
global.inventory_chs_slot[argument1+idd,idd+7] = argument4;
global.inventory_chs_slot[argument1+idd,idd+8] = argument5;
global.inventory_chs_slot[argument1+idd,idd+9] = argument6;
///Id = -1 -> Slot closed

