#define inv_ord_create
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


#define inv_ord_get_vars
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
#define inv_ord_item_add
///inventory_number
inv_ord_get_vars(argument0);
for (i = 0; i < global.inventory_ord_slot[idd,idd+2]; i ++){//y
    for (u = 0; u < global.inventory_ord_slot[idd,idd+1]; u ++){//x
        if (inv_itm_stt[0] > 0 && global.inventory_ord_slot[u+(i*100)+idd,0] == 0){
        for (p = 0; p < global.inventory_ord_slot[idd,idd+3] ; p ++){//st
            global.inventory_ord_slot[u+(i*100)+idd,p] = inv_itm_stt[p];
            }
            return(1);
            instance_destroy();
            exit;
        }
    }
}
            return(0);

#define inv_ord_draw
///inventory_number, sprite_slot, spr_clos_slot, sprite_ind, view_enable
inv_ord_get_vars(argument0);


if (xsstr = "L"){xsstr = (view_xview*argument4);} if (xsstr = "R"){xsstr = (view_wdview()*argument4)+(view_wview[0]*(!argument4));}
if (ysstr = "U"){ysstr = view_yview*argument4;} if (ysstr = "D"){ysstr = (view_hdview()*argument4)+(view_hview[0]*(!argument4));}

///inventory_number, sprite_slot, sprite_clos_slot, sprite_ind
///Id = -1 -> Slot closed
for (i = 0; i < ysl; i ++){//y
    for (u = 0; u < xsl; u ++){//x
        if ( global.inventory_ord_slot[u+(i*100)+idd,0] != -1){
            draw_sprite(argument1,all,xsstr+xstr+((xsize+xrel)*u),ysstr+ystr+((ysize+yrel)*i));
        }else{
            draw_sprite(argument2,all,xsstr+xstr+((xsize+xrel)*u),ysstr+ystr+((ysize+yrel)*i));
        }
        if ( global.inventory_ord_slot[u+(i*100)+idd,0] > 0){
            draw_sprite(asset_get_index(string(argument3)+string(global.inventory_ord_slot[u+(i*100)+idd,0])),all,xsstr+xstr+((xsize+xrel)*u),ysstr+ystr+((ysize+yrel)*i));
        }
    }
}

if (global.inventory_mouse_stat[0] > 0){
draw_sprite(asset_get_index(string(argument3)+string(global.inventory_mouse_stat[0])),all,mouse_x,mouse_y);
}

#define inv_ord_item_take
///inv_id
inv_ord_get_vars(argument0);


if (xsstr = "L"){xsstr = (view_xview*argument4);} if (xsstr = "R"){xsstr = (view_wdview()*argument4)+(view_wview[0]*(!argument4));}
if (ysstr = "U"){ysstr = view_yview*argument4;} if (ysstr = "D"){ysstr = (view_hdview()*argument4)+(view_hview[0]*(!argument4));}

///inventory_number, sprite_slot, sprite_clos_slot, sprite_ind
///Id = -1 -> Slot closed
for (i = 0; i < ysl; i ++){//y
    for (u = 0; u < xsl; u ++){//x
    xslot = xsstr+xstr+((xsize+xrel)*u);
    yslot = ysstr+ystr+((ysize+yrel)*i);
        if ( global.inventory_ord_slot[u+(i*100)+idd,0] != -1){
            if (mouse_in(xslot,yslot,xslot+xsize,yslot+ysize)){
                for (p = 0; p < stts; p ++){
                trashvariable = global.inventory_ord_slot[u+(i*100)+idd,p];
                global.inventory_ord_slot[u+(i*100)+idd,p] = global.inventory_mouse_stat[p];
                global.inventory_mouse_stat[p] = trashvariable;
                }
            }
        }
    }
}


#define inv_ord_draw_stats
///inventory_id, upper_part, middle_part, down_part, view_enable
inv_ord_get_vars(argument0);


if (xsstr = "L"){xsstr = (view_xview*argument4);} if (xsstr = "R"){xsstr = (view_wdview()*argument4)+(view_wview[0]*(!argument4));}
if (ysstr = "U"){ysstr = view_yview*argument4;} if (ysstr = "D"){ysstr = (view_hdview()*argument4)+(view_hview[0]*(!argument4));}


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

#define inv_ord_item_effect
///inventory_number, state_name, add_to_stat
inv_ord_get_vars(argument0);
myvariablenow = 0;
for (i = 0; i < ysl; i ++){//y
    for (u = 0; u < xsl; u ++){//x\
        if ( global.inventory_ord_slot[u+(i*100)+idd,0] > 0){
            for (o = 2; o < stts; o += 2){
                if (global.inventory_ord_slot[u+(i*100)+idd,o] == argument1){
                    myvariablenow += global.inventory_ord_slot[u+(i*100)+idd,o+1];
                    global.inventory_ord_slot[u+(i*100)+idd,o+1] += argument2;
                }
            }
        }
    }
}

return(myvariablenow);

#define inv_ord_slot_toggle
///inventory_id, slotby_x, slotby_y, toggle (0 - toggle, 1 - open, 2 - close)
if (global.inventory_ord_slot[argument1+(argument2*100)+(argument0*10000),0] < 1){

if (argument3 = 0){
if (global.inventory_ord_slot[argument1+(argument2*100)+(argument0*10000),0] == 0){
global.inventory_ord_slot[argument1+(argument2*100)+(argument0*10000),0] = -1;}else{
global.inventory_ord_slot[argument1+(argument2*100)+(argument0*10000),0] = 0;
}
}

if (argument3 = 1){
global.inventory_ord_slot[argument1+(argument2*100)+(argument0*10000),0] = 0;}

if (argument3 = 2){
global.inventory_ord_slot[argument1+(argument2*100)+(argument0*10000),0] = -1;}

}

#define inv_ord_mouse_stat
///inventory_id, upper_part, middle_part, down_part, xsl, ysl
inv_ord_get_vars(argument0);


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

#define inv_chs_create
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


#define inv_chs_get_vars
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
#define inv_chs_item_add
///inventory_number
inv_chs_get_vars(argument0,0);
    for (u = 0; u < global.inventory_chs_slot[idd,idd+1]; u ++){
inv_chs_get_vars(argument0,u);
        if (inv_itm_stt[0] > 0 && global.inventory_chs_slot[u+idd,0] == 0){
        if (global.inventory_chs_slot[u+idd,idd+7] = inv_itm_stt[1]){
        for (p = 0; p < global.inventory_chs_slot[idd,idd+2] ; p ++){//st
            global.inventory_chs_slot[u+idd,p] = inv_itm_stt[p];
            }
            return(1);
            instance_destroy();
            exit;
    }
    }
}
            return(0);

#define inv_chs_item_take
///inventory_number
inv_chs_get_vars(argument0,0);

if (xsstr = "L"){xsstr = (view_xview*argument4);} if (xsstr = "R"){xsstr = (view_wdview()*argument4)+(view_wview[0]*(!argument4));}
if (ysstr = "U"){ysstr = view_yview*argument4;} if (ysstr = "D"){ysstr = (view_hdview()*argument4)+(view_hview[0]*(!argument4));}

///Id = -1 -> Slot closed
    for (u = 0; u < cts; u ++){//x
    
inv_chs_get_vars(argument0,u);


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

#define inv_chs_draw
///inventory_number, sprite_slot, sprite_clos_slot, sprite_ind, view_enable
        inv_chs_get_vars(argument0,0);
if (xsstr = "L"){xsstr = (view_xview*argument4);} if (xsstr = "R"){xsstr = (view_wdview()*argument4)+(view_wview[0]*(!argument4));}
if (ysstr = "U"){ysstr = view_yview*argument4;} if (ysstr = "D"){ysstr = (view_hdview()*argument4)+(view_hview[0]*(!argument4));}

for (u = 0; u < cts; u ++){
        inv_chs_get_vars(argument0,u);


xslot = xsstr+xcord;
yslot = ysstr+ycord;
            if ( global.inventory_chs_slot[u+idd,0] != -1){
            draw_sprite(argument1,all,xslot,yslot);
        }else{
            draw_sprite(argument2,all,xslot,yslot);
        }
        if ( global.inventory_chs_slot[u+idd,0] > 0){
            draw_sprite(asset_get_index(string(argument3)+string(global.inventory_chs_slot[u+idd,0])),all,xslot,yslot);
        }
}


if (global.inventory_mouse_stat[0] > 0){
draw_sprite(asset_get_index(string(argument3)+string(global.inventory_mouse_stat[0])),all,mouse_x,mouse_y);
}

#define inv_chs_slot_change
///inventory_number, slot_number, x, y, type, xsize, ysize
idd = argument0*10000;
global.inventory_chs_slot[argument1+idd,idd+5] = argument2;
global.inventory_chs_slot[argument1+idd,idd+6] = argument3;
global.inventory_chs_slot[argument1+idd,idd+7] = argument4;
global.inventory_chs_slot[argument1+idd,idd+8] = argument5;
global.inventory_chs_slot[argument1+idd,idd+9] = argument6;
///Id = -1 -> Slot closed


#define inv_chs_draw_stats
///inventory_id, upper_part, middle_part, down_part, view_enable
inv_chs_get_vars(argument0,0);
if (xsstr = "L"){xsstr = (view_xview*argument4);} if (xsstr = "R"){xsstr = (view_wdview()*argument4)+(view_wview[0]*(!argument4));}
if (ysstr = "U"){ysstr = view_yview*argument4;} if (ysstr = "D"){ysstr = (view_hdview()*argument4)+(view_hview[0]*(!argument4));}

        for (u = 0; u < cts; u ++){//x
inv_chs_get_vars(argument0,u);

    xslot = xsstr+xcord;
    yslot = ysstr+ycord;
        if ( global.inventory_chs_slot[u+idd,0] > 0){
            if (mouse_in(xslot,yslot,xslot+xsize,yslot+ysize)){
            
oz = 0;
draw_sprite(argument1,all,xslot,yslot+(string_height("A")*(oz+2)));
oz ++;
draw_sprite(argument2,all,xslot,yslot+(string_height("A")*(oz+2)));
draw_text(xslot,yslot+15+(string_height("A")*(oz+1)),global.inventory_chs_slot[u+idd,2]);
oz ++;
draw_sprite(argument2,all,xslot,yslot+(string_height("A")*(oz+2)));
draw_text(xslot,yslot+15+(string_height("A")*(oz+1)),global.inventory_chs_slot[u+idd,3]);
oz ++;
draw_sprite(argument2,all,xslot,yslot+(string_height("A")*(oz+2)));
text = "Type: "+string(global.inventory_chs_slot[u+idd,1]);
draw_text(xslot,yslot+15+(string_height("A")*(oz+1)),text);
oz ++;
for (j = 4; j < stt; j += 2){
if (global.inventory_chs_slot[u+idd,j+1] != 0){
draw_sprite(argument2,all,xslot,yslot+(string_height("A")*(oz+2)));
text = string(global.inventory_chs_slot[u+idd,j])+": "+string(global.inventory_chs_slot[u+idd,j+1]);
draw_text(xslot,yslot+15+(string_height("A")*(oz+1)),text);
oz ++;
}
} 
draw_sprite(argument3,all,xslot,yslot+(string_height("A")*(oz+2))); 

            }
        }
    }

#define inv_chs_item_effect
///inventory_number, state_name, add_to_stat
inv_chs_get_vars(argument0,0);
myvariablenow = 0;
    for (u = 0; u < cts; u ++){//x\\
        if ( global.inventory_chs_slot[u+idd,0] > 0){
            for (o = 2; o < stt; o += 2){
                if (global.inventory_chs_slot[u+idd,o] == argument1){
                    myvariablenow += global.inventory_chs_slot[u+idd,o+1];
                    global.inventory_chs_slot[u+idd,o+1] += argument2;
                }
            }
        }
    }
return(myvariablenow);

#define inv_chs_slot_toggle
///inventory_id, slotby_x, toggle (0 - toggle, 1 - open, 2 - close)
if (global.inventory_chs_slot[argument1+(argument0*10000),0] < 1){

if (argument2 = 0){
if (global.inventory_chs_slot[argument1+(argument0*10000),0] == 0){
global.inventory_chs_slot[argument1+(argument0*10000),0] = -1;}else{
global.inventory_chs_slot[argument1+(argument0*10000),0] = 0;
}
}

if (argument2 = 1){
global.inventory_chs_slot[argument1+(argument0*10000),0] = 0;}

if (argument2 = 2){
global.inventory_chs_slot[argument1+(argument0*10000),0] = -1;}

}

#define inv_chs_mouse_stat
///inventory_id, upper_part, middle_part, down_part, slot
inv_chs_get_vars(argument0,argument4);


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
    

#define inv_oth_item_create
///id, type, other_stats
inv_itm_stt[0] = argument0;//id
inv_itm_stt[1] = argument1;//type
inv_itm_stt[2] = argument2;//name
inv_itm_stt[3] = argument3;//lore
inv_itm_stt[4] = argument4;//state
inv_itm_stt[5] = argument5;//number
inv_itm_stt[6] = argument6;//state
inv_itm_stt[7] = argument7;//number
inv_itm_stt[8] = argument8;//state
inv_itm_stt[9] = argument9;//number
inv_itm_stt[10] = argument10;//state
inv_itm_stt[11] = argument11;//number
inv_itm_stt[12] = argument12;//state
inv_itm_stt[13] = argument13;//number
inv_itm_stt[14] = argument14;//state
inv_itm_stt[15] = argument15;//number



#define inv_oth_item_get_stat
///id, number_of_stat
return (inv_itm_stt[argument0]);

#define inv_oth_item_drop
///what_instance_create, where_x, where_y
if (global.inventory_mouse_stat[0] > 0){
myinstance = instance_create(argument1,argument2,argument0);
with (myinstance){
for (i = 0; i < 16; i ++){
inv_itm_stt[i] = global.inventory_mouse_stat[i];
global.inventory_mouse_stat[i] = 0;
}
}}

#define inv_oth_mouse_stat
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
