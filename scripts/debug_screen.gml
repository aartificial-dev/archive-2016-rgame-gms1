/// debug_screen(screen_size);
texture_set_interpolation(false);

display_set_gui_size(display_get_width(),display_get_height());
surface_resize(application_surface,display_get_width(),display_get_height());

if (argument0 = "3:2")
{
view_hview[0] = 640;
view_wview[0] = 960;
}

if (argument0 = "4:3")
{
view_hview[0] = 600;
view_wview[0] = 800;
}

if (argument0 = "5:3")
{
view_hview[0] = 300;
view_wview[0] = 512;
}

if (argument0 = "5:4")
{
view_hview[0] = 1024;
view_wview[0] = 1280;
}

if (argument0 = "16:9")
{
view_hview[0] = 640;
view_wview[0] = 1136;
}


if (argument0 = "16:10")
{
view_hview[0] = 640;
view_wview[0] = 1024;
}


view_hport[0] = display_get_gui_height();
view_wport[0] = display_get_gui_width();
