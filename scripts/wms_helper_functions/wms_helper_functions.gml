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
	
