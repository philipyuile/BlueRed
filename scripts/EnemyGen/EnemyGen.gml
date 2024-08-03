// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function init_enemy_gen()
{
	formation_enemy_starts = ds_map_create();

	ds_map_add(formation_enemy_starts, "left",
		[
			{ xpos : room_width * 24/20, ypos : room_height * 5/10},
			{ xpos : room_width * 23/20, ypos : room_height * 4/10},
			{ xpos : room_width * 25/20, ypos : room_height * 6/10},
			{ xpos : room_width * 22/20, ypos : room_height * 3/10},
			{ xpos : room_width * 26/20, ypos : room_height * 7/10},
			{ xpos : room_width * 21/20, ypos : room_height * 2/10},
			{ xpos : room_width * 27/20, ypos : room_height * 8/10},
			{ xpos : room_width, ypos : room_height * 1/10},
			{ xpos : room_width * 28/20, ypos : room_height * 9/10},
		]
	);
	
	ds_map_add(formation_enemy_starts, "right",
		[
			{ xpos : room_width * 24/20, ypos : room_height * 5/10},
			{ xpos : room_width * 25/20, ypos : room_height * 4/10},
			{ xpos : room_width * 23/20, ypos : room_height * 6/10},
			{ xpos : room_width * 26/20, ypos : room_height * 3/10},
			{ xpos : room_width * 22/20, ypos : room_height * 7/10},
			{ xpos : room_width * 27/20, ypos : room_height * 2/10},
			{ xpos : room_width * 21/20, ypos : room_height * 8/10},
			{ xpos : room_width * 28/20, ypos : room_height * 1/10},
			{ xpos : room_width, ypos : room_height * 9/10},

		]
	);
	
	ds_map_add(formation_enemy_starts, "line",
		[
			{ xpos : room_width, ypos : room_height * 5/10},
			{ xpos : room_width, ypos : room_height * 4/10},
			{ xpos : room_width, ypos : room_height * 6/10},
			{ xpos : room_width, ypos : room_height * 3/10},
			{ xpos : room_width, ypos : room_height * 7/10},
			{ xpos : room_width, ypos : room_height * 2/10},
			{ xpos : room_width, ypos : room_height * 8/10},
			{ xpos : room_width, ypos : room_height * 1/10},
			{ xpos : room_width, ypos : room_height * 9/10},
		]
	);
	
	ds_map_add(formation_enemy_starts, "staggered",
		[
			{ xpos : room_width * 11/10, ypos : room_height * 5/10},
			{ xpos : room_width, ypos : room_height * 4/10},
			{ xpos : room_width, ypos : room_height * 6/10},
			{ xpos : room_width * 11/10, ypos : room_height * 3/10},
			{ xpos : room_width * 11/10, ypos : room_height * 7/10},
			{ xpos : room_width, ypos : room_height * 2/10},
			{ xpos : room_width, ypos : room_height * 8/10},
			{ xpos : room_width * 11/10, ypos : room_height * 1/10},
			{ xpos : room_width * 11/10, ypos : room_height * 9/10}
		]
	);

	ds_map_add(formation_enemy_starts, "column",
		[
			{ xpos : room_width, ypos : room_height / 2},
			{ xpos : room_width * 11/10, ypos : room_height / 2},
			{ xpos : room_width * 12/10, ypos : room_height / 2},
			{ xpos : room_width * 13/10, ypos : room_height / 2},
			{ xpos : room_width * 14/10, ypos : room_height / 2},
			{ xpos : room_width * 15/10, ypos : room_height / 2},
			{ xpos : room_width * 16/10, ypos : room_height / 2},
			{ xpos : room_width * 17/10, ypos : room_height / 2},
			{ xpos : room_width * 18/10, ypos : room_height / 2},
		]
	);

	ds_map_add(formation_enemy_starts, "arrow",
		[
			{ xpos : room_width, ypos : room_height * 5/10},
			{ xpos : room_width * 21/20, ypos : room_height * 4/10},
			{ xpos : room_width * 21/20, ypos : room_height * 6/10},
			{ xpos : room_width * 22/20, ypos : room_height * 3/10},
			{ xpos : room_width * 22/20, ypos : room_height * 7/10},
			{ xpos : room_width * 23/20, ypos : room_height * 2/10},
			{ xpos : room_width * 23/20, ypos : room_height * 8/10},
			{ xpos : room_width * 24/20, ypos : room_height * 1/10},
			{ xpos : room_width * 24/20, ypos : room_height * 9/10},

		]
	);
	ds_map_add(formation_enemy_starts, "backarrow",
		[
			{ xpos : room_width * 24/20, ypos : room_height * 5/10},
			{ xpos : room_width * 23/20, ypos : room_height * 4/10},
			{ xpos : room_width * 23/20, ypos : room_height * 6/10},
			{ xpos : room_width * 22/20, ypos : room_height * 3/10},
			{ xpos : room_width * 22/20, ypos : room_height * 7/10},
			{ xpos : room_width * 21/20, ypos : room_height * 2/10},
			{ xpos : room_width * 21/20, ypos : room_height * 8/10},
			{ xpos : room_width, ypos : room_height * 1/10},
			{ xpos : room_width, ypos : room_height * 9/10},
		]
	);

	formation_enemy_movement = ds_map_create();
	
	global.no_vert_movement = function(_xpos, _initial_ypos) {return _initial_ypos; };
	global.sin_vert_movement = function(_xpos, _initial_ypos) { return _initial_ypos + sin(_xpos / (room_width * 1/10)) * room_height / 5; };
	global.cos_vert_movement = function(_xpos, _initial_ypos) { return _initial_ypos + cos(_xpos / 100.0) * 200; };
	
	ds_map_add(formation_enemy_movement, "straight", global.no_vert_movement);
	ds_map_add(formation_enemy_movement, "sin", global.sin_vert_movement);
	ds_map_add(formation_enemy_movement, "cos", global.cos_vert_movement);

}

function generate_enemy_squad(_squad_data)
{
	enemy_starts = ds_map_find_value(formation_enemy_starts, _squad_data.start_formation);
		
	for (i = 0; i < _squad_data.squad_size; i++)
	{
		var _indiv_colour = "";
		switch (_squad_data.colour)
		{
			case "red" :
			case "blue" :
				_indiv_colour = _squad_data.colour;
				break;
			case "mixed":
				_indiv_colour = (i % 4 == 0 || i % 4 == 3) ? "red" : "blue";
				break;
			case "altmixed":
				_indiv_colour = (i % 4 == 0 || i % 4 == 3) ? "blue" : "red";
				break;
		}
		
		create_enemy(enemy_starts[i], _squad_data, _indiv_colour);
	}
}


function create_enemy(_pos, _squad_data, _indiv_colour)
{
	var _obj = obj_enemy;
	
	var _current = instance_create_layer(_pos.xpos, _pos.ypos, "Instances", _obj);
	var _sprite = asset_get_index("spr_" + _squad_data.type + "_" +  _indiv_colour);// == "red" ? spr_enemy1_red : spr_enemy1_blue;
	_current.colour = _indiv_colour;
	_current.speed = _squad_data.xspeed;
	_current.sprite_index = _sprite;
	_current.initial_ypos = _pos.ypos;
	_current.vertical_movement_function = ds_map_find_value(formation_enemy_movement, _squad_data.movement);
}