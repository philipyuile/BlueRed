/// @description Insert description here
// You can write your code in this editor
if obj_game.game_status == GAME_STATUS_ENUM.WAVE_COMPLETE_ONE ||
	obj_game.game_status == GAME_STATUS_ENUM.WAVE_COMPLETE_TWO
{
	speed = 0;
}
else
{
	speed = 2;
}