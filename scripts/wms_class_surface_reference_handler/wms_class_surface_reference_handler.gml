function wms_surface_reference_handler() constructor {
	#region documentation
		/*
		Class contains hash map which contains all the names of buttons which should be stored
		When we try to draw button, we can check whether its surface should be taken from
		reference container (due to hm its quick)

		*/
	#endregion
	surface_reference_map		= ds_map_create();		//we need it when we draw surfaces from certain button object
	surface_reference_container = ds_list_create();		//store surfaces three by three
	surface_reference_list		= ds_list_create();		//stores single instances with parameters: name, xlen, ylen
	surface_count = 0;
	
	push_reference("close_button_64x32", 64, 32);
	push_reference("ok_button_64x32", 64, 32);
	
	#region public methods
	static draw_update_surfaces = function ()  {
		for (var i = 0; i < len(surface_reference_list); ++i) {
			var settings = get_button_settings(surface_reference_list[| i]);
			var ds_map_pos = surface_reference_container[? surface_reference_list[| i]];
			//we can do i * 3 instead, just checking whether we stored everything correctly
			#region draw_surfaces
				#region main surface
					if (!surface_exists(surface_reference_container[| ds_map_pos])) {
						surface_reference_container[| ds_map_pos] = surface_create(surface_reference_list[|i].xlen, surface_reference_list[|i].ylen)
					}
					surface_set_target(surface_reference_container[| ds_map_pos]);
					wms_button.draw_mode(BUTTON_DRAW_MODE_TYPE.STANDARD);
					surface_reset_target();
				#endregion
				
				#region cursored surface
					if (!surface_exists(surface_reference_container[| (ds_map_pos + 1)])) {
						surface_reference_container[| (ds_map_pos + 1)] = surface_create(surface_reference_list[|i].xlen, surface_reference_list[|i].ylen)
					}
					surface_set_target(surface_reference_container[| (ds_map_pos + 1)]);
					wms_button.draw_mode(BUTTON_DRAW_MODE_TYPE.CURSORED);
					surface_reset_target();
				#endregion
				
				#region activated surface
					if (!surface_exists(surface_reference_container[| (ds_map_pos + 2)])) {
						surface_reference_container[| (ds_map_pos + 2)] = surface_create(surface_reference_list[|i].xlen, surface_reference_list[|i].ylen)
					}
					surface_set_target(surface_reference_container[| (ds_map_pos + 2)]);
					wms_button.draw_mode(BUTTON_DRAW_MODE_TYPE.ACTIVATED);
					surface_reset_target();
				#endregion
						
			#endregion

			
		}
	}
	static clean_up = function () {
		ds_map_destroy(surface_reference_map);
	}
	#endregion
	
	#region private methods
	static push_reference = function (_name, _xlen, _ylen) {
		ds_list_add(surface_reference_list, {name: _name, xlen : _xlen, ylen : _ylen});
		ds_list_add(surface_reference_container, undefined);
		ds_list_add(surface_reference_container, undefined);
		ds_list_add(surface_reference_container, undefined);
		ds_map_add(surface_reference_map, _name, surface_count*3);
		++surface_count;
	}
	#endregion
	
}