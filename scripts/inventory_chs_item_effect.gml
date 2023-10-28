///inventory_number, state_name, add_to_stat
inventory_chs_get_vars(argument0,0);
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
