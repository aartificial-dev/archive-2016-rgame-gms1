///inventory_id, upper_part, middle_part, down_part, slot
inventory_chs_get_vars(argument0,argument4);


if (xsstr = "L"){xsstr = view_xview;} if (xsstr = "R"){xsstr = view_wdview();}
if (ysstr = "U"){ysstr = view_yview;} if (ysstr = "D"){ysstr = view_hdview();}

    xslot = xsstr+xcord;
    yslot = ysstr+ycord;
        if ( global.inventory_chs_slot[argument4+idd,0] > 0){
            if (mouse_in(mouse_x,mouse_y,xslot+xsize,yslot+ysize)){
            
oz = 0;
draw_sprite(argument1,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));
oz ++;
draw_sprite(argument2,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));
draw_text(mouse_x,mouse_y+15+(string_height("A")*(oz+1)),global.inventory_chs_slot[argument4+idd,2]);
oz ++;
draw_sprite(argument2,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));
draw_text(mouse_x,mouse_y+15+(string_height("A")*(oz+1)),global.inventory_chs_slot[argument4+idd,3]);
oz ++;
draw_sprite(argument2,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));
text = "Type: "+string(global.inventory_chs_slot[argument4+idd,1]);
draw_text(mouse_x,mouse_y+15+(string_height("A")*(oz+1)),text);
oz ++;
for (j = 4; j < stt; j += 2){
if (global.inventory_chs_slot[argument4+idd,j+1] != 0){
draw_sprite(argument2,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));
text = string(global.inventory_chs_slot[argument4+idd,j])+": "+string(global.inventory_chs_slot[argument4+idd,j+1]);
draw_text(mouse_x,mouse_y+15+(string_height("A")*(oz+1)),text);
oz ++;
}
} 
draw_sprite(argument3,all,mouse_x,mouse_y+(string_height("A")*(oz+2))); 

            }
        }
    
