///inventory_number, state_name, add_to_stat
inventory_ord_get_vars(argument0);
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
