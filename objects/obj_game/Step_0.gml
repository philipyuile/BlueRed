/// @description Insert description here
// You can write your code in this editor

if (game_status == GameStatusEnum.WAVE_IN_PROGRESS && ds_map_exists(obj_game.current_wave_map, string(frame_count)))
{
	var current_squad = ds_map_find_value(obj_game.current_wave_map, string(frame_count));
	if (current_squad.start_formation == "end")
	{
		game_status = GameStatusEnum.LAST_SQUAD_GENERATED;
	}
	else
	{
		GenerateEnemySquad(current_squad);
	}
}
else if (game_status == GameStatusEnum.LAST_SQUAD_GENERATED && !instance_exists(obj_enemy))
{
	game_status = GameStatusEnum.WAVE_COMPLETE_ONE;
	obj_game.alarm[1] = 120;
}
else if (game_status == GameStatusEnum.WAVE_COMPLETE_ONE)
{
	var lay_id = layer_get_id("bkground_game1");
	layer_hspeed(lay_id, obj_player.speed == 0 ? -1 : obj_player.speed * -3/2);
}
else if (game_status == GameStatusEnum.WAVE_COMPLETE_TWO)
{
	var lay_id = layer_get_id("bkground_game1");
	layer_hspeed(lay_id, obj_player.speed == 0 ? -1 : obj_player.speed * -7/2);
}
else if (game_status == GameStatusEnum.GAME_OVER)
{
}

frame_count++;