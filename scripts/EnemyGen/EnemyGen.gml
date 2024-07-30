// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InitEnemyGen()
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
	
	global.no_vert_movement = function(xpos, initial_ypos) {return initial_ypos; };
	global.sin_vert_movement = function(xpos, initial_ypos) { return initial_ypos + sin(xpos / (room_width * 1/10)) * room_height / 5; };
	global.cos_vert_movement = function(xpos, initial_ypos) { return initial_ypos + cos(xpos / 100.0) * 200; };
	
	ds_map_add(formation_enemy_movement, "straight", global.no_vert_movement);
	ds_map_add(formation_enemy_movement, "sin", global.sin_vert_movement);
	ds_map_add(formation_enemy_movement, "cos", global.cos_vert_movement);

}

function GenerateEnemySquad(_squad_data)
{
	enemy_starts = ds_map_find_value(formation_enemy_starts, _squad_data.start_formation);
		
	for (i = 0; i < _squad_data.enemynumber; i++)
	{
		CreateEnemy(enemy_starts[i], _squad_data);
	}
}


function CreateEnemy(_pos, _squad_data)
{
	obj = obj_enemy;
	
	var current = instance_create_layer(_pos.xpos, _pos.ypos, "Instances", obj);
	sprite = asset_get_index("spr_" + _squad_data.enemytype + "_" +  _squad_data.colour);// == "red" ? spr_enemy1_red : spr_enemy1_blue;
	current.colour = _squad_data.colour;
	current.speed = _squad_data.xspeed;
	current.sprite_index = sprite;
	current.initial_ypos = _pos.ypos;
	current.vertical_movement_function = ds_map_find_value(formation_enemy_movement, _squad_data.movement);
}