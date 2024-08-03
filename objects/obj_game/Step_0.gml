/// @description Insert description here
// You can write your code in this editor

while game_status == GAME_STATUS_ENUM.WAVE_IN_PROGRESS &&
	ds_queue_size(current_wave_queue) > 0 && 
	frame_count == ds_queue_head(current_wave_queue).frame_number
{
	var _current_squad = ds_queue_dequeue(current_wave_queue);
	if (_current_squad.start_formation == "end")
	{
		game_status = GAME_STATUS_ENUM.LAST_SQUAD_GENERATED;
		return;
	}
	else
	{
		generate_enemy_squad(_current_squad);
	}
}

if (game_status == GAME_STATUS_ENUM.LAST_SQUAD_GENERATED && !instance_exists(obj_enemy))
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