/// @description Insert description here
// You can write your code in this editor

if (game_status == GAME_STATUS_ENUM.WAVE_IN_PROGRESS && ds_map_exists(obj_game.current_wave_map, string(frame_count)))
{
	var _current_squad = ds_map_find_value(obj_game.current_wave_map, string(frame_count));
	if (_current_squad.start_formation == "end")
	{
		game_status = GAME_STATUS_ENUM.LAST_SQUAD_GENERATED;
	}
	else
	{
		generate_enemy_squad(_current_squad);
	}
}
else if (game_status == GAME_STATUS_ENUM.LAST_SQUAD_GENERATED && !instance_exists(obj_enemy))
{
	game_status = GAME_STATUS_ENUM.WAVE_COMPLETE_ONE;
	obj_game.alarm[1] = 120;
}
else if (game_status == GAME_STATUS_ENUM.WAVE_COMPLETE_ONE)
{
	var _lay_id = layer_get_id("bkground_game1");
	layer_hspeed(_lay_id, obj_player.speed == 0 ? -1 : obj_player.speed * -3/2);
}
else if (game_status == GAME_STATUS_ENUM.WAVE_COMPLETE_TWO)
{
	var _lay_id = layer_get_id("bkground_game1");
	layer_hspeed(_lay_id, obj_player.speed == 0 ? -1 : obj_player.speed * -7/2);
}
else if (game_status == GAME_STATUS_ENUM.GAME_OVER)
{
}

frame_count++;