///inventory_id, upper_part, middle_part, down_part
inventory_ord_get_vars(argument0);


if (xsstr = "L"){xsstr = view_xview;} if (xsstr = "R"){xsstr = view_wdview();}
if (ysstr = "U"){ysstr = view_yview;} if (ysstr = "D"){ysstr = view_hdview();}


for (i = 0; i < ysl; i ++){//y
    for (u = 0; u < xsl; u ++){//x
    xslot = xsstr+xstr+((xsize+xrel)*u);
    yslot = ysstr+ystr+((ysize+yrel)*i);
        if ( global.inventory_ord_slot[u+(i*100)+idd,0] > 0){
            if (mouse_in(xslot,yslot,xslot+xsize,yslot+ysize)){
            
oz = 0;
draw_sprite(argument1,all,xslot,yslot+(string_height("A")*(oz+2)));
oz ++;
draw_sprite(argument2,all,xslot,yslot+(string_height("A")*(oz+2)));
draw_text(xslot,yslot+15+(string_height("A")*(oz+1)),global.inventory_ord_slot[u+(i*100)+idd,2]);
oz ++;
draw_sprite(argument2,all,xslot,yslot+(string_height("A")*(oz+2)));
draw_text(xslot,yslot+15+(string_height("A")*(oz+1)),global.inventory_ord_slot[u+(i*100)+idd,3]);
oz ++;
draw_sprite(argument2,all,xslot,yslot+(string_height("A")*(oz+2)));
text = "Type: "+string(global.inventory_ord_slot[u+(i*100)+idd,1]);
draw_text(xslot,yslot+15+(string_height("A")*(oz+1)),text);
oz ++;
for (j = 4; j < stts; j += 2){
if (global.inventory_ord_slot[u+(i*100)+idd,j+1] != 0){
draw_sprite(argument2,all,xslot,yslot+(string_height("A")*(oz+2)));
text = string(global.inventory_ord_slot[u+(i*100)+idd,j])+": "+string(global.inventory_ord_slot[u+(i*100)+idd,j+1]);
draw_text(xslot,yslot+15+(string_height("A")*(oz+1)),text);
oz ++;
}
} 
draw_sprite(argument3,all,xslot,yslot+(string_height("A")*(oz+2)));

            }
        }
    }
}
