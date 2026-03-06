extends Node


var mainControl: Control : set = setMainControl, get = getMainControl
var overlayWindow: Window : set = setOverlayWindow, get = getOverlayWindow

func setMainControl(newMain: Control) -> void:
	mainControl = newMain
	
func getMainControl() -> Control:
	return mainControl

func setOverlayWindow(newOverlay: Window) -> void:
	overlayWindow = newOverlay
	
func getOverlayWindow() -> Window:
	return overlayWindow
