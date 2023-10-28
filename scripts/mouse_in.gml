///x1, y1, x2, y2
if (mouse_x >= argument0 && mouse_x <= argument2 && mouse_y >= argument1 && mouse_y <= argument3)
{
return(1);
exit;
}

if (mouse_x <= argument0 && mouse_x >= argument2 && mouse_y <= argument1 && mouse_y >= argument3)
{
return(1);
exit;
}

return(0);
