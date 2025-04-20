function get_button_settings (_name) {
	//this function will help you to tune visuals of buttons
	var pattern_, txtparam_, options_, sprite_data_
	//_name is the name of global pattern. Basically this is how button we look
	//
	/*
	documentation
	*/
	switch (_name) {
		#region proba
			case "ok_button_64x32":
				pattern_		= undefined
				txtparam_		= {text: "OK", center_horizontally: true, center_vertically: true, delta_x : 0	};
				sprite_data_	= {sprite: undefined, index : -1, rotation : 0, scale : 0, alpha : 1};
			break
			case "close_button_64x32":
				pattern_		= undefined
				txtparam_		= { text: "X", center_horizontally: true, center_vertically: true, delta_x : 0};
				sprite_data_	= {sprite: undefined, index : -1, rotation : 0, scale : 0, alpha : 1};
			break
			case "move_up_button":
				pattern_		= undefined
				txtparam_		= { text: "", center_horizontally: true, center_vertically: true, delta_x : 0};
				sprite_data_	= {sprite: sp_button_arrow, index : 1, rotation : 0, scale : 2, alpha : 1};
			break
			case "move_right_button":
				pattern_		= undefined
				txtparam_		= {text: "", center_horizontally: true, center_vertically: true, delta_x : 0};
				sprite_data_	= {sprite: sp_button_arrow, index : 1, rotation : -90, scale : 0, alpha : 1};
			break
			case "move_left_button":
				pattern_		= undefined
				txtparam_		= {text: "", center_horizontally: true, center_vertically: true, delta_x : 0};
				sprite_data_	= {sprite: sp_button_arrow, index : 1, rotation : 90, scale : 2, alpha : 1};
			break
			case "move_down_button":
				pattern_		= undefined
				txtparam_		= {text: "", center_horizontally: true, center_vertically: true, delta_x : 0};
				sprite_data_	= {sprite: sp_button_arrow, index : 1, rotation : 180, scale : 2, alpha : 1};

			break
			case "grid_button":
				pattern_		= undefined
				txtparam_		= {text: "", center_horizontally: true, center_vertically: true, delta_x : 0};
				sprite_data_	= {sprite: sp_button_arrow, index : 0, rotation : 0, scale : 4, alpha : 1};
			break
			case "height_show_button":
				pattern_		= undefined
				txtparam_		= {text: "", center_horizontally: true, center_vertically: true, delta_x : 0};
				sprite_data_	= {sprite: sp_button_arrow, index : 1, rotation : 0, scale : 4, alpha : 1};
			break
			case "create_obj_button":
				pattern_		= undefined
				txtparam_		= {text: "", center_horizontally: true, center_vertically: true, delta_x : 0};
				sprite_data_	= {sprite: sp_button_arrow, index : 2, rotation : 0, scale : 4, alpha : 1};
			break
			case "delete_obj_button":
				pattern_		= undefined
				txtparam_		= {text: "", center_horizontally: true, center_vertically: true, delta_x : 0};
				sprite_data_	= {sprite: sp_button_arrow, index : 3, rotation : 0, scale : 4, alpha : 1};
			break
			case "save_level_button":
				pattern_		= undefined
				txtparam_		= {text: "", center_horizontally: true, center_vertically: true, delta_x : 0};
				sprite_data_	= {sprite: sp_button_arrow, index : 4, rotation : 0, scale : 4, alpha : 1};
			break
			case "load_level_button":
				pattern_		= undefined
				txtparam_		= {text: "", center_horizontally: true, center_vertically: true, delta_x : 0};
				sprite_data_	= {sprite: sp_button_arrow, index : 0, rotation : 0, scale : 4, alpha : 1};
			break
		
			case ENTERBOX_DRAW_SETTING:
				pattern_		= DRAW_PATTERN_EBOX
				txtparam_		= {text: "", center_horizontally: true, center_vertically: true, delta_x : 0};
				sprite_data_	= {sprite: undefined, index : -1, rotation : 0, scale : 0, alpha : 1};
			break
			case BUTTON_DRAW_SETTING:
				pattern_		= DRAW_PATTERN_BUTTON
				txtparam_		= {text: "", center_horizontally: true, center_vertically: true, delta_x : 0};
				sprite_data_	= {sprite: undefined, index : -1, rotation : 0, scale : 0, alpha : 1};
			break
			default:
				pattern_		= undefined
				txtparam_		= {text: "", center_horizontally: true, center_vertically: true, delta_x : 0};
				sprite_data_	= {sprite: undefined, index : -1, rotation : 0, scale : 0, alpha : 1};
			break;
		#endregion
	}
	
	return {pattern:pattern_,
			txtparam:txtparam_,
			sprite_data:sprite_data_
			}
			
}

function window_fill_containers(_pointer){
	
}