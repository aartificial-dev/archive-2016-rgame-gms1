///inventory_id, slotby_x, toggle (0 - toggle, 1 - open, 2 - close)
if (global.inventory_chs_slot[argument1+(argument0*10000),0] < 1){

if (argument3 = 0){
if (global.inventory_chs_slot[argument1+(argument0*10000),0] == 0){
global.inventory_chs_slot[argument1+(argument0*10000),0] = -1;}else{
global.inventory_chs_slot[argument1+(argument0*10000),0] = 0;
}
}

if (argument3 = 1){
global.inventory_chs_slot[argument1+(argument0*10000),0] = 0;}

if (argument3 = 2){
global.inventory_chs_slot[argument1+(argument0*10000),0] = -1;}

}
