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
			
			switch (_argument) {
				case BUTTON_DRAW_MODE_TYPE.STANDARD:
					draw_rectangle_sprited_custom({
					local_sprite : sp_standard_button_borders,
					lt_corner_index : 0,	rt_corner_index : 1,	rb_corner_index : 2,	lb_corner_index : 3, 
					b_side_index  : 4,		r_side_index  : 5,		t_side_index  : 6,		l_side_index  : 7,
					scale : 2,				background_sprite : undefined,
					gradient_settings : {grad_clr_01 : c_gray, grad_clr_02 : c_gray, grad_clr_03 : c_gray, grad_clr_04 : c_gray}
					}, 
					{x : 0, y : 0, xlen : xlen, ylen : ylen}, 
					{text : txtparam.text, font : fnt_main, do_center : true, average_width : 8} )
				break
			}
			
		}
		static update = function () {
			
			tick_cursored = point_in_rectangle(mouse_x, mouse_y, x, y, x + xlen, y + ylen);
			tick_clicked = tick_cursored * global.tick_mbl_pressed;
			if (!tick_cursored)
				return;
			
			
		}
	#endregion
	
}