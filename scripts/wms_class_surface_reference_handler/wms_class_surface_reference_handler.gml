function wms_surface_reference_handler() constructor {
	surface_reference_container = []
	surface_reference_map = ds_map_create();
	
	static clean_up = function () {
		ds_map_destroy(surface_reference_map);
	}
	
}