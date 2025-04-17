function wms_surface_reference_handler() constructor {
	#region documentation
		/*
		Class contains hash map which contains all the names of buttons which should be stored
		When we try to draw button, we can check whether its surface should be taken from
		reference container (due to hm its quick)

		*/
	#endregion
	surface_reference_container = ["close_button_64x32", "ok_button_64x32"];
	surface_reference_map = ds_map_create();
	
	#region public methods
	static draw_update_surfaces = function ()  {
		for (var i = 0; i < len(surface_reference_container); ++i) {
			var settings = get_button_settings(surface_reference_container[i]);
		}
	}
	static clean_up = function () {
		ds_map_destroy(surface_reference_map);
	}
	#endregion
	
	#region private methods
		
	#endregion
	
}