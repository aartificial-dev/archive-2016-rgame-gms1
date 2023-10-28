///object, bloom_draw, sprite, image_index
if (argument1 = 1){
colorre = c_white;
}else{
colorre = c_black;
}

with (argument0)
{
     draw_sprite_ext(argument2,argument3,x,y,1,1,image_angle,other.colorre,1);
};
