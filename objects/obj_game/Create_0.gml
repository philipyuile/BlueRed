/// @description Insert description here
// You can write your code in this editor
current_wave = 1;
max_waves = get_max_waves();
obj_game.current_wave_map = load_wave_from_file(current_wave);

json = json_encode(obj_game.current_wave_map);

points = 0;
fire_delay_count = 0;
frame_count = 0;

game_status = GAME_STATUS_ENUM.WAVE_IN_PROGRESS;

init_enemy_gen();

enum GAME_STATUS_ENUM
{
	WAVE_IN_PROGRESS = 1,
	LAST_SQUAD_GENERATED = 2,
	WAVE_COMPLETE_ONE = 3,
	WAVE_COMPLETE_TWO = 4,
	GAME_OVER = 5
};