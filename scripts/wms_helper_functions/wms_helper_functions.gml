#region short names

#region mouse left button

	function mbl_press ()	{return mouse_check_button_pressed(mb_left)}
	function mbl_hold ()	{return mouse_check_button(mb_left)}
	function mbl_rel ()		{return mouse_check_button_released(mb_left)}

#endregion

#region mouse middle button

	function mbm_press ()	{return mouse_check_button_pressed(mb_middle)}
	function mbm_hold ()	{return mouse_check_button(mb_middle)}
	function mbm_rel ()		{return mouse_check_button_released(mb_middle)}

#endregion

#region mouse right button

	function mbr_press ()	{return mouse_check_button_pressed(mb_right)}
	function mbr_hold ()	{return mouse_check_button(mb_right)}
	function mbr_rel ()		{return mouse_check_button_released(mb_right)}

#endregion

#region keyboard letters
	function a_press ()	{return keyboard_check_pressed(ord(	"A"))}
	function a_hold ()	{return keyboard_check(	ord(		"A"))}
	function a_rel ()	{return keyboard_check_released(ord("A"))}
	
	function d_press ()	{return keyboard_check_pressed(ord(	"D"))}
	function d_hold ()	{return keyboard_check(	ord(		"D"))}
	function d_rel ()	{return keyboard_check_released(ord("D"))}
	
	function w_press ()	{return keyboard_check_pressed(ord(	"W"))}
	function w_hold ()	{return keyboard_check(	ord(		"W"))}
	function w_rel ()	{return keyboard_check_released(ord("W"))}
	
	function s_press ()	{return keyboard_check_pressed(ord(	"S"))}
	function s_hold ()	{return keyboard_check(	ord(		"S"))}
	function s_rel ()	{return keyboard_check_released(ord("S"))}
	
	function t_press ()	{return keyboard_check_pressed(ord(	"T"))}
	function t_hold ()	{return keyboard_check(	ord(		"T"))}
	function t_rel ()	{return keyboard_check_released(ord("T"))}
	
	function p_press ()	{return keyboard_check_pressed(ord(	"P"))}
	function p_hold ()	{return keyboard_check(	ord(		"P"))}
	function p_rel ()	{return keyboard_check_released(ord("P"))}
	
	function r_press ()	{return keyboard_check_pressed(ord(	"R"))}
	function r_hold ()	{return keyboard_check(	ord(		"R"))}
	function r_rel ()	{return keyboard_check_released(ord("R"))}
	
	function shift_press ()	{return keyboard_check_pressed	(vk_shift)}
	function shift_hold ()	{return keyboard_check			(vk_shift)}
	function shift_rel ()	{return keyboard_check_released	(vk_shift)}
	
	function ctrl_press ()	{return keyboard_check_pressed	(vk_control)}
	function ctrl_hold ()	{return keyboard_check			(vk_control)}
	function ctrl_rel ()	{return keyboard_check_released	(vk_control)}
	
	function enter_press ()	{return keyboard_check_pressed	(vk_enter)}
	function enter_hold ()	{return keyboard_check			(vk_enter)}
	function enter_rel ()	{return keyboard_check_released	(vk_enter)}
	
	function backspace_press ()	{return keyboard_check_pressed	(vk_backspace)}
	function backspace_hold ()	{return keyboard_check			(vk_backspace)}
	function backspace_rel ()	{return keyboard_check_released	(vk_backspace)}
#endregion

#endregion

function len (_data) {
	if is_array(_data) return array_length(_data)
	if is_string(_data) return string_length(_data)
	return 0;
}

function point_in_rectangle_array (_cort) {
	//return point_in_rectangle(mouse_x, mouse_y, _cort[0],_cort[1],_cort[2],_cort[3])
	if (mouse_x > _cort[0])
		if (mouse_x < _cort[2])
			if (mouse_y > _cort[1])
				if (mouse_y < _cort[3])
					return true
	return false
}

function rectangle_operations (_cort) {
	var is_in_rec = point_in_rectangle_array(_cort)
	return [is_in_rec, is_in_rec*mbl_press()]
}
	
function circle_operations (_cort) {
	var is_in_circle = point_in_circle(mouse_x, mouse_y, _cort[0], _cort[1], _cort[2])
	return [is_in_circle, is_in_circle*mbl_press()]
}

function draw_rectangle_custom(x1_, y1_, x2_, y2_, color, width) {
	draw_set_color(color)
	draw_line_width(x1_, y1_, x2_, y1_, width)
	draw_line_width(x2_, y1_, x2_, y2_, width)
	draw_line_width(x2_, y2_, x1_, y2_, width)
	draw_line_width(x1_, y2_, x1_, y1_, width)
	draw_set_color(c_white)
}

function draw_rectangle_sprited_custom (_structure, _coords, _text_params) {
	
	var local_sprite = _structure.local_sprite;
	
	var lp_width = sprite_get_width(local_sprite);
	var lp_height = sprite_get_height(local_sprite);
	
	var scale = _structure.scale;
	
	var ls_w = lp_width * scale;
	var ls_h = lp_height * scale;
	
	var lt_corner_index = _structure.lt_corner_index;
	var rt_corner_index = _structure.rt_corner_index;
	var rb_corner_index = _structure.rb_corner_index;
	var lb_corner_index = _structure.lb_corner_index;
	
	var b_side_index = _structure.b_side_index;
	var r_side_index = _structure.r_side_index;
	var t_side_index = _structure.t_side_index;
	var l_side_index = _structure.l_side_index;
	
	
	
	var localX = _coords.x;
	var localY = _coords.y;
	var localXLen = max(_coords.xlen, ls_w);
	var localYLen = max(_coords.ylen, ls_h);
	
	var background_sprite = _structure.background_sprite
	var grad_clr_01 = c_black
	var grad_clr_02 = c_black
	var grad_clr_03 = c_black
	var grad_clr_04 = c_black
	if (background_sprite == undefined) {
		grad_clr_01 = _structure.gradient_settings.grad_clr_01
		grad_clr_02 = _structure.gradient_settings.grad_clr_02
		grad_clr_03 = _structure.gradient_settings.grad_clr_03
		grad_clr_04 = _structure.gradient_settings.grad_clr_04
	}
	
	var local_text = _text_params.text;
	var local_font = _text_params.font;
	var do_center = _text_params.do_center;
	var average_width = _text_params.average_width
	var text_color = _text_params.color;

	
	if (background_sprite == undefined) {
		draw_rectangle_color(localX, localY, localX + localXLen - 2, localY + localYLen - 2, grad_clr_01, grad_clr_02, grad_clr_03, grad_clr_04, false);
	}
	#region drawing borders
	var additionalX =  (localXLen < 2*ls_w) ? 1 : 2
	var additionalY =  (localYLen < 2*ls_h) ? 1 : 2
	for (var i = 0; i < ((localXLen - ls_w * 2) div (ls_w) + additionalX); ++ i) {
		draw_sprite_ext(local_sprite, t_side_index, ls_w/2 + localX + i  *ls_w, localY + ls_h / 2, scale, scale, 0, c_white, 1);
	}
	for (var i = 0; i < ((localXLen - ls_w * 2) div (ls_w) + additionalX); ++ i) {
		draw_sprite_ext(local_sprite, b_side_index, ls_w/2 + localX + i * ls_w, localY + localYLen - ls_h / 2, scale, scale, 0, c_white, 1);
	}
	for (var i = 0; i < ((localYLen - ls_h * 2) div (ls_h) + additionalY); ++ i) {
		draw_sprite_ext(local_sprite, l_side_index, localX + ls_w / 2, localY + ls_h / 2 + i * ls_h, scale, scale, 0, c_white, 1);
	}
	for (var i = 0; i < ((localYLen - ls_h * 2) div (ls_h) + additionalY); ++ i) {
		draw_sprite_ext(local_sprite, r_side_index, localX + localXLen - ls_w/2, localY + ls_h / 2 + i * ls_h, scale, scale, 0, c_white, 1);
	}
	#endregion
	#region drawing corner sprites
	draw_sprite_ext(local_sprite, lt_corner_index, localX + lp_width/2*scale, localY + lp_height/2*scale, scale, scale, 0, c_white, 1);
	draw_sprite_ext(local_sprite, rt_corner_index, localX + localXLen - lp_width/2*scale, localY + lp_height/2*scale, scale, scale, 0, c_white, 1);
	draw_sprite_ext(local_sprite, lb_corner_index, localX + lp_width/2*scale, localY + localYLen - lp_height/2*scale, scale, scale, 0, c_white, 1);
	draw_sprite_ext(local_sprite, rb_corner_index, localX + localXLen - lp_width/2*scale,localY + localYLen - lp_height/2*scale, scale, scale, 0, c_white, 1);
	#endregion
	#region text drawing
	var prev_font = draw_get_font();
	draw_set_font(fnt_main);
	
	var length = len(local_text)
	draw_text_color(localX + localXLen / 2 - length * average_width / 2, localY + localYLen / 2 - average_width / 2, local_text, text_color, text_color, text_color, text_color, 1);
	
	draw_set_font(prev_font);
	#endregion

}
	
function draw_rectangle_pattern(_coords_struc, _pattern, _txtparam, _options, _sprite_data) {

	#region documentation
	/*
	_options = [activated, cursored, etc.]
	_txtparam = [{string}, {center_horizontally}, {center_vertically}, {delta_x}, {letter_width}, {letter_height}]
	*/
	#endregion
	
	var lx1 = _coords_struc.x
	var ly1 = _coords_struc.y
	var lx2 = _coords_struc.x + _coords_struc.xlen
	var ly2 = _coords_struc.y + _coords_struc.ylen
	
	var activated	= _options.activated
	var cursored	= _options.cursored
	
	var def_gradientmap_border, def_gradientmap_space
	var act_gradientmap_border, act_gradientmap_space
	var cur_gradientmap_border, cur_gradientmap_space
	
	switch (_pattern) { //working with gradient maps according to pattern
		case DRAW_PATTERN_EBOX:
			def_gradientmap_border	= gmap_clean_dkgray20
			def_gradientmap_space	= gmap_dkgray40_dkgray20
			
			cur_gradientmap_border	= gmap_dkgray_gray
			cur_gradientmap_space	= gmap_gray_white
			
			act_gradientmap_border	= gmap_lime_green
			act_gradientmap_space	= gmap_green_lime
		break
		case DRAW_PATTERN_BUTTON:
			def_gradientmap_border	= gmap_dkgray_gray
			def_gradientmap_space	= gmap_gray_dkgray
			
			cur_gradientmap_border	= gmap_white_gray
			cur_gradientmap_space	= gmap_gray_white
			
			act_gradientmap_border	= gmap_lime_green
			act_gradientmap_space	= gmap_green_lime
		break
		default:
			def_gradientmap_border	= gmap_dkgray_gray
			def_gradientmap_space	= gmap_gray_dkgray
			
			cur_gradientmap_border	= gmap_white_gray
			cur_gradientmap_space	= gmap_gray_white
			
			act_gradientmap_border	= gmap_lime_green
			act_gradientmap_space	= gmap_green_lime
		break
	}
	
	#region choosing pattern according to mode (def, activated or cursored)
	
	var local_border_pattern, local_space_pattern
	if activated {		local_border_pattern = act_gradientmap_border;
						local_space_pattern = act_gradientmap_space}
						
	else if cursored {	local_border_pattern = cur_gradientmap_border;
						local_space_pattern = cur_gradientmap_space}
						
	else	{			local_border_pattern = def_gradientmap_border;
						local_space_pattern = def_gradientmap_space}
	
	draw_rectangle_color(lx1, ly1, lx2, ly2, local_space_pattern[0], local_space_pattern[1], local_space_pattern[2], local_space_pattern[3], false)
	draw_rectangle_color(lx1 + 1, ly1 + 1, lx2 - 2, ly2 -2 , local_border_pattern[0], local_border_pattern[1], local_border_pattern[2], local_border_pattern[3], true)
	
	#endregion
	
	#region txt drawing
	
	var ltxtx = lx1
	var ltxty = ly1
	
	var local_xlen = lx2 - lx1
	var local_ylen = ly2 - ly1
	
	var str					= _txtparam.text
	var center_horizontally = _txtparam.do_center
	var center_vertically	= true
	var delta_x				= 0
	var average_width		= _txtparam.average_size
	var average_height		= _txtparam.average_size
	
	
	if center_horizontally {ltxtx = ltxtx + local_xlen/2 - letter_width*len(str)}
	if center_vertically {ltxty = ltxty + local_ylen/2 - letter_height}
	if cursored draw_set_color(c_dkgray)
	draw_text(ltxtx + delta_x, ltxty, str)
	draw_set_color(c_white)
	#endregion
	
	#region sprite drawing
	if (_sprite_data != undefined) {
		var lsprx		= _sprite_data[2]
		var lspry		= _sprite_data[3]
		
		var lspr		= _sprite_data[0]
		
		var lspr_index	= _sprite_data[1]
		
		var lspr_scale = _sprite_data[4]
		
		if lspr != undefined {
			draw_sprite_ext(lspr, lspr_index, lsprx, lspry, lspr_scale, lspr_scale, 0, c_white, 1)
		}
	}

	
	#endregion
	
}
	
function get_integer_from_string (_string) {
	var str_digits = string_digits(_string)
	if str_digits == "" return 0
	var lsign
	if string_char_at(_string, 0) == "-" lsign = -1
	else lsign = 1
	
	
	return real(str_digits)* lsign
}

	
function vec2 (xx, yy) constructor {
	self.xx = xx
	self.yy = yy
}
	
