if (obj_game.game_status == GameStatusEnum.WAVE_COMPLETE_ONE)
{
	var destination_x =  room_width / 2;
	var destination_y = room_height * 5/8;

	var distance_to_centre = point_distance(x, y, destination_x, destination_y);
	if (distance_to_centre > 1)
	{
		move_towards_point(destination_x, destination_y, max(1, distance_to_centre / 15));
	}
	else
	{
		obj_game.game_status = GameStatusEnum.WAVE_COMPLETE_TWO;
		speed = 0;
	}
	return;
}
else if (obj_game.game_status == GameStatusEnum.WAVE_COMPLETE_TWO)
{
	var destination_x =  room_width * 1/10;
	var destination_y = room_height * 5/8;
	
	var distance_to_starting_point = point_distance(x, y, destination_x, destination_y);
	if (distance_to_starting_point > 1)
	{
		move_towards_point(destination_x, destination_y, max(1, distance_to_starting_point / 20));
	}
	else
	{
		speed = 0;
	}
}

EightWayMovement(vk_right, vk_left, vk_up, vk_down);
EightWayMovement(ord("D"), ord("A"), ord("W"), ord("S"));

if keyboard_check_pressed(vk_tab) || keyboard_check_pressed(ord("E"))
{
	if current_colour == "red"
	{
		sprite_index = spr_player_blue;
		current_colour = "blue";
	}
	
	else if current_colour == "blue"
	{
		sprite_index = spr_player_red;
		current_colour = "red";
	}
}

if keyboard_check(vk_space) && obj_game.fire_delay_count <= 0
{	
	obj_game.fire_delay_count = 8;
	instance_create_layer(x, y, "Instances", obj_bullet);
	
	var laser_sound = choose(snd_laser1,snd_laser2,snd_laser3);
	
	audio_play_sound(laser_sound, 10, false);
}
else if keyboard_check(vk_space) && obj_game.fire_delay_count > 0
{
	obj_game.fire_delay_count--;
}