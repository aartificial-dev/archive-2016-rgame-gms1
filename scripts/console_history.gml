///console_history();
if (!ds_exists(con_history, ds_type_list)){
  con_history = ds_list_create();
  console_error("ds_list", "con_histoy", "console_history()");
  console_out("@Console: ds_list recreated");
}
