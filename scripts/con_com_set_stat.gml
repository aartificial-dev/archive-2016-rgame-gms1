/// stat, to
//hp, mhp, mp, mmp, hl, mhl
switch (string(ds_list_find_value(argument0, 0)))
{
    case "hp" : obj_pl.hp  = real(string_digits(argument1)); console_out("@Log: Health set to "+string_digits(argument1)+".");     break;
    case "mhp": obj_pl.mhp = real(string_digits(argument1)); console_out("@Log: Max health set to "+string_digits(argument1)+"."); break;
    
    case "mp" : obj_pl.mp  = real(string_digits(argument1)); console_out("@Log: Ammo set to "+string_digits(argument1)+".");       break;
    case "mmp": obj_pl.mmp = real(string_digits(argument1)); console_out("@Log: Max ammo set to "+string_digits(argument1)+".");   break;
    
    case "hl" : obj_pl.hl  = real(string_digits(argument1)); console_out("@Log: Medkit set to "+string_digits(argument1)+".");     break;
    case "mhl": obj_pl.mhl = real(string_digits(argument1)); console_out("@Log: Max medkit set to "+string_digits(argument1)+"."); break;
    
    default: console_out("@Error: Can't find stat *"+string(argument0)+"*.");
}
