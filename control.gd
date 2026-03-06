extends Control

@onready var fileDialog: FileDialog = $FileDialog
@onready var posXSlider: HSlider = $VBoxContainer/PositionContainer/VBoxContainer/XContainer/PosXHSlider
@onready var posYSlider: HSlider = $VBoxContainer/PositionContainer/VBoxContainer/YContainer/PosYHSlider
@onready var posXEdit: LineEdit = $VBoxContainer/PositionContainer/VBoxContainer/XContainer/PosXLineEdit
@onready var posYEdit: LineEdit = $VBoxContainer/PositionContainer/VBoxContainer/YContainer/PosYLineEdit
@onready var global:Node = $"/root/Global"

@warning_ignore("unused_signal")
signal startFileDialog

func _ready() -> void:
	global.setMainControl(self)

func _on_file_dialog_confirmed() -> void:
	fileDialog.hide()

func _on_start_file_dialog() -> void:
	fileDialog.show()

func resetYEdit():
	posYEdit.set_text(str(int(posYSlider.get_value())))
	
func updateYSlider(newValue: int):
	posYSlider.set_value(newValue)
	
func updateYEdit(newValue: int):
	posYEdit.set_text(str(newValue))
	
func resetXEdit():
	posXEdit.set_text(str(int(posXSlider.get_value())))
	
func updateXSlider(newValue: int):
	posXSlider.set_value(newValue)
	
func updateXEdit(newValue: int):
	posXEdit.set_text(str(newValue))
