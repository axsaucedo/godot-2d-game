extends "res://Doors/Door.gd"

func _on_Door_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$CanvasLayer/Numpad.popup_centered()

func _on_Door_body_exited(body):
	if body.collision_layer == 1:
		$CanvasLayer/Numpad.hide()
		can_click = false

func _on_Numpad_combination_correct():
	open()
	$CanvasLayer/Numpad.hide()