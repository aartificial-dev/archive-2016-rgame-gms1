///console_error(error, arg, where_catch);
if (argument0 != "own"){
  console_out(string(con_err_base)+string(argument0)+" '"+string(argument1)+"'. Called from '"+string(argument2)+"'");
}else{
  console_out("@Error: "+string(argument1)+". Called from '"+string(argument2)+"'");
}


