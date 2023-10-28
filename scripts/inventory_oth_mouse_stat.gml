///up, mid, down
if (global.inventory_mouse_stat[0] != 0){

oz = 0;
draw_sprite(argument0,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));
oz ++;
draw_sprite(argument1,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));
draw_text(mouse_x,mouse_y+15+(string_height("A")*(oz+1)),global.inventory_mouse_stat[2]);
oz ++;
draw_sprite(argument1,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));
draw_text(mouse_x,mouse_y+15+(string_height("A")*(oz+1)),global.inventory_mouse_stat[3]);
oz ++;
draw_sprite(argument1,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));
text = "Type: "+string(global.inventory_mouse_stat[1]);
draw_text(mouse_x,mouse_y+15+(string_height("A")*(oz+1)),text);
oz ++;
for (j = 4; j < stt; j += 2){
if (global.inventory_mouse_stat[j+1] != 0){
draw_sprite(argument1,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));
text = string(global.inventory_mouse_stat[j])+": "+string(global.inventory_mouse_stat[j+1]);
draw_text(mouse_x,mouse_y+15+(string_height("A")*(oz+1)),text);
oz ++;
}
} 
draw_sprite(argument2,all,mouse_x,mouse_y+(string_height("A")*(oz+2))); 

}
