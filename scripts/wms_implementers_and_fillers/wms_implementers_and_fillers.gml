function get_button_settings (_name) {
	//this function will help you to tune visuals of buttons
	var pattern_, txtparam_, options_, sprite_data_
	//_name is the name of global pattern. Basically this is how button we look
	//
	/*
	documentation
	sprite data [sprite, sprite_index, scale, rotation, alpha]
	*/
	switch (_name) {
		#region proba
			case "proba":
				pattern_		= undefined
				txtparam_		= ["OK", true, true, 0, 5, 10]
				sprite_data_	= [undefined, -1, 0, 0, 1]
			break
			case "close_button":
				pattern_		= undefined
				txtparam_		= ["X", true, true, 0, 5, 10]
				sprite_data_	= [undefined, -1, 0, 0, 1]
			break
			case "move_up_button":
				pattern_		= undefined
				txtparam_		= ["", true, true, 0, 5, 10]
				sprite_data_	= [sp_main, 1, 0, 2, 1]
			break
			case "move_right_button":
				pattern_		= undefined
				txtparam_		= ["", true, true, 0, 5, 10]
				sprite_data_	= [sp_main, 1, -90, 2, 1]
			break
			case "move_left_button":
				pattern_		= undefined
				txtparam_		= ["", true, true, 0, 5, 10]
				sprite_data_	= [sp_main, 1, 90, 2, 1]
			break
			case "move_down_button":
				pattern_		= undefined
				txtparam_		= ["", true, true, 0, 5, 10]
				sprite_data_	= [sp_main, 1, 180, 2, 1]
			break
			case "grid_button":
				pattern_		= undefined
				txtparam_		= ["", true, true, 0, 5, 10]
				sprite_data_	= [sp_icons, 0, 0, 4, 1]
			break
			case "height_show_button":
				pattern_		= undefined
				txtparam_		= ["", true, true, 0, 5, 10]
				sprite_data_	= [sp_icons, 1, 0, 4, 1]
			break
			case "create_obj_button":
				pattern_		= undefined
				txtparam_		= ["", true, true, 0, 5, 10]
				sprite_data_	= [sp_icons, 2, 0, 4, 1]
			break
			case "delete_obj_button":
				pattern_		= undefined
				txtparam_		= ["", true, true, 0, 5, 10]
				sprite_data_	= [sp_icons, 3, 0, 4, 1]
			break
			case "save_level_button":
				pattern_		= undefined
				txtparam_		= ["", true, true, 0, 5, 10]
				sprite_data_	= [sp_icons, 4, 0, 4, 1]
			break
			case "load_level_button":
				pattern_		= undefined
				txtparam_		= ["", true, true, 0, 5, 10]
				sprite_data_	= [sp_icons, 1, 0, 4, 1]
			break
		
			case ENTERBOX_DRAW_SETTING:
				pattern_		= DRAW_PATTERN_EBOX
				txtparam_		= ["", true, true, 0, 5, 10]
				sprite_data_	= [undefined, -1, 0, 0, 1]
			break
			case BUTTON_DRAW_SETTING:
				pattern_		= DRAW_PATTERN_BUTTON
				txtparam_		= ["", true, true, 0, 5, 10]
				sprite_data_	= [undefined, -1, 0, 0, 1]
			break
			default:
				pattern_		= undefined
				txtparam_		= ["OK", true, true, 0, 5, 10]
				sprite_data_	= [undefined, -1, 0, 0, 1]
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