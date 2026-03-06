extends Control

@onready var fileDialog: FileDialog = $FileDialog
@onready var posXSlider: HSlider = $VBoxContainer/PositionContainer/VBoxContainer/XContainer/PosXHSlider
@onready var posYSlider: HSlider = $VBoxContainer/PositionContainer/VBoxContainer/YContainer/PosYHSlider
@onready var posXEdit: LineEdit = $VBoxContainer/PositionContainer/VBoxContainer/XContainer/PosXLineEdit
@onready var posYEdit: LineEdit = $VBoxContainer/PositionContainer/VBoxContainer/YContainer/PosYLineEdit
@onready var global:Node = $"/root/Global"

signal startFileDialog

func _ready() -> void:
	global.setMainControl(self)

func _on_file_dialog_confirmed() -> void:
	fileDialog.hide()

func _on_start_file_dialog() -> void:
	fileDialog.show()

func resetYEdit():
	posYEdit.set_text(str(posYSlider.get_value()))
