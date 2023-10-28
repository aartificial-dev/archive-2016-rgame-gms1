#define console_init
///console_init(width, height, sprite, font, x_start, y_start, open_speed);
con_width = argument0;
con_height = argument1;
con_sprite = argument2;
con_font = argument3;
con_x = argument4;
con_y = argument5;
con_open_speed = argument6;

con_slide = 0;

con_err_base = "@Error: Can't find ";


con_text = "";
con_del = 0;

con_history = ds_list_create();

con_opened = 0;

con_surf = surface_create(con_width, con_height);


con_caret = 0;


//con_fun = ds_list_create();
//con_arg = ds_list_create();
con_ars = 0;
for (var i = con_ars; i < 1000; i ++){
  fnc[i,0] = "";//Function name
  fnc[i,1] = 0;//How many takes arguments
  fnc[i,2] = "";//Help
}

console_add("help", 0, "");
console_add("cls", 0,"");
console_add("summon", 3,"x, y, object");

#define console_act
///console_act();
if (con_opened >= con_height-1){////////////////////////////


if (keyboard_check_released(vk_enter)){
    if (con_text != ""){
//    console_out("]"+string(con_text));
    console_command(con_text);
    con_text = "";
  }
}
  

  //////TEXT FIELD//////
  if (keyboard_check_pressed(vk_backspace)){
    con_text = string_delete(con_text, con_caret, 1);
    con_caret --;
  }
  if (keyboard_check_pressed(vk_delete)){
    con_text = string_delete(con_text, con_caret+1, 1);
  }
  con_caret += keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left);
  con_caret = clamp(con_caret, 0, string_length(con_text));
  
  var input = string_char_at(keyboard_string, string_length(keyboard_string));
  
  con_text = string_insert(input, con_text, con_caret+1);
  if (input != ""){ con_caret ++;}
  

  for (var i = 0; i < string_length(con_text); i ++){//Remove bad chars
  var tmp = string_char_at(con_text, i+1);
    if ((tmp == " " && string_char_at(con_text, i+2) == " ") 
    || tmp == "@" || tmp == "#" || tmp == "]" || tmp == ";" || tmp == "~" || tmp == "`"){
      con_text = string_delete(con_text, i+1, 1);
      i--;
    }
    if (tmp == ")"){
      con_text = string_delete(con_text, i+2, string_length(con_text));
    }
  }
  if (string_char_at(con_text, 1) == " "){
      con_text = string_delete(con_text, 1, 1);
  }
  
  
}//////////////////////////////////////////////////////////
keyboard_string = "";

#define console_command
///console_command(string);
var command = argument0;
var com = string(command)+";;";//add end of command


for (var i = 0; i < string_length(com); i ++){
  if (string_copy(com, i+1, 1) == " "){
    com = string_delete(com,i+1, 1);//delete spaces
    i--;
  }
}

var func = "";
var arg = ds_list_create();


while (string_copy(com, 1, 1) != ";" && string_copy(com, 1, 1) != "("){
  if (string_copy(com, 1, 1) == ")"){
    console_error("own", "missing '('", "console_command('"+string(command)+"')");
    ds_list_destroy(arg);
    exit;
  }
  func += string_copy(com, 1, 1);//get function
  com = string_delete(com, 1, 1);
}
if (string_copy(com, 1, 1) == "(" && string_copy(com, 2, 1) == ";"){
    console_error("own", "missing ')'", "console_command('"+string(command)+"')");
    ds_list_destroy(arg);
    exit;
}
com = string_delete(com, 1, 1); // delete bracket

var bool = false;
var arg_number = 0;
for (var t = 0; t < con_ars; t ++){
  if (con_fnc[t,0] == func){
    bool = true;
    arg_number = con_fnc[t,1];//check function in list
    break;
  }
}
if (bool == false){
  console_error("function", func, "console_command('"+string(command)+"')");
  ds_list_destroy(arg);
  exit;
}




while (string_copy(com, 1, 1) != ")" && string_copy(com, 1, 1) != ";"){

var args = "";
while (string_copy(com, 1, 1) != "," && string_copy(com, 1, 1) != ")" && string_copy(com, 1, 1) != ";"){
  args += string_copy(com, 1, 1);//get args
  com = string_delete(com, 1, 1);
}
if (args == ""){
  console_error("own", " argument can't be nothing",  "console_command('"+string(command)+"')");
  ds_list_destroy(arg);
  exit;
}

if (string_copy(com, 1, 1) == ";"){
    console_error("own", "missing ')'", "console_command('"+string(command)+"')");
  ds_list_destroy(arg);
    exit;
}

if (string_copy(com, 1, 1) == "," && (string_copy(com, 2, 1) = ";" || string_copy(com, 2, 1) = ")")){
    console_error("own", "missing argument (find end of command)", "console_command('"+string(command)+"')");
    ds_list_destroy(arg);
    exit;
}

com = string_delete(com, 1, 1);



ds_list_add(arg, args);//add argument to list

}



if (ds_list_size(arg) != arg_number){
  console_error("own", "wrong argument number (" + string(ds_list_size(arg)) + ") expected (" + string(arg_number) + ")", "console_command('"+string(command)+"')");
  ds_list_destroy(arg);
  exit;
}

var z = func;
z += "(";
for (var m = 0; m < ds_list_size(arg); m++){
  if (m != 0){
    z += ", ";//outter command
  }
  z += string(ds_list_find_value(arg, m));
}
z += ")"
console_out("@Command: "+string(z));

var scr = asset_get_index("con_com_"+string(func));
if (!script_exists(scr)){
  console_error("script", func, "console_command('"+string(command)+"')");
  ds_list_destroy(arg);
  exit;
}
script_execute(scr, arg);


//con_com_

#define console_get_init
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



#define console_set_init
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









#define console_error
///console_error(error, arg, where_catch);
if (argument0 != "own"){
  console_out(string(con_err_base)+string(argument0)+" '"+string(argument1)+"'. Called from '"+string(argument2)+"'");
}else{
  console_out("@Error: "+string(argument1)+". Called from '"+string(argument2)+"'");
}



#define console_out
///console_out(string);
var temp = argument0;
ds_list_insert(con_history, 0, temp);


#define console_draw
///console_draw(open);
/*console_act();
console_surface();

var temp_w = string_width("T")/2;
var temp_h = string_height("T")/2;

if (argument0 == true){
  con_opened += mean(con_open_speed, con_opened); 
}
if (argument0 == false){
  con_opened -= mean(con_open_speed, con_opened); 
}


con_opened = clamp(con_opened, 0, con_height);
con_slide = clamp(con_slide, 0, ds_list_size(con_history)-1);

var temp_col;
temp_col = draw_get_colour();


draw_set_font(con_font);
var temp = "";
var i = 0;
if (ds_list_size(con_history) > 0){
  while (string_height(temp) < con_opened*2 && i+con_slide < ds_list_size(con_history)){
    //
    var newtemp = string(ds_list_find_value(con_history, i+con_slide));
    
    for (var p = 0; p < string_length(newtemp)-1; p ++){//Border width
      if (string_width(string_copy(newtemp, 1, p+1)) > (con_width - (temp_w*2))){
        newtemp = string_insert("#", newtemp, p);
      }
    }
    if (i != 0){
      temp += "##"
    }
    temp += newtemp;
    
    i ++;
  }
  temp += "##"
}



surface_set_target(con_surf);//DRAW HERE

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

draw_clear(c_black);
draw_set_blend_mode(bm_subtract);
draw_clear(c_white);
draw_set_blend_mode(bm_normal);


draw_set_colour(c_white);
if (sprite_exists(con_sprite)){
  draw_sprite(con_sprite, 0, 0, con_opened - con_height);
}else{
  draw_clear(c_white);
}

draw_set_colour(c_black);
var strr = "]"+string(con_text);
var t_width = temp_w - (max(0, string_width(string_copy(strr, 1, con_caret+1))+ temp_w*2 - con_width));

draw_text(t_width, con_opened-temp_w, strr);
draw_set_colour(c_maroon);//Draw text and caret
draw_text(string_width(string_copy(strr, 1, con_caret+1)) + t_width - temp_w/3, con_opened-temp_w, "|");

if (i > 0){
  var line_height = temp_h*2-temp_w;
  while (string_length(temp) > 0){
    var t_text = "";
    var prev = "";
    var t = 0;
    
    while (string_copy(temp, t+1, 2) != "##" && string_length(temp) > t){//Break to lines
      prev = string_char_at(temp, t+1);
      t_text += prev;
      t++;
    }
    
    temp = string_delete(temp, 1, t+2);
    
    draw_set_colour(c_black);
    if (string_length(t_text) > 3){
      switch(string_copy(t_text, 1, 4)){
        case "@Err":
          draw_set_colour(c_maroon);
        break;
        
        case "@Con":
          draw_set_colour(c_teal);
        break;
        
        case "@Com":
          draw_set_colour(c_purple);
        break;
        
        case "@Hel":
          draw_set_colour(c_navy);
        break;
        
        case "@Log":
          draw_set_colour(c_green);
        break;
        //INSERT COLOURED TEXT
      }
    }
    
    draw_text(temp_w, con_opened - line_height - (temp_h*3), t_text);
    line_height += string_height(t_text)+temp_h;
  }
}



surface_reset_target();//DRAW END

draw_set_colour(c_white);


draw_surface_part(con_surf, 0, 0, con_width, con_opened, con_x, con_y);

//debug
//draw_surface(con_surf, con_x, con_y);
//draw_rectangle_colour(con_x, con_y, con_x + con_width, con_y+con_opened, c_red, c_red, c_red,c_red, 1);
//debug end

draw_set_colour(temp_col);


#define console_close
///console_close();
ds_list_destroy(con_history);
surface_free(con_surf);

#define console_surface
///console_surface();
if (!surface_exists(con_surf)){
  console_error("surface", "con_surf", "console_surface()");
  con_surf = surface_create(con_width, con_height);
  console_out("@Console: surface recreated");
}

#define console_history
///console_history();
if (!ds_exists(con_history, ds_type_list)){
  con_history = ds_list_create();
  console_error("ds_list", "con_histoy", "console_history()");
  console_out("@Console: ds_list recreated");
}

#define console_add
///console_add(name, arg, help);
con_fnc[con_ars,0] = argument0;
con_fnc[con_ars,1] = argument1;
con_fnc[con_ars,2] = argument2;
con_ars ++;

#define con_com_help
///console_help();
for (var i = 0; i < con_ars; i ++){
  console_out("@Help: " + string(con_fnc[i,0]) + "(" + string(con_fnc[i,2]) + ")");
}
ds_list_destroy(argument0);

#define con_com_summon
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

#define con_com_cls
///con_com_cls();
ds_list_clear(con_history);
ds_list_destroy(argument0);