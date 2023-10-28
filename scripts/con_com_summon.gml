///con_com_summon(ds_arg);

var xto = real(string_digits( ds_list_find_value(argument0, 0) ));
var yto = real(string_digits( ds_list_find_value(argument0, 1) ));
var obj = asset_get_index(ds_list_find_value(argument0, 2));

if (obj > -1){
  console_out("@Log: object '"+string(object_get_name(obj))+"' summoned at ("+string(xto)+", "+string(yto)+")");
  instance_create(xto, yto, obj);
}else{
  console_error("object", ds_list_find_value(argument0, 2), "summon(ds_arg)");
}
ds_list_destroy(argument0);
