// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_wave_from_file(_wave_number){
	var _filepath = working_directory + "wave" + string(_wave_number) + ".txt";
	var _file = file_text_open_read(_filepath);
	
	var _wave_queue = ds_queue_create();
	
	while (true)
	{
		var _current_line = string_trim(file_text_readln(_file));
		var _current_tokens = string_split(_current_line, ",");
		var _frame_number = _current_tokens[0];
		if (array_length(_current_tokens) > 2) {
			var _squad_data =
			{
				frame_number : _current_tokens[0],
				squad_size : _current_tokens[1],
				start_formation : _current_tokens[2],
				movement : _current_tokens[3],
				colour : _current_tokens[4],
				type : _current_tokens[5],
				xspeed : _current_tokens[6]
			}
			ds_queue_enqueue(_wave_queue, _squad_data);
		}
		else
		{
			var _end_data = {frame_number : _current_tokens[0], start_formation : _current_tokens[1] };
			ds_queue_enqueue(_wave_queue, _end_data);
			file_text_close(_file);
			break;
		}
	}
	
	return _wave_queue;
}

function get_max_waves() {
	var _current_wave_number = 0;
	var _filepath = "";
	do {		
		_current_wave_number++;
		_filepath = working_directory + "wave" + string(_current_wave_number) + ".txt";	
	} until (!file_exists(_filepath));
	
	return _current_wave_number - 1;
}