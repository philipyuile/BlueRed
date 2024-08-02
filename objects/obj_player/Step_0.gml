if (obj_game.game_status == GAME_STATUS_ENUM.WAVE_COMPLETE_ONE)
{
	var _destination_x =  room_width / 2;
	var _destination_y = room_height * 5/8;

	var _distance_to_centre = point_distance(x, y, _destination_x, _destination_y);
	if (_distance_to_centre > 1)
	{
		move_towards_point(_destination_x, _destination_y, max(1, _distance_to_centre / 15));
	}
	else
	{
		obj_game.game_status = GAME_STATUS_ENUM.WAVE_COMPLETE_TWO;
		speed = 0;
	}
	return;
}
else if (obj_game.game_status == GAME_STATUS_ENUM.WAVE_COMPLETE_TWO)
{
	var _destination_x =  room_width * 1/10;
	var _destination_y = room_height * 5/8;
	
	var _distance_to_starting_point = point_distance(x, y, _destination_x, _destination_y);
	if (_distance_to_starting_point > 1)
	{
		move_towards_point(_destination_x, _destination_y, max(1, _distance_to_starting_point / 20));
	}
	else
	{
		speed = 0;
	}
	return;
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
	
	if (upgrade_levels[? current_colour + "_streams"] == 1)
	{
		instance_create_layer(x, y, "Instances", obj_bullet);
	}
	else if (upgrade_levels[? current_colour + "_streams"] == 2)
	{
		instance_create_layer(x - 5, y - 20, "Instances", obj_bullet);
		instance_create_layer(x - 5, y + 20, "Instances", obj_bullet);
	}
	else if (upgrade_levels[? current_colour + "_streams"] == 3)
	{
		instance_create_layer(x, y, "Instances", obj_bullet);
		var _inst1 = instance_create_layer(x - 5, y + 20, "Instances", obj_bullet)
		with(_inst1)
		{
			direction = 335;
		}
		var _inst2 = instance_create_layer(x - 5, y - 20, "Instances", obj_bullet)
		with(_inst2)
		{
			direction = 25;
		}
	}
	else if (upgrade_levels[? current_colour + "_streams"] == 4)
	{
		instance_create_layer(x - 5, y - 10, "Instances", obj_bullet);
		instance_create_layer(x - 5, y + 10, "Instances", obj_bullet);
		var _inst1 = instance_create_layer(x - 5, y + 20, "Instances", obj_bullet)
		with(_inst1)
		{
			direction = 330;
		}
		var _inst2 = instance_create_layer(x - 5, y - 20, "Instances", obj_bullet)
		with(_inst2)
		{
			direction = 30;
		}
	}
	
	var _laser_sound = choose(snd_laser1,snd_laser2,snd_laser3);
	
	audio_play_sound(_laser_sound, 10, false);
}
else if keyboard_check(vk_space) && obj_game.fire_delay_count > 0
{
	obj_game.fire_delay_count--;
}