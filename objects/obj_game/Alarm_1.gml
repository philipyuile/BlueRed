/// @description Insert description here
// You can write your code in this editor
game_status = GAME_STATUS_ENUM.WAVE_IN_PROGRESS;
obj_player.speed = 0;
var _lay_id = layer_get_id("bkground_game1");
layer_hspeed(_lay_id, -1);
frame_count = 0;

current_wave++;

if current_wave > max_waves
{
	room_goto(rm_mainmenu);
	return;
}

obj_game.current_wave_queue = load_wave_from_file(current_wave);