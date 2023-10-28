///what_instance_create, where_x, where_y
if (global.inventory_mouse_stat[0] > 0){
myinstance = instance_create(argument1,argument2,argument0);
with (myinstance){
for (i = 0; i < 16; i ++){
inv_itm_stt[i] = global.inventory_mouse_stat[i];
global.inventory_mouse_stat[i] = 0;
}
}}
