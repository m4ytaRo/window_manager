global.surface_reference_handler = new wms_surface_reference_handler();

test_button = new wms_button("ok_button", {x : 64, y : 64, xlen : 64, ylen : 64}, {})
test_enterbox = new wms_button("namespace_ebox", {x : 64, y : 196, xlen : 64, ylen : 32}, {})

global.font_manager = new wms_font_manager();
global.font_manager.add_fonts([fnt_main]);
global.font_manager.set_active_font(fnt_main)
global.font_manager.apply_font();