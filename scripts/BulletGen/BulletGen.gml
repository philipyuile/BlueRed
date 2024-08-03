// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function create_bullet(_xpos, _ypos, _direction, _speed, _colour)
{
	var _new_bullet;
	if ds_queue_empty(obj_game.inactive_bullet_queue)
	{
		_new_bullet = instance_create_layer(_xpos,_ypos, "Instances", obj_bullet);
	}
	else
	{
		_new_bullet = ds_queue_dequeue(obj_game.inactive_bullet_queue);
				
		if (!instance_exists(_new_bullet))
		{
			_new_bullet = instance_create_layer(_xpos,_ypos, "Instances", obj_bullet);

		}
	}
	
	_new_bullet.x = _xpos;
	_new_bullet.y = _ypos;
	_new_bullet.direction = _direction;
	_new_bullet.speed = _speed;
	_new_bullet.sprite_index = _colour == "red" ? spr_bullet_red : spr_bullet_blue;
	_new_bullet.visible = true;
}


function deactivate_bullet(_obj_bullet)
{
	_obj_bullet.visible = false;
	_obj_bullet.speed = 0;
	_obj_bullet.x = -2 * room_width;
	_obj_bullet.y = -2 * room_height;
	ds_queue_enqueue(obj_game.inactive_bullet_queue, _obj_bullet);
}