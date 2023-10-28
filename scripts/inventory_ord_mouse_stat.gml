///inventory_id, upper_part, middle_part, down_part, xsl, ysl
inventory_ord_get_vars(argument0);


if (xsstr = "L"){xsstr = view_xview;} if (xsstr = "R"){xsstr = view_wdview();}
if (ysstr = "U"){ysstr = view_yview;} if (ysstr = "D"){ysstr = view_hdview();}



    xslot = xsstr+xstr+((xsize+xrel)*argument4);
    yslot = ysstr+ystr+((ysize+yrel)*i);
        if ( global.inventory_ord_slot[argument4+(argument5*100)+idd,0] > 0){
            if (mouse_in(mouse_x,mouse_y,xslot+xsize,yslot+ysize)){
            
oz = 0;
draw_sprite(argument1,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));
oz ++;
draw_sprite(argument2,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));
draw_text(mouse_x,mouse_y+15+(string_height("A")*(oz+1)),global.inventory_ord_slot[argument4+(argument5*100)+idd,2]);
oz ++;
draw_sprite(argument2,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));
draw_text(mouse_x,mouse_y+15+(string_height("A")*(oz+1)),global.inventory_ord_slot[argument4+(argument5*100)+idd,3]);
oz ++;
draw_sprite(argument2,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));
text = "Type: "+string(global.inventory_ord_slot[argument4+(argument5*100)+idd,1]);
draw_text(mouse_x,mouse_y+15+(string_height("A")*(oz+1)),text);
oz ++;
for (j = 4; j < stts; j += 2){
if (global.inventory_ord_slot[argument4+(argument5*100)+idd,j+1] != 0){
draw_sprite(argument2,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));
text = string(global.inventory_ord_slot[argument4+(argument5*100)+idd,j])+": "+string(global.inventory_ord_slot[argument4+(argument5*100)+idd,j+1]);
draw_text(mouse_x,mouse_y+15+(string_height("A")*(oz+1)),text);
oz ++;
}
} 
draw_sprite(argument3,all,mouse_x,mouse_y+(string_height("A")*(oz+2)));

            }
        }
