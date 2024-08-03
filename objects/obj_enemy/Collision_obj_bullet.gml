/// @description Insert description here
// You can write your code in this editor

if other.sprite_index = spr_bullet_red && colour == "blue" ||
	other.sprite_index = spr_bullet_blue && colour == "red"
{
	var _effect_colour = colour == "blue" ? $3333FF : $FF3333;
	var _ricochet_sound = choose(snd_ricochet1,snd_ricochet2,snd_ricochet3,snd_ricochet4);
	audio_play_sound(_ricochet_sound, 10, false);
	effect_create_above(ef_spark, x, y, 1, _effect_colour);
	deactivate_bullet(other);
	return;
}

instance_destroy(other);
var _boom_sound = choose(snd_boom1,snd_boom2,snd_boom3,snd_boom4,snd_boom5);
audio_play_sound(_boom_sound, 10, false);
effect_create_above(ef_explosion, x, y, 1, c_white);

obj_game.points++;

//if array_contains(obj_game.upgrade_drop_array, obj_game.points)
if (obj_game.points % 10 == 0)
{
	instance_create_layer(x, y, "Instances", obj_upgrade);
}

instance_destroy();
