function wms_window (_name, _coord_structure) constructor {
	
	#region variables
	
		#region basic variables
		
		x		= _coord_structure.x;
		y		= _coord_structure.y;
		xlen	= _coord_structure.xlen;
		ylen	= _coord_structure.ylen;
		
		name			= _name;
		display_name	= "blank"
		self_pointer	= ptr(self);
		
		is_tick_cursored = false;
		
		needs_draw_update = false;
		needs_tick_update = false;
		
		is_pinned = false;
		
		//moving window parameters
		is_moving = false;
		xstart_from = 0;
		ystart_from = 0;
		xstart_prev = 0;
		ystart_prev = 0;
		//------------------------
		
		static window_space_height = GLOBAL_WINDOW_PARAM.BORDER_DELTA;
		
		#endregion
		
		#region surface variables
		
		main_surface = -1;
		workfield_surface = -1;
		single_object_surface = -1;
		
		#endregion
		
		#region container variables
		
		main_container = [];
		workfield_container = [];
		window_fill_containers(self_pointer);
		wc_mode = 0;
		
		grab_windows_container = [];
		
		#endregion
	
	#endregion
	
	#region private methods
	static draw_update_surfaces = function () {
		//function will be placed in the start of draw_main() and will
		//always check whether surfaces exists or not
		
	}
	#endregion
	
	#region public methods
	static draw_main = function () {
		
	}
	static draw_update_surface = function (_argument, _no_excuses) {
		//function will redraw surface if it doesnt exist
		//if parameter _no_excuses is true, surface will be updated guaranteed
		
		
		
	}
	
	static update = function (_no_excuses) {
		if (_no_excuses == undefined)
			_no_excuses = false;
		if (needs_tick_update)
			_no_excuses = true;
		
		#region excuses
		
		#region explanation
			//in this block function will try to find reasons to not work
			//if _no_excuses parameter is true, this block will be ignored
			//There are a few reasons:
			/*
			1) another's window update method was called
			2) cursor is out of window (as a result there is almost no interaction possible)
			3) there is no active objects inside (like opened enterbox or rolling circle)
			*/
		#endregion
			
		if (!_no_excuses) {
			
		}
		
		#endregion
		
		
	}
	
	#endregion
	

}
