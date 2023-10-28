#define effect_bloom_create
///
for (i = 1; i < 6; i++){
bloom[i]=surface_create(room_width/power(2,i),room_height/power(2,i));
surface_set_target(bloom[i]);
draw_clear(c_black);
surface_reset_target();
}


#define effect_bloom_check

if (surface_exists(bloom[1])){
if (surface_exists(bloom[2])){
if (surface_exists(bloom[3])){
if (surface_exists(bloom[4])){
if (surface_exists(bloom[5])){
return 0;
}}}}}

effect_bloom_create();
return 1;

#define effect_bloom_draw
///enable_bloom
if (argument0==true){
texture_set_interpolation(true);
draw_set_blend_mode(bm_add);
for (i = 1; i < 6; i ++)
{
draw_surface_stretched_ext(bloom[i],0,0,room_width,room_height,c_white,0.5);
}
draw_set_blend_mode(bm_normal);}


#define effect_bloom_init
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

#define effect_bloom_start_init
surface_set_target(bloom[1]);
d3d_set_projection_ortho(0,0,room_width,room_height,0);
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(0,0,room_width,room_height,0); // Clear the surface to clear the "trails" effect
draw_set_alpha(1);

#define effect_bloom_end_init
surface_reset_target();
for (i = 2; i < 6; i ++){
surface_set_target(bloom[i]);
draw_surface_ext(bloom[i-1],0,0,0.5,0.5,0,c_white,1);
surface_reset_target();
}
#define effect_bloom_end
for (i = 1; i < 6; i++){
if (surface_exists(bloom[i])){
surface_free(bloom[i]);}
}

#define effect_motion_blur
///sprite_index, iamge_number
texture_set_interpolation(true);
dist=point_distance(x,y,xprevious,yprevious)
dire=point_direction(x,y,xprevious,yprevious)
for(i=0;i<dist;i+=1){
            draw_sprite_ext(argument0,argument1,x+lengthdir_x(i,dire),y+lengthdir_y(i,dire),image_xscale,image_yscale,image_angle,image_blend,0.05)
}           
draw_sprite_ext(argument0,argument1,x,y,image_xscale,image_yscale,image_angle,image_blend,0.5+(0.5-dist/100))

#define effect_light_draw_start
///enable_light, light_surface
if (argument0==true){//If light enabled
    if surface_exists(argument1)
        {//If light surface exists
        surface_set_target(argument1);
        draw_clear_alpha(c_black, 1);//Clear surface
        draw_set_blend_mode(bm_subtract);
        return(argument1);
        }
    else
        {//If NOT light surface exists
        goo = surface_create(room_width / 2, room_height / 2);
        return(effect_light_draw_start(1,goo));
        }
    }

#define effect_light_draw
///enable_light, light_id
if (argument0==true){
if (argument1 != null){
with (argument1)
    {
    draw_sprite_ext(sprite_index, image_index, x / 2, y / 2, light_size, light_size, image_angle, light_colour, light_strength);
    }
    draw_set_blend_mode(bm_add);
with (argument1)
    {
    draw_sprite_ext(sprite_index, image_index, x / 2, y / 2, light_size, light_size, image_angle, light_colour, light_strength/2);
    }}
    }

#define effect_light_draw_end
///enable_light, ligth_surface, light_alpha
if (argument0==true){
draw_set_blend_mode(bm_normal);
surface_reset_target();
texture_set_interpolation(true);
draw_surface_ext(argument1, 0, 0, 2, 2, 0, c_white, argument2);
}

#define effect_light_end
///surface_id
if (surface_exists(argument0)){
surface_free(argument0);
}
#define effect_rlight_create
///light_size, light_colour, light_strength, light_sprite
light_size = argument0;
light_size_normal = argument0;
light_colour = argument1;
light_strength = argument2;
sprite_index = argument3;

#define effect_rlight_flick
///min_max
var dif = choose(0.01,-0.01,0);
light_size += dif;
light_size = clamp(light_size,light_size_normal-argument0,light_size_normal+argument1);