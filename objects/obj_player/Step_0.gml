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
		sprite_index = asset_get_index("spr_player_" + current_colour + "_upgrade1_flip");

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
		move_towards_point(_destination_x, _destination_y, max(1, _distance_to_starting_point / 30));
	}
	else
	{
		speed = 0;
	}
	return;
}
else if (obj_game.game_status == GAME_STATUS_ENUM.WAVE_IN_PROGRESS)
{
	sprite_index = asset_get_index("spr_player_" + current_colour + "_upgrade1");
}

EightWayMovement(vk_right, vk_left, vk_up, vk_down);
EightWayMovement(ord("D"), ord("A"), ord("W"), ord("S"));

if keyboard_check_pressed(vk_tab) || keyboard_check_pressed(ord("E"))
{
	current_colour = current_colour == "red" ? "blue" : "red";
	sprite_index = asset_get_index("spr_player_" + current_colour + "_upgrade1");
	//+ string(upgrade_levels[current_colour + "_streams"])
}

if keyboard_check(vk_space) && obj_game.fire_delay_count <= 0
{	
	obj_game.fire_delay_count = 8;
	
	if (upgrade_levels[? current_colour + "_streams"] == 1)
	{
		create_bullet(x, y, image_angle, bullet_speed, current_colour);
	}
	else if (upgrade_levels[? current_colour + "_streams"] == 2)
	{
		create_bullet(x - 5, y - 20, image_angle, bullet_speed, current_colour);
		create_bullet(x - 5, y + 20, image_angle, bullet_speed, current_colour);
	}
	else if (upgrade_levels[? current_colour + "_streams"] == 3)
	{
		create_bullet(x, y, image_angle, bullet_speed, current_colour);
		create_bullet(x - 5, y + 20, image_angle - 25, bullet_speed, current_colour);
		create_bullet(x - 5, y - 20, image_angle + 25, bullet_speed, current_colour);
	}
	else if (upgrade_levels[? current_colour + "_streams"] == 4)
	{
		create_bullet(x - 5, y - 10, image_angle, bullet_speed, current_colour);
		create_bullet(x - 5, y + 10, image_angle, bullet_speed, current_colour);
		create_bullet(x - 5, y + 20, image_angle - 30, bullet_speed, current_colour);
		create_bullet(x - 5, y - 20, image_angle + 30, bullet_speed, current_colour);
	}
	else if (upgrade_levels[? current_colour + "_streams"] == 5)
	{
		create_bullet(x, y, image_angle, bullet_speed, current_colour);
		create_bullet(x - 5, y + 20, image_angle - 20, bullet_speed, current_colour);
		create_bullet(x - 5, y - 20, image_angle + 20, bullet_speed, current_colour);
		create_bullet(x - 5, y + 20, image_angle - 40, bullet_speed, current_colour);
		create_bullet(x - 5, y - 20, image_angle + 40, bullet_speed, current_colour);
	}
	else if (upgrade_levels[? current_colour + "_streams"] == 6)
	{
		create_bullet(x - 5, y - 10, image_angle, bullet_speed, current_colour);
		create_bullet(x - 5, y + 10, image_angle, bullet_speed, current_colour);
		create_bullet(x - 5, y + 20, image_angle - 22, bullet_speed, current_colour);
		create_bullet(x - 5, y - 20, image_angle + 22, bullet_speed, current_colour);
		create_bullet(x - 5, y + 20, image_angle - 45, bullet_speed, current_colour);
		create_bullet(x - 5, y - 20, image_angle + 45, bullet_speed, current_colour);
	}
	
	var _laser_sound = choose(snd_laser1,snd_laser2,snd_laser3);
	audio_play_sound(_laser_sound, 10, false);
}
else if keyboard_check(vk_space) && obj_game.fire_delay_count > 0
{
	obj_game.fire_delay_count--;
}