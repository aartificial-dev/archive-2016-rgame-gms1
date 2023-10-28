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
