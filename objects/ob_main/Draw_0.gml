global.surface_reference_handler.draw_update_surfaces();
test_button.draw();

draw_rectangle_sprited_custom({
	local_sprite : sp_standard_button_borders,
	lt_corner_index : 0, 
	rt_corner_index : 1, 
	rb_corner_index : 2,
	lb_corner_index : 3, 
	
	b_side_index  : 4,
	r_side_index  : 5,
	t_side_index  : 6,
	l_side_index  : 7,
	scale : 2,
	background_sprite : undefined,
	gradient_settings : {grad_clr_01 : c_gray, grad_clr_02 : c_gray, grad_clr_03 : c_gray, grad_clr_04 : c_gray}
}, {
	x : 64,
	y : 64,
	xlen : mouse_x - 64, 
	ylen : mouse_y - 64
}, {
	text : "Open",
	font : fnt_main,
	do_center : true,
	average_width : 8
} 

)