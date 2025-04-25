function wms_button(_name, _coord_structure) constructor {
	
	#region local variables
		x = _coord_structure.x
		y = _coord_structure.y
		xlen = _coord_structure.xlen
		ylen = _coord_structure.ylen
		
		surface_standard	= -1;
		surface_cursored	= -1;
		surface_pressed		= -1;
		surface_activated	= -1;
		
		activated = false;
		
		//tick variables
		tick_cursored = false;
		tick_clicked = false;
		//
		
	#endregion
	
	#region private methods
		static draw_update_surfaces = function () {
			if !global.surface_reference_handler.contains(name) {
				#region draw_surfaces
					#region main surface
						if (!surface_exists(surface_standard)) {
							surface_standard = surface_create(xlen, ylen)
						}
						surface_set_target(surface_standard);
						wms_button.draw_mode(BUTTON_DRAW_MODE_TYPE.STANDARD);
						surface_reset_target();
					#endregion
					
					#region cursored surface
						if (!surface_exists(surface_cursored)) {
							surface_cursored = surface_create(xlen, ylen)
						}
						surface_set_target(surface_cursored);
						wms_button.draw_mode(BUTTON_DRAW_MODE_TYPE.CURSORED);
						surface_reset_target();
					#endregion
					
					#region activated surface
						if (!surface_exists(surface_activated)) {
							surface_activated = surface_create(xlen, ylen)
						}
						surface_set_target(surface_activated);
						wms_button.draw_mode(BUTTON_DRAW_MODE_TYPE.ACTIVATED);
						surface_reset_target();
					#endregion
					
					#region pressed surface
						if (!surface_exists(surface_pressed)) {
							surface_pressed = surface_create(xlen, ylen)
						}
						surface_set_target(surface_pressed);
						wms_button.draw_mode(BUTTON_DRAW_MODE_TYPE.PRESSED);
						surface_reset_target();
					#endregion
						
				#endregion
			}
		}
	#endregion
	
	#region public methods
		static draw = function () {
			draw_update_surfaces();
		}
		static draw_mode = function (_argument) {
			
		}
	#endregion
	
}