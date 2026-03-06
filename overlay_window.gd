extends Window

@onready var global: Node = $"/root/Global"
@onready var bgColourRect: ColorRect = $ColorRect
@onready var imageSprite: Sprite2D = $imageOverlay
@onready var mathUtils: Node = $"/root/mathUtils"

var windowSize: Vector2i = Vector2i.ZERO
var loadedImageSize: Vector2i = Vector2i.ZERO
var borderlessMode: bool = false

func _ready() -> void:
	global.setOverlayWindow(self)
	windowSize = DisplayServer.screen_get_size(DisplayServer.get_primary_screen())

func _on_close_requested() -> void:
	get_tree().root.queue_free()

func _on_toggle_bg_button_pressed() -> void:
	if not bgColourRect.visible:
		bgColourRect.show()
	else:
		bgColourRect.hide()

func _on_file_dialog_file_selected(path: String) -> void:
	print("Attempting to open: %s" % path)
	if path.ends_with(".webp") or path.ends_with(".png") or path.ends_with(".jpg"):
		var image = Image.new()
		
		var error = image.load(path)
		
		if error != OK:
			print("Failed to load image:", error)
		else:
			var texture = ImageTexture.new()
			@warning_ignore("static_called_on_instance")
			texture = texture.create_from_image(image)
			imageSprite.set_texture(texture)
			loadedImageSize = Vector2i(texture.get_size())
		
	else:
		printerr("Failed to open file due to not being the correct file type.")
		return

func _on_open_button_pressed() -> void:
	get_parent().emit_signal("startFileDialog")

func _on_opacity_h_slider_value_changed(value: float) -> void:
	var currentModulate: Color = imageSprite.get_modulate()
	currentModulate.a =  value / 100
	imageSprite.set_modulate(currentModulate)

func _on_scale_h_slider_value_changed(value: float) -> void:
	imageSprite.set_scale(Vector2(value, value))


func _on_pos_xh_slider_value_changed(value: float) -> void:
	var newX:float = mathUtils.fromPercentage(value, 0, windowSize.x)
	imageSprite.global_position.x = newX
	var mainControl: Control = Global.getMainControl()
	if mainControl:
		mainControl.updateXEdit(int(value))

func _on_pos_yh_slider_value_changed(value: float) -> void:
	var newX:float = mathUtils.fromPercentage(value, 0, windowSize.y)
	imageSprite.global_position.y = newX
	var mainControl: Control = Global.getMainControl()
	if mainControl:
		mainControl.updateYEdit(int(value))
	
func _on_pos_y_line_edit_text_submitted(new_text: String) -> void:
	var mainControl: Control = Global.getMainControl()
	if mainControl:
		if typeof(new_text.to_int()) == TYPE_INT:
			mainControl.updateYSlider(int(new_text))
		else:
			mainControl.resetYEdit()
		

func _on_pos_x_line_edit_text_submitted(new_text: String) -> void:
	var mainControl: Control = Global.getMainControl()
	if mainControl:
		if typeof(new_text.to_int()) == TYPE_INT:
			mainControl.updateXSlider(int(new_text))
		else:
			mainControl.resetXEdit()
