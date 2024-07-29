// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EightWayMovement(right, left, up, down)
{
	h_input = keyboard_check(right) - keyboard_check(left);
	v_input = keyboard_check(down) - keyboard_check(up);
	
	if (h_input != 0 or v_input != 0)
	{
		dir = point_direction(0,0, h_input, v_input);
		x_speed = lengthdir_x(move_speed, dir);
		y_speed = lengthdir_y(move_speed, dir);
		
		CheckBoundaries();
		
		x += x_speed;
		y += y_speed;
	}
}

function CheckBoundaries()
{
	if (x + sprite_width >= room_width && x_speed > 0) || (x - sprite_width <= 20 && x_speed < 0)
	{
		x_speed = 0;
	}
	
	if (y + sprite_height >= room_height && y_speed > 0) || (y - sprite_height <= 0 && y_speed < 0)
	{
		y_speed = 0;
	}
}
	