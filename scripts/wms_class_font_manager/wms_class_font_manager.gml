function wms_font_manager () constructor {
	
	default_font = fnt_main;
	active_font = fnt_main;
	
	storage = ds_map_create()	//this ds map contains an array which looks like [{max width of letter}, {max height of letter}]
	static add_fonts = function (_font_list) {
		for (var i = 0; i < len(_font_list); ++i) { 
			if (ds_map_exists(storage, _font_list[i]))
				continue;
			var sum_w = 0
			var sum_h = 0
			// you need to divide it into lower and upper case
			for (var j = 35; j < 126; ++j) {
				var font_info = font_get_info(_font_list[i]).glyphs[$ chr(j)];
				sum_w += font_info.w
				sum_h += font_info.h
			}
			ds_map_add(storage, _font_list[i],[sum_w/91, sum_h/91])
		}
	}
	
	static get_data = function (_fnt) {
		return storage[? _fnt]
	}
	
	static get_active_font = function () {
		return active_font
	}
	
	static set_active_font = function (_fnt) {
		if (ds_map_exists(storage, _fnt))
			active_font = _fnt;
	}
	
	static apply_font = function () {
		draw_set_font(active_font)
	}
	
	static clean_up = function () {
		ds_map_destroy(storage);
	}
	
}