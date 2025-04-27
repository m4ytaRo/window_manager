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
		
		name = _name
		
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
						draw_mode(BUTTON_DRAW_MODE_TYPE.STANDARD);
						surface_reset_target();
					#endregion
					
					#region cursored surface
						if (!surface_exists(surface_cursored)) {
							surface_cursored = surface_create(xlen, ylen)
						}
						surface_set_target(surface_cursored);
						draw_mode(BUTTON_DRAW_MODE_TYPE.CURSORED);
						surface_reset_target();
					#endregion
					
					#region activated surface
						if (!surface_exists(surface_activated)) {
							surface_activated = surface_create(xlen, ylen)
						}
						surface_set_target(surface_activated);
						draw_mode(BUTTON_DRAW_MODE_TYPE.ACTIVATED);
						surface_reset_target();
					#endregion
					
					#region pressed surface
						if (!surface_exists(surface_pressed)) {
							surface_pressed = surface_create(xlen, ylen)
						}
						surface_set_target(surface_pressed);
						draw_mode(BUTTON_DRAW_MODE_TYPE.PRESSED);
						surface_reset_target();
					#endregion
						
				#endregion
			}
		}
	#endregion
	
	#region public methods
		static draw = function (_delta_struc) {
			var lx, ly;
			if (_delta_struc == undefined) {
				lx = x;
				ly = y;
			}
			else {
				lx = _delta_struc.x;
				ly = _delta_struc.y;
			}
			draw_update_surfaces();
			
			if (tick_cursored) {
				if (tick_clicked)
					draw_surface(surface_pressed, lx, ly);
				else
					draw_surface(surface_cursored, lx, ly);
			}
			else 
				if (activated)
					draw_surface(surface_activated, lx, ly);
				else
					draw_surface(surface_standard, lx, ly);
		}
		static draw_mode = function (_argument, _name) {
			//_name argument should be used only in case you call this method as class method from outside
			var local_name = (_name == undefined) ? name : _name;
			var settings = get_button_settings(local_name);

			var pattern = settings.pattern;
			var txtparam = settings.txtparam;
			var sprite_data = settings.sprite_data;
			
			coord_structure = {x : x, y : y, xlen : xlen, ylen : ylen}
			
			switch (_argument) {
				case BUTTON_DRAW_MODE_TYPE.STANDARD:
					draw_rectangle_pattern(coord_structure, pattern, txtparam, _argument, [undefined, -1, 0, 0, 1])
				break
				case BUTTON_DRAW_MODE_TYPE.CURSORED:
					draw_rectangle_pattern(coord_structure, pattern, txtparam, _argument, [undefined, -1, 0, 0, 1])
				break
				case BUTTON_DRAW_MODE_TYPE.PRESSED:
					draw_rectangle_pattern(coord_structure, pattern, txtparam, _argument, [undefined, -1, 0, 0, 1])
				break
				case BUTTON_DRAW_MODE_TYPE.PRESSED:
					draw_rectangle_pattern(coord_structure, pattern, txtparam, _argument, [undefined, -1, 0, 0, 1])
				break
			}
			
		}
		static update = function () {
			
			tick_cursored = point_in_rectangle(mouse_x, mouse_y, x, y, x + xlen, y + ylen);
			tick_clicked = tick_cursored * global.tick_mbl;
			if (!tick_cursored)
				return;
			
			
		}
	#endregion
	
}