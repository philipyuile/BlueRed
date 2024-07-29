// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LoadWaveFromFile(_wave_number){
	filepath = working_directory + "wave" + string(_wave_number) + ".txt";
	var _file = file_text_open_read(filepath);
	
	var _wave_map = ds_map_create();
	
	while (true)
	{
		current_line = string_trim(file_text_readln(_file));
		current_tokens = string_split(current_line, ",");
		frame_number = current_tokens[0];
		if (array_length(current_tokens) > 2) {
			squad_data =
			{
				start_formation : current_tokens[1],
				movement : current_tokens[2],
				colour : current_tokens[3],
				enemytype : current_tokens[4],
				xspeed : current_tokens[5]
			}
			ds_map_add(_wave_map, frame_number, squad_data);
		}
		else
		{
			squad_data = { start_formation : current_tokens[1] };
			ds_map_add(_wave_map, frame_number, squad_data);
			file_text_close(_file);
			break;
		}
	}
	
	return _wave_map;
}

function GetMaxWaves() {
	var current_wave_number = 0;

	do {		
		current_wave_number++;
		filepath = working_directory + "wave" + string(current_wave_number) + ".txt";	
	} until (!file_exists(filepath));
	
	return current_wave_number - 1;
}