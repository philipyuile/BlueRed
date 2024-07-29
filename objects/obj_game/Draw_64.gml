/// @description Insert description here
// You can write your code in this editor
draw_text(10, 10,  "Score: " + string(points) + "   Wave: " + string(current_wave));


draw_set_halign(fa_center);
draw_set_valign(fa_middle);


if (game_status == GameStatusEnum.GAME_OVER)
{
	draw_text(room_width / 2, room_height / 2, "Game Over!");
	var lay_id = layer_get_id("bkground_mask");
	var bkground_id = layer_background_get_id(lay_id);
	var current_alpha = layer_background_get_alpha(bkground_id);
	layer_background_alpha(bkground_id, current_alpha + 0.01);
	current_alpha = layer_background_get_alpha(bkground_id);
}
else if (game_status == GameStatusEnum.WAVE_COMPLETE_ONE || game_status == GameStatusEnum.WAVE_COMPLETE_TWO)
{
	draw_text(room_width / 2, room_height / 2, "Wave " + string(current_wave) + " Complete!");
}
	
draw_set_halign(fa_left);
draw_set_valign(fa_top);