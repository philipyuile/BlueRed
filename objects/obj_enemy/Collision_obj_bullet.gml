/// @description Insert description here
// You can write your code in this editor

if other.sprite_index = spr_bullet_red && colour == "blue"
{
	var ricochet_sound = choose(snd_ricochet1,snd_ricochet2,snd_ricochet3,snd_ricochet4);
	audio_play_sound(ricochet_sound, 10, false);
	effect_create_above(ef_spark, x, y, 1, $3333FF);
	instance_destroy(other);
	return;
}

if other.sprite_index = spr_bullet_blue && colour == "red"
{
	var ricochet_sound = choose(snd_ricochet1,snd_ricochet2,snd_ricochet3,snd_ricochet4);
	audio_play_sound(ricochet_sound, 10, false);
	effect_create_above(ef_spark, x, y, 1, $FF3333);
	instance_destroy(other);
	return;
}

instance_destroy(other);
var boom_sound = choose(snd_boom1,snd_boom2,snd_boom3,snd_boom4,snd_boom5);
audio_play_sound(boom_sound, 10, false);
effect_create_above(ef_explosion, x, y, 1, c_white);
obj_game.points++;


instance_destroy();
