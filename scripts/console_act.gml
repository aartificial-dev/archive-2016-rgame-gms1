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
