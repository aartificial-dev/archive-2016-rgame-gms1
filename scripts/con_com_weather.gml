/// scr_weather(0 - clear, 1 - rain, 2 - storm, 3 - snow);
switch (string(ds_list_find_value(argument0, 0)))
{
    case "clear": rn = 0; console_out("@Log: Weather set to clear."); break;
    case "0": rn = 0; console_out("@Log: Weather set to clear."); break;
    
    case "rain": rn = 1; console_out("@Log: Weather set to rain."); break;
    case "1": rn = 1; console_out("@Log: Weather set to rain."); break;
    
    case "storm": rn = 2; console_out("@Log: Weather set to storm."); break;
    case "2": rn = 2; console_out("@Log: Weather set to storm."); break;
    
    case "snow": rn = 3; console_out("@Log: Weather set to snow."); break;
    case "3": rn = 3; console_out("@Log: Weather set to snow."); break;
    
    default: console_out("@Error: Can't find weather *"+string(argument0)+"*.");
}
ds_list_destroy(argument0);
