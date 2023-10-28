/// debug_key(debug_enabled);
if (argument0= 1){
if (keyboard_check(vk_control) && keyboard_check(vk_shift) && keyboard_check(ord("R"))){
game_restart();
}
}

if (/*keyboard_check(vk_control) && keyboard_check(vk_shift) && */keyboard_check_pressed(vk_f3)){
          debug = 1-debug;
}

if (/*keyboard_check(vk_control) && keyboard_check(vk_shift) && */keyboard_check_pressed(vk_f2)){
          console = 1-console;
}
