///inventory_number
inventory_ord_get_vars(argument0);
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
