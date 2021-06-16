class_name Layout

static func scale_number(value: float) -> float:
	return value * OS.get_screen_dpi(OS.get_current_screen()) / 160


## This modifies the passed StyleBox
static func scale_stylebox(style_box: StyleBox) -> StyleBox:
	style_box.content_margin_left = scale_number(style_box.content_margin_left)
	style_box.content_margin_right = scale_number(style_box.content_margin_right)
	style_box.content_margin_top = scale_number(style_box.content_margin_top)
	style_box.content_margin_bottom = scale_number(style_box.content_margin_bottom)
	return style_box

## This modifies the passed Theme
static func scale_theme(theme: Theme) -> Theme:
	for node_type in theme.get_type_list(""):
		for name in theme.get_constant_list(node_type):
			var constant: int = theme.get_constant(name, node_type)
			theme.set_constant(name, node_type, scale_number(constant))

		for name in theme.get_stylebox_list(node_type):
			scale_stylebox(theme.get_stylebox(name, node_type))
	return theme
