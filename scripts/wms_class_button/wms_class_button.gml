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
			
		}
		static draw_mode = function (_argument) {
			
		}
	#endregion
	
	#region public methods
		static draw = function () {
			draw_update_surfaces();
		}
	#endregion
	
}