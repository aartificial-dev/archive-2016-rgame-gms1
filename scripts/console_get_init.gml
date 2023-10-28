///console_get_init(var);
switch (argument0){
  case "con_width" :
   return con_width;
  break;
  
  case "con_height":
   return con_height;
  break;
  
  case "con_sprite":
   return con_sprite;
  break;
  
  case "con_font":
   return con_font;
  break;
  
  case "con_x":
   return con_x;
  break;
  
  case "con_y":
   return con_y;
  break;
    
  case "con_open_speed":
   return con_open_speed;
  break;
    
  default:
    console_error("variable", argument0, "console_get_init(var)");
}


