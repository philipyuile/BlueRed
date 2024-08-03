/// @description Insert description here
// You can write your code in this editor
current_wave = 1;
max_waves = get_max_waves();
current_wave_queue = load_wave_from_file(current_wave);
inactive_bullet_queue = ds_queue_create();

points = 0;
fire_delay_count = 0;
frame_count = 0;

upgrade_drop_array = [50,100,250,450,700,1100,1700,2500,3400,4500];


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