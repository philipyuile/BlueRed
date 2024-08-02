/// @description Insert description here
// You can write your code in this editor

if (obj_game.game_status != GAME_STATUS_ENUM.WAVE_IN_PROGRESS && obj_game.game_status != GAME_STATUS_ENUM.LAST_SQUAD_GENERATED)
{
	return;
}

if (upgrade_levels[? current_colour + "_streams"] >= max_upgrade_level)
{
	return;
}

instance_destroy(other);

upgrade_levels[? current_colour + "_streams"] += 1;

var _upgrade_sound = choose(snd_upgrade1,snd_upgrade2,snd_upgrade3,snd_upgrade4,snd_upgrade5);
audio_play_sound(_upgrade_sound, 10, false, 1.0);


if (current_colour == "red") {
	effect_create_above(ef_star, x, y, 1,  $3333FF);

}
else
{
	effect_create_above(ef_star, x, y, 1,  $FF3333);
}



