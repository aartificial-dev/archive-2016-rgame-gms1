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

var _bool = false;
var arg_number = 0;
for (var t = 0; t < con_ars; t ++){
  if (con_fnc[t,0] == func){
    _bool = true;
    arg_number = con_fnc[t,1];//check function in list
    break;
  }
}
if (_bool == false){
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
