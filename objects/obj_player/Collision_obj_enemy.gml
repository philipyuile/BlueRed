/// @description Insert description here
// You can write your code in this editor
effect_create_above(ef_firework, x, y, 1, c_white);
var boom_sound = choose(snd_boom1,snd_boom2,snd_boom3,snd_boom4,snd_boom5);
audio_play_sound(boom_sound, 10, false, 5.0);

instance_destroy();

obj_game.game_status = GameStatusEnum.GAME_OVER;
obj_game.frame_count = 0;
obj_game.alarm[0] = 120;