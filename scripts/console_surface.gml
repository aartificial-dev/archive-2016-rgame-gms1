///console_surface();
if (!surface_exists(con_surf)){
  console_error("surface", "con_surf", "console_surface()");
  con_surf = surface_create(con_width, con_height);
  console_out("@Console: surface recreated");
}
