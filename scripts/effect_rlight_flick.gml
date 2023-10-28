///min_max
var dif = choose(0.01,-0.01,0);
light_size += dif;
light_size = clamp(light_size,light_size_normal-argument0,light_size_normal+argument1);