///console_set_init(var, value, inform);
switch (argument0){
  case "con_width" :
    con_width = argument1;
  break;
  
  case "con_height":
    con_height = argument1;
  break;
  
  case "con_sprite":
    con_sprite = argument1;
  break;
  
  case "con_font":
    con_font = argument1;
  break;
  
  case "con_x":
    con_x = argument1;
  break;
  
  case "con_y":
    con_y = argument1;
  break;
    
  case "con_open_speed":
    con_open_speed = argument1;
  break;
    
  default:
    console_error("variable", argument0, "console_get_init(var)");
    exit;
}
if (argument2){
  console_out("@Console: variable '"+string(argument0)+"' changed to"+string(argument1));
}








