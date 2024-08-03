/// @description Insert description here
// You can write your code in this editor
current_colour = "red";
move_speed = 8;
bullet_speed = 14;

max_upgrade_level = 6;
upgrade_levels = ds_map_create();
ds_map_add(upgrade_levels, "red_streams", 1);
ds_map_add(upgrade_levels, "blue_streams", 1);
