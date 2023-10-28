///console_draw(open);
console_act();
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

